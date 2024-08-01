Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE962C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 19:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58CC38207F;
	Thu,  1 Aug 2024 19:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXK3NvGCw9zL; Thu,  1 Aug 2024 19:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7544682083
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7544682083;
	Thu,  1 Aug 2024 19:12:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5708F1BF401
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 19:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4564B60689
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 19:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-_z1BUtQdP7 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 19:12:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61ECC60680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61ECC60680
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61ECC60680
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 19:12:43 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 46791240EB6;
 Thu,  1 Aug 2024 21:12:42 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id 2A041A00E2;
 Thu,  1 Aug 2024 21:12:42 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id E1D1B241847;
 Thu,  1 Aug 2024 21:12:41 +0200 (CEST)
To: buildroot@buildroot.org,
	festevam@gmail.com
Date: Thu,  1 Aug 2024 21:12:34 +0200
Message-Id: <20240801191234.9526-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2096
X-purgate-ID: 154282::1722539562-36E3322F-09BC1859/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1722539562;
 bh=UTY/qGc0jONOrJMRhEv/lLDryMjQ0r+R5cCrilf+JjQ=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=YfjpY/siw45IR6jfpiZWPnukMqi3xVBgjQZPNQODaYuX1LC58rV9SB1y0lxy6d03Y
 TuoN31OSYSOzkbpyo6V7w5qGT3WzrIMvV/6bs03Gr/z0Sxdq4+xVb1uxL9spoQmb8K
 Hvxmv4NXukoBapNr8SWmGgoFuUu6js1/PpiRR2gVkoqvKnr2Ne0nhA4kuBzEksOwRn
 h+IqKDnGIt0TCGIS3HEKomRePC7axX0S9Dn2yIYmenOBvNSZhbU2vcZXq0v7KYXS6p
 XjruIdrZt+ioFJNI6KuInjhjg4655Y7droYcm+/+iVjEXDN2wbJx+mRRDG66spFben
 k140URFl4Y1rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=YfjpY/si
