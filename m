Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9B2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 21:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC6D760C2B;
	Tue, 14 Dec 2021 21:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_4qraKWBsFk; Tue, 14 Dec 2021 21:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1452260C30;
	Tue, 14 Dec 2021 21:31:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1D441BF3C8
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 21:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFC9B409A9
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 21:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q57fOFgHqJrK for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 21:31:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2CBF4024E
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 21:31:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3C33460009
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 21:31:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mxFO4-0003uG-63
 for buildroot@buildroot.org; Tue, 14 Dec 2021 22:31:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 22:31:04 +0100
Message-ID: <87ilvqswkn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.02.8 released
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
MjEuMDIuOCBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjgudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjgudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wMi44IGlzIGEgYnVnZml4IHJlbGVhc2Ugb24gdGhlIGN1cnJlbnQgbG9uZyB0ZXJt
CnJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLyBzZWN1cml0eSByZWxhdGVk
IGlzc3VlcwpkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIxLjAyLjcgcmVsZWFzZS4KCi0gRml4ZWQg
YSBudW1iZXIgb2YgZGVmY29uZmlnIGJ1aWxkIGlzc3VlcyB3aXRoIGdjYyA+PSAxMCBob3N0IG9y
IHRhcmdldAogIGNvbXBpbGVycwoKLSBTZWN1cml0eSBmaXhlcyBmb3IgYmx1ZXo1X3V0aWxzLCBi
dXN5Ym94LCBnbXAsIGljdSwgamFudXMtZ2F0ZXdheSwKICBsaWJtb2RzZWN1cml0eSwgbGlibnNz
LCBwaHAsIHBvc3RncmVzcWwsIHB1cmUtZnRwZCwgc2FtYmE0LCBzdXJpY2F0YSwKICB2aW0sIHdp
cmVzaGFyawoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNl
IGlzc3VlcyBpbiBhbHNhLWxpYiwKICBhcHBhcm1vciwgYXByLCBhc3RlcmlzaywgYmludXRpbHMs
IGNvcmV1dGlscywgZTJmc3Byb2dzLCBlbGwsIGV4ZmF0LAogIGZyZWVzd2l0Y2gsIGdkYiwgZ2xt
YXJrMiwgZ2xvZywgZ2xvcnl0dW4sIGdwdS1hbWQtYmluLW14NTEsCiAgZ3N0MS1pbnRlcnBpcGUs
IGdzdHJlYW1lcjEsIGd1aWxlLCBndXBucCwgaGFja3JmLCBoZWltZGFsLCBoaWF3YXRoYSwKICBo
cGxpcCwgaW14LXZwdXdyYXAsIGlzbCwgaXdkLCBsaWJhdG9taWNfb3BzLCBsaWJic29uLCBsaWJk
bmV0LCBsaWJmZmksCiAgbGliZ2RpcGx1cywgbGliZ2VlLCBsaWJodHAsIGxpYm5zcHIsIGxpYnVu
d2luZCwgbHlueCwgbWVzb24sCiAgbWljcm9weXRob24sIG1rcGFzc3dkLCBta3NoLCBtb3NxdWl0
dG8sIG1vdGlvbiwgbXhtbCwgbmV0ZGF0YSwKICBuZnMtdXRpbHMsIG9yYWNsZS1teXNxbCwgcGNy
ZSwgcGtjczExLWhlbHBlciwgcHl0aG9uLWN5Y2xlciwgcWRlY29kZXIsCiAgcmN3LXNtYXJjLXNh
bDI4LCBzbWFjaywgc3BlZXgsIHN0cmVzcy1uZywgc3lzbGludXgsIHVib290LCB1bml4b2RiYywK
ICB1bnJhciwgd2Vic29ja2V0cHAKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBm
aWxlOgoKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9p
ZD0yMDIxLjAyLjgKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkg
ZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29u
dHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMS4wMi43Li4K
CiAgICA3MSAgRmFicmljZSBGb250YWluZQogICAgMTQgIFBldGVyIEtvcnNnYWFyZAogICAgMTEg
IFlhbm4gRS4gTU9SSU4KICAgIDEwICBCZXJuZCBLdWhscwogICAgIDggIEdpdWxpbyBCZW5ldHRp
CiAgICAgMyAgUGV0ZXIgU2VpZGVyZXIKICAgICAzICBSb21haW4gTmFvdXIKICAgICAzICBTw6li
YXN0aWVuIFN6eW1hbnNraQogICAgIDIgIENhcmxvcyBTYW50b3MKICAgICAyICBKb2FjaGltIFdp
YmVyZwogICAgIDIgIE1pY2hhZWwgTm9zdGhvZmYKICAgICAyICBUaXRvdWFuIENocmlzdG9waGUK
ICAgICAxICBCYXJ1Y2ggU2lhY2gKICAgICAxICBGYWJpbyBFc3RldmFtCiAgICAgMSAgSmFtZXMg
SGlsbGlhcmQKICAgICAxICBKb2huIEtlZXBpbmcKICAgICAxICBNYXJrdXMgTWF5ZXIKICAgICAx
ICBUaG9tYXMgUGV0YXp6b25pCiAgICAgMSAgVXJqYSBSYW5uaWtrbwoKLS0gCkJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
