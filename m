Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB3BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3DB260E65;
	Mon, 28 Feb 2022 20:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFbeYAUVRHrq; Mon, 28 Feb 2022 20:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09CD60E61;
	Mon, 28 Feb 2022 20:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E71911BF255
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 20:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D510581B35
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 20:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KoSnG1noZAPm for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 20:45:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A95A481B10
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 20:45:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6D85B1C0003
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 20:45:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nOmtG-00EEkZ-Te
 for buildroot@buildroot.org; Mon, 28 Feb 2022 21:45:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 21:45:06 +0100
Message-ID: <877d9ezpnx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.11.2 released
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
MjEuMTEuMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjExLjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjExLjIudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIxLjExLjIgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjEu
MTEuMSByZWxlYXNlLgoKLSBEZWZjb25maWdzOiBBbmRlcyBhZTN4eCwgSW50ZWwgZ2FsaWxlbzog
Rml4IGJ1aWxkIHdpdGggaG9zdCBnY2MgPj0gMTAsCiAgUk9DLVJLMzM5OS1QQzogQnVtcCByb290
ZnMgc2l6ZSB0byBmaXggYnVpbGQgaXNzdWUuCgotIEFkZCBjb25kaXRpb25hbCBwYXRjaGluZyBs
b2dpYyB0byBmaXggYnVpbGQgaXNzdWVzIGZvciBvbGRlciBVLUJvb3QgLwogIExpbnV4IGtlcm5l
bCB2ZXJzaW9ucyB3aGVuIGJ1aWx0IHdpdGggYSBob3N0IGdjYyA+PSAxMC4KCi0gU2VjdXJpdHkg
Zml4ZXMgZm9yIGNvbm5tYW4sIGV4cGF0LCBnbGliYywgZ28sIGxpYmFyY2hpdmUsIGxvY2FsZWRl
ZiwKICBwcm9zb2R5LCBweXRob24tZGphbmdvLCB0aWZmLCB1dGlsLWxpbnV4LCB2aW0sIHhlbgoK
LSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBp
biBhcGl0cmFjZSwKICBiaW51dGlscywgY2FzeW5jLCBjZ2lsdWEsIGdhdWNoZSwgZ2RiLCBnZW5z
aW8sIGdzdC1vbXgsIGdzdDEtZGV2dG9vbHMsCiAgZ3N0MS1saWJhdiwgZ3N0MS1wbHVnaW5zLWJh
ZCwgZ3N0MS1wbHVnaW5zLWJhc2UsIGdzdDEtcGx1Z2lucy1nb29kLAogIGdzdDEtcGx1Z2lucy11
Z2x5LCBnc3QxLXB5dGhvbiwgZ3N0MS1ydHNwLXNlcnZlciwgZ3N0MS12YWFwaSwKICBnc3RyZWFt
ZXIxLCBnc3RyZWFtZXIxLWVkaXRpbmctc2VydmljZXMsIGtmNS1leHRyYS1jbWFrZS1tb2R1bGVz
LAogIGtvZGksIGxpbnV4LCBsb2c0Y3h4LCBtcGQsIG5mcy11dGlscywgcGhwLCBwaXN0YWNoZSwg
cGtjczExLWhlbHBlciwKICBweXRob24tcmVnZXgsIHB5dGhvbi1zcWxpdGVzY2hlbWEsIHJlc2lw
cm9jYXRlLCBydGw4NzIzYnUsIHRvcgoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VT
IGZpbGU6CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VT
P2lkPTIwMjEuMTEuMgoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmds
eSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBj
b250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIxLjExLjEu
LgoKICAgIDE3ICBQZXRlciBTZWlkZXJlcgogICAgMTUgIEZhYnJpY2UgRm9udGFpbmUKICAgIDEz
ICBHaXVsaW8gQmVuZXR0aQogICAgIDYgIFBldGVyIEtvcnNnYWFyZAogICAgIDIgIEJlcm5kIEt1
aGxzCiAgICAgMiAgRG91ZyBCcm93bgogICAgIDIgIEZyYW5jb2lzIFBlcnJhZAogICAgIDIgIEpv
YWNoaW0gV2liZXJnCiAgICAgMiAgWWFubiBFLiBNT1JJTgogICAgIDIgIFllZ29yIFllZnJlbW92
CiAgICAgMSAgQWRyaWFuIFBlcmV6IGRlIENhc3RybwogICAgIDEgIEFuZHJlYXMgWmllZ2xlcgog
ICAgIDEgIENocmlzdGlhbiBTdGV3YXJ0CiAgICAgMSAgSmFtZXMgSGlsbGlhcmQKICAgICAxICBK
w7ZyZyBLcmF1c2UKICAgICAxICBNaWNoYWVsIE9wZGVuYWNrZXIKICAgICAxICBOdW5vIEdvbsOn
YWx2ZXMKICAgICAxICBQZWRybyBBZ3VpbGFyCiAgICAgMSAgUmljYXJkbyBNYXJ0aW5jb3NraQog
ICAgIDEgIFJvbWFpbiBOYW91cgogICAgIDEgIFRob21hcyBEZSBTY2hhbXBoZWxlaXJlCgotLSAK
QnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