Subject: [Buildroot] [PATCH] board/udoo/neo/readme.txt improve
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBhZGRzIG1vcmUgaW5mb3JhbXRpb24gdG8gdGhlIFVkb28gTmVvJ3MgcmVhZG1l
LCBlLmcuLApVYXJ0IHBpbnMgYW5kIGJhdWRyYXRlLgoKU2lnbmVkLW9mZi1ieTogS2lsaWFuIFpp
bm5lY2tlciA8a2lsaWFuLnppbm5lY2tlckBtYWlsLmRlPgotLS0KIGJvYXJkL3Vkb28vbmVvL3Jl
YWRtZS50eHQgfCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvYm9hcmQvdWRvby9uZW8vcmVhZG1lLnR4dCBiL2JvYXJkL3Vkb28vbmVvL3JlYWRtZS50eHQK
aW5kZXggOTRlYmNjMTJmMi4uZTlmOWZiYWMxYyAxMDA2NDQKLS0tIGEvYm9hcmQvdWRvby9uZW8v
cmVhZG1lLnR4dAorKysgYi9ib2FyZC91ZG9vL25lby9yZWFkbWUudHh0CkBAIC0xLDEyICsxLDM2
IEBACiBNWDZYIFVkb28gTmVvIGJvYXJkCi0KKz09PT09PT09PT09PT09PT09PT0KIGh0dHA6Ly93
d3cudWRvby5vcmcvdWRvby1uZW8vCiAKK0J1aWxkOgorPT09PT09CisKIFRvIGJ1aWxkIGEgbWlu
aW1hbCBzdXBwb3J0IGZvciB0aGVzZSBib2FyZHM6CiAKICAgICAkIG1ha2UgbXg2c3hfdWRvb19u
ZW9fZGVmY29uZmlnCiAgICAgJCBtYWtlCiAKK0ZpbGVzIGNyZWF0ZWQgaW4gdGhlIG91dHB1dCBk
aXJlY3Rvcnk6Cis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorCitvdXRw
dXQvaW1hZ2VzCisuCivilJzilIDilIAgYm9vdC5zY3IKK+KUnOKUgOKUgCBpbXg2c3gtdWRvby1u
ZW8tYmFzaWMuZHRiCivilJzilIDilIAgaW14NnN4LXVkb28tbmVvLWV4dGVuZGVkLmR0Ygor4pSc
4pSA4pSAIGlteDZzeC11ZG9vLW5lby1mdWxsLmR0Ygor4pSc4pSA4pSAIHJvb3Rmcy5leHQyCivi
lJzilIDilIAgcm9vdGZzLmV4dDQgLT4gcm9vdGZzLmV4dDIKK+KUnOKUgOKUgCByb290ZnMudGFy
CivilJzilIDilIAgc2RjYXJkLmltZwor4pSc4pSA4pSAIFNQTAor4pSc4pSA4pSAIHUtYm9vdC5i
aW4KK+KUnOKUgOKUgCB1LWJvb3QuaW1nCivilJTilIDilIAgekltYWdlCisKK0NyZWF0aW5nIGJv
b3RhYmxlIFNEIGNhcmQ6Cis9PT09PT09PT09PT09PT09PT09PT09PT09PQorCiBCdWlsZHJvb3Qg
cHJlcGFyZXMgYSBib290YWJsZSAic2RjYXJkLmltZyIgaW1hZ2UgaW4gdGhlIG91dHB1dC9pbWFn
ZXMvCiBkaXJlY3RvcnksIHJlYWR5IHRvIGJlIGR1bXBlZCBvbiBhbiBTRCBjYXJkOgogCkBAIC0x
NCwzICszOCwzMSBAQCBkZCBpZj1vdXRwdXQvaW1hZ2VzL3NkY2FyZC5pbWcgb2Y9L2Rldi88eW91
ci1taWNyb3NkLWRldmljZT4KIAogRm9yIGRldGFpbHMgYWJvdXQgdGhlIG1lZGl1bSBpbWFnZSBs
YXlvdXQsIHNlZSB0aGUgZGVmaW5pdGlvbiBpbgogYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgv
Z2VuaW1hZ2UuY2ZnLnRlbXBsYXRlX25vX2Jvb3RfcGFydF9zcGwuCisKK0Jvb3Rpbmc6Cis9PT09
PT09PQorCitTZXJpYWwgY29uc29sZToKKy0tLS0tLS0tLS0tLS0tLQorVGhlIFVkb28gTmVvIGZl
YXR1cmVzIHRoZSBzZXJpYWwgY29uc29sZSAiVUFSVDEiIG9uIHRoZSBwaW4gaGVhZGVyICJQNyIu
IFRoZQorVWFydCBwaW5zIGFyZSBhcyBmb2xsb3dzIChzZWUgYm9hcmQgbGFiZWxzKToKKworcGlu
IDQ2OiByeAorcGluIDQ3OiB0eAorCitCYXVkcmF0ZSBmb3IgdGhpcyBib2FyZCBpcyAxMTUyMDAu
CisKK0xvZ2luOgorLS0tLS0tCitFbnRlciAncm9vdCcgYXMgbG9naW4gdXNlciwgYW5kIHRoZSBw
cm9tcHQgaXMgcmVhZHkuCisKK0RvY3VtZW50YXRpb246Cis9PT09PT09PT09PT09PQorCitkb2N1
bWVudGF0aW9uIGxpbms6CistLS0tLS0tLS0tLS0tLS0tLS0tCitodHRwczovL3d3dy51ZG9vLm9y
Zy9kb2NzLW5lby9JbnRyb2R1Y3Rpb24vSW50cm9kdWN0aW9uLmh0bWwKKworZm9ydW0gbGluazoK
Ky0tLS0tLS0tLS0tCitodHRwczovL3d3dy51ZG9vLm9yZy9mb3J1bS9mb3J1bXMvdWRvby1uZW8u
MzkvCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
