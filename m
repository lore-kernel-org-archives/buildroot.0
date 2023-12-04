Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326F6C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 13:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C7D81F21;
	Mon,  4 Dec 2023 13:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C7D81F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LsJcokiMccc; Mon,  4 Dec 2023 13:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0327781F28;
	Mon,  4 Dec 2023 13:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0327781F28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAA821BF969
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 13:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B34F641711
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 13:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B34F641711
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjq3UR4EP_lp for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 13:37:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 402B3416D2
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 13:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 402B3416D2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CFE71C0006
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 13:37:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rA98Z-00Avnc-0b
 for buildroot@buildroot.org; Mon, 04 Dec 2023 14:37:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 04 Dec 2023 14:37:27 +0100
Message-ID: <87o7f6t7fs.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.08.4 released
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
MjMuMDguNCBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA4LjQudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA4LjQudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjA4LjQgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMu
MDguMyByZWxlYXNlLgoKLSBEZWZjb25maWdzOiBSYXNwYmVycnlwaTogRml4IERUIG92ZXJsYXkg
Zm9yIGF1dG9wcm92aW5nIG9mIGJsdWV0b290aAogIGRyaXZlciwgVG9yYWRleCBhcGFsaXMgaS5t
eDY6IEFkZCBkb3dubG9hZCBoYXNoZXMgZm9yIExpbnV4IGFuZAogIFUtQm9vdC4KCi0gU2VjdXJp
dHkgZml4ZXMgZm9yIGV4ZmF0cHJvZ3MsIGltYWdlbWFnaWNrLCBpbnRlbC1taWNyb2NvZGUsIGxp
YmRlMjY1LAogIGxpYnBqc2lwLCBsaWJ4bWwyLCBtYXJpYWRiLCBtZW1jYWNoZWQsIHBlcmwsIHBv
c3RncmVzcWwsIHNhbWJhNCwKICBzcXVpZCwgdmltLCB2bGMKCi0gRml4ZXMgZm9yIGRvd25sb2Fk
L2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4gZXJsYW5nLCBnY2MsCiAgZ3Ns
LCBsaWJtZW1jYWNoZWQsIG1vdGlvbiwgbmV0c25tcCwgcHV0dHksIHJ0dHksIHNwZWVjaGQsIHhl
bm9tYWksCiAgeHRhYmxlcy1hZGRvbnMsIHpmcwoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBD
SEFOR0VTIGZpbGU6CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9D
SEFOR0VTP2lkPTIwMjMuMDguNAoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBz
dHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBl
b3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIz
LjA4LjMuLgoKICAgIDI1ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAgNCAgQmVybmQgS3VobHMKICAg
ICAzICBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8KICAgICAzICBQZXRlciBLb3JzZ2FhcmQKICAg
ICAyICBGcmFuY29pcyBQZXJyYWQKICAgICAyICBHYcOrbCBQT1JUQVkKICAgICAyICBXYWxkZW1h
ciBCcm9ka29yYgogICAgIDIgIFlhbm4gRS4gTU9SSU4KICAgICAxICBCcmFuZG9uIE1haWVyCiAg
ICAgMSAgTWF4aW0gS29jaGV0a292CiAgICAgMSAgTmljb2xhcyBDYXZhbGxhcmkKICAgICAxICBQ
ZXRlciBTZWlkZXJlcgogICAgIDEgIFRob21hcyBQZXRhenpvbmkKCk5vdGljZSB0aGF0IDIwMjMu
MDgueCBpcyBub3cgRU9MLiBQbGVhc2UgbWlncmF0ZSB0byAyMDIzLjExLnggaW5zdGVhZAp3aGlj
aCB3aWxsIGJlIHN1cHBvcnRlZCB1bnRpbCBBcHJpbCAyMDI0LgoKLS0gCkJ5ZSwgUGV0ZXIgS29y
c2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
