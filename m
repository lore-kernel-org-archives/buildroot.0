Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AFFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 22:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5256141094;
	Thu, 24 Mar 2022 22:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O22aO1Il6uH6; Thu, 24 Mar 2022 22:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10D8D4107C;
	Thu, 24 Mar 2022 22:20:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1389F1BF36A
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 102DE41C6C
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NC2dxBNpSLhj for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 22:20:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1C4141C6A
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 22:20:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE575240005
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 22:20:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nXVor-00ArI9-MT
 for buildroot@buildroot.org; Thu, 24 Mar 2022 23:20:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 23:20:37 +0100
Message-ID: <87lewzc7re.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.11.3 released, 2021.11.x now EOL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjEuMTEuMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjExLjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjExLjMudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIxLjExLjMgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjEu
MTEuMiByZWxlYXNlLgoKLSBTZWN1cml0eSBmaXhlcyBmb3IgYXBhY2hlLCBleGVtcGksIGV4cGF0
LCBmbGFjLCBnbnV0bHMsIGdvLAogIGxpYmllYzYxODUwLCBsaWJvcGVuc3NsLCBsaWJwanNpcCwg
bGlicmVzc2wsIGxpYnhtbDIsIGxpYnhzbHQsCiAgbWFyaWFkYiwgbWluaWRsbmEsIG9wZW52cG4s
IHBocCwgcHl0aG9uLWlweXRob24sIHB5dGhvbi10d2lzdGVkLAogIHJhcHRvciwgc2FtYmE0LCBz
ZWF0ZCwgdGltZXNjYWxlZGIsIHV0aWwtbGludXgsIHZpbSwgd2F2cGFjaywKICB3aXJlc2hhcmss
IHdvbGZzc2wsIHh0ZXJtLCB6c2gKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1
bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4KICBhenVyZS1pb3Qtc2RrLCBib2luYywgZGJ1cywgZGly
ZWN0ZmIsIGRvY2tlci1lbmdpbmUsIGdkYiwgZ2RrLXBpeGJ1ZiwKICBoYXByb3h5LCBsaWJjdXJs
LCBsaWJtaW5pdXBucGMsIGxpYm9kYiwgbGlib2RiLWJvb3N0LCBsaWJyc3ZnLAogIGxpYnNydHAs
IGxpYnZpcnQsIGx4Yywgb2RiLCBvcGVuYmxhcywgb3Byb2ZpbGUsIHBwcGQsIHJwaS1maXJtd2Fy
ZSwKICB1c2JndWFyZCwgd2lyZWxlc3MtcmVnZGIsIHdpcmVwbHVtYmVyLCB4c2NyZWVuc2F2ZXIK
CkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9naXQuYnVp
bGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDIxLjExLjMKClVzZXJzIG9m
IHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1cGdyYWRl
LgoKTm90aWNlIHRoYXQgdGhlIDIwMjEuMTEueCBzZXJpZXMgaXMgbm93IEVORCBPRiBMSUZFLiBQ
bGVhc2UgbWlncmF0ZSB0bwp0aGUgMjAyMi4wMi54IHNlcmllcyBpbnN0ZWFkIHdoaWNoIHdpbGwg
YmUgc3VwcG9ydGVkIHVudGlsIEFwcmlsIDIwMjMuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBl
b3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIx
LjExLjIuLgoKICAgIDM5ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAgNiAgQmVybmQgS3VobHMKICAg
ICA2ICBQZXRlciBLb3JzZ2FhcmQKICAgICA1ICBUaG9tYXMgUGV0YXp6b25pCiAgICAgMyAgRnJh
bmNvaXMgUGVycmFkCiAgICAgMyAgUGV0ZXIgU2VpZGVyZXIKICAgICAyICBKdWxpZW4gT2xpdmFp
bgogICAgIDEgIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8KICAgICAxICBBbmRyZWkgR2hlcmdoZXNj
dQogICAgIDEgIEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWluZCkKICAgICAxICBD
aHJpc3RpYW4gU3Rld2FydAogICAgIDEgIEpvaG4gS2VlcGluZwogICAgIDEgIEthbWVsIEJvdWhh
cmEKICAgICAxICBLcmlzIEJhaG5zZW4KICAgICAxICBNYXhpbSBLb2NoZXRrb3YKICAgICAxICBS
b21haW4gTmFvdXIKICAgICAxICBTYXNzZW4sIFJ1dGdlcgogICAgIDEgIFNpbW9uIERvcHBsZXIK
ICAgICAxICBUSUFOIFl1YW5oYW8KICAgICAxICBUaMOpbyBMZWJydW4KICAgICAxICBZYW5uaWNr
IEJyb3NzZWF1CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
