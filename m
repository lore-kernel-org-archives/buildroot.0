Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38D9C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 14:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7956E416C1;
	Mon,  4 Dec 2023 14:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7956E416C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CiOVSkUYg_TS; Mon,  4 Dec 2023 14:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1DBA4090F;
	Mon,  4 Dec 2023 14:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1DBA4090F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22E161BF969
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 14:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08B144090F
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 14:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08B144090F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWuIgIc1EE1X for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 14:02:26 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E6204090E
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 14:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E6204090E
Received: by mail.gandi.net (Postfix) with ESMTPSA id F11C5240009
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 14:02:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rA9Wh-00Axaf-10
 for buildroot@buildroot.org; Mon, 04 Dec 2023 15:02:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 04 Dec 2023 15:02:23 +0100
Message-ID: <87jzput6a8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.02.8 released
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
MjMuMDIuOCBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjgudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjgudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjAyLjggaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMuMDIuNyByZWxlYXNlLgoKLSBEZWZjb25m
aWdzOiBSYXNwYmVycnlwaTogRml4IERUIG92ZXJsYXkgZm9yIGF1dG9wcm92aW5nIG9mIGJsdWV0
b290aAogIGRyaXZlciwgVG9yYWRleCBhcGFsaXMgaS5teDY6IEFkZCBkb3dubG9hZCBoYXNoZXMg
Zm9yIExpbnV4IGFuZAogIFUtQm9vdC4KCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGV4ZmF0cHJvZ3Ms
IGltYWdlbWFnaWNrLCBpbnRlbC1taWNyb2NvZGUsIGxpYnBqc2lwLAogIGxpYnhtbDIsIG1hcmlh
ZGIsIG1lbWNhY2hlZCwgcGVybCwgcG9zdGdyZXNxbCwgc2FtYmE0LCBzcXVpZCwgdmltLCB2bGMK
Ci0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMg
aW4gZ2NjLCBtb3Rpb24sCiAgbmV0c25tcCwgcnR0eSwgc3BlZWNoZCwgeGVub21haSwgeHRhYmxl
cy1hZGRvbnMsIHpmcwoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6Cgpo
dHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIwMjMu
MDIuOAoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJh
Z2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRp
bmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIzLjAyLjcuLgoKICAgIDE3
ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAgNyAgQmVybmQgS3VobHMKICAgICA1ICBKb3PDqSBMdWlz
IFNhbHZhZG9yIFJ1Zm8KICAgICAzICBGcmFuY29pcyBQZXJyYWQKICAgICAzICBQZXRlciBLb3Jz
Z2FhcmQKICAgICAyICBEYW5ueSBXb29kCiAgICAgMiAgR2HDq2wgUE9SVEFZCiAgICAgMiAgV2Fs
ZGVtYXIgQnJvZGtvcmIKICAgICAxICBCcmFuZG9uIE1haWVyCiAgICAgMSAgTWF4aW0gS29jaGV0
a292CiAgICAgMSAgTmljb2xhcyBDYXZhbGxhcmkKICAgICAxICBQZXRlciBTZWlkZXJlcgogICAg
IDEgIFRob21hcyBQZXRhenpvbmkKICAgICAxICBZYW5uIEUuIE1PUklOCgotLSAKQnllLCBQZXRl
ciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
