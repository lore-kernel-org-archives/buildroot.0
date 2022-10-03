Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75D2C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 06:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 128DA408E5;
	Mon,  3 Oct 2022 06:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128DA408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvw92iUZ9_EZ; Mon,  3 Oct 2022 06:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1E4E408D5;
	Mon,  3 Oct 2022 06:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1E4E408D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 960AF1BF275
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 06:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74577408D5
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 06:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74577408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2sYJNbpma0O for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 06:47:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E4C408CC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85E4C408CC
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 06:47:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 52CCA1C0004
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 06:47:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1ofFEj-00DfcM-A5
 for buildroot@buildroot.org; Mon, 03 Oct 2022 08:47:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 03 Oct 2022 08:47:33 +0200
Message-ID: <87o7uttncq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.08.1 released
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
MjIuMDguMSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjA4LjEudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjA4LjEudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjA4LjEgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIu
MDggcmVsZWFzZS4KCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGJ1c3lib3gsIGRvY2tlci1lbmdpbmUs
IGV4cGF0LCBnaXQsIGhlaXJsb29tLW1haWx4LAogIGxpYmNvbmZ1c2UsIGxpYnhtbDIsIG1hcmlh
ZGIsIHB5dGhvbjMsIHRpbnlwcm94eSwgdW5ib3VuZCwgdW56aXAsIHZpbQoKLSBGaXhlcyBmb3Ig
ZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBib3RhbiwKICBk
b2NrZXItY2xpLCBoYXByb3h5LCBpY3UsIGlteC1ncHUtdml2LCBsaWJtZGJ4LCBsaWJ1cG5wLAog
IGx0cC10ZXN0c3VpdGUsIG00LCBtYWtlZGV2cywgbWVzYTNkLCBtZXNvbiwgbW9zcXVpdHRvLCBu
Y3Vyc2VzLAogIG9wZW5zc2gsIHBhbmdvLCBxbGliYywgcXQ1eG1scGF0dGVybnMsIHJ0bDgxODll
cywgcnRsODcyM2J1LAogIHJ0bDg3MjNkcywgcnRsODgxMmF1LWFpcmNyYWNrLW5nLCBydW5jLCBz
b3gsIHVhY21lLCB4dGFibGVzLWFkZG9ucwoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFO
R0VTIGZpbGU6CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFO
R0VTP2lkPTIwMjIuMDguMQoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJv
bmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3Bs
ZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIyLjA4
Li4KCiAgICAxMSAgRmFicmljZSBGb250YWluZQogICAgMTEgIEdpdWxpbyBCZW5ldHRpCiAgICAg
NSAgWWFubiBFLiBNT1JJTgogICAgIDQgIEphbWVzIEhpbGxpYXJkCiAgICAgNCAgTGFuZyBEYW5p
ZWwKICAgICA0ICBMdWNhIENlcmVzb2xpCiAgICAgNCAgUGV0ZXIgS29yc2dhYXJkCiAgICAgNCAg
VGhvbWFzIFBldGF6em9uaQogICAgIDMgIENocmlzdGlhbiBTdGV3YXJ0CiAgICAgMyAgRnJhbmNv
aXMgUGVycmFkCiAgICAgMiAgTmljb2xhIERpIExpZXRvCiAgICAgMiAgUXVlbnRpbiBTY2h1bHoK
ICAgICAxICBCYXJ1Y2ggU2lhY2gKICAgICAxICBKb2FjaGltIFdpYmVyZwogICAgIDEgIEpvZWwg
U3RhbmxleQogICAgIDEgIEt5bGUgSGFyZGluZwogICAgIDEgIE1pY2hhZWwgS2xlaW4KICAgICAx
ICBQZXRlciBTZWlkZXJlcgogICAgIDEgIFBldHIgVm9yZWwKICAgICAxICDQm9C10L7QvdC40LQg
0K7RgNGM0LXQsiAoTGVvbmlkIFl1cmlldikKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
