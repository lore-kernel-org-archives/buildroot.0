Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1A0C52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 21:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C60A4016B;
	Sat, 24 Aug 2024 21:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HnIcDFN0QI7; Sat, 24 Aug 2024 21:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4A1F40178
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4A1F40178;
	Sat, 24 Aug 2024 21:11:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 784441BF31B
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 21:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64E2240169
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 21:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGMe3KRVdg5z for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 21:11:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87A5F4015D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87A5F4015D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87A5F4015D
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 21:11:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([84.44.134.213]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mel81-1sAHK13NTx-00cu8x; Sat, 24
 Aug 2024 23:11:36 +0200
Date: Sat, 24 Aug 2024 23:11:29 +0200
MIME-Version: 1.0
Message-Id: <20240824-frotz-v1-1-05b86b9e6038@gmx.net>
X-B4-Tracking: v=1; b=H4sIAIBMymYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyMT3bSi/JIq3STzZCPTFOPkVIskIyWg2oKi1LTMCrA50bG1tQBZla3
 WVwAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724533896; l=2027;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=dBu4+hT2JLVSq+EMHXW/Z2NCozT3HRzHYz/KEwSJFVc=;
 b=QmGGm7bQBbccNXhpK1TQcSumAducPykg5Js5/vrmGKjHBISiyiMziKNgQ40CQgg/wNEwKgYKK
 U8h2qGqxVMsC9T3GVME4It/eVCGw66Rrqn5nSl+KB2owdbqvxKe7xcC
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:52ekWDXs1kC4gjOgQppJwL2BhaH36gOgTWLUbxO1DBtiv+TNsRZ
 dKtiYA09E5yCFB4D1DH1EidTaG2fxxuYf2wjVyjdexBhH/HNI0FUvibC0gIxhi65XDvaBzx
 2aMGtx40F0lqPHtyu33QlymNQYYHbWuUupesqPn6mva7TZZURKViCj8ZWxlJZxHj5tGqAzm
 0LtDhoG1MSX5i4JQ5JViw==
UI-OutboundReport: notjunk:1;M01:P0:+Z9UGTIw8ig=;Amh9c2MD+qul+9vAYVViWdmOxkU
 O98klQNCTVg5OqVffeSA+fgDDEXem1A5Hgtg0PgO/sJyyT14AKpVS/qDMChFui9nJz2zSuwPi
 ioHUR6+18P2KJj0ZO8I0XUKM8kGZbLVzXqwC+gSOMY8/ZcEk1TpZAWtQB020Uv6IkCBfJwxUe
 EOCWOQGqxZ8WbV/ECK27Y4lvu1UJz43FfFfykHeTI9+on37H15idrz4OEf2idarV361wifwvh
 l1Tr2EkPYa9xRGuVWIg1hO58ML73fd4WYZ8KaUvh5417JHaMJoIcba+aQsMpua2+hq9TwE9Jg
 +tInfZil9LLp3pMZYHxoKFcoWVjZq+sHAbL11GQPLaKdwhbY9gw+Kj/L/lYLWHYb+Ir+0sQdP
 PWIPwpIanbtRfIO9+moycN5qVOwQb/BhbhuyjKUTeiCju0wGkWI6uWpnYDwKU5WViArg6IWyz
 Y/UpPWW+pX/u2efgdmw4d1eHlv6c79m0Olh4UNMb0STxP29d6HHhii40nY9ckq3WjmpUY5zUl
 zbEOnXFE2L+MbQ26QyLJX5S0Z1pZoYWJQ0WPLSJz1E4iyXbItV5IFvfNGp5P1wqQQhO6Oth2S
 qOit3/np3PFFXoava1IObE9p6pdDc4u38TJQfW+85/If7NdM0d765TpSxtOyCohrAG/oeSJiP
 KaRIWzgmuLpF6s5ek40J8voFkNTXVbQNPP1pTA/RM0b8OZixNNnKTZtwXBN4OoukMed5Whh6h
 B7ioMlkm7ifubgoytaEoPmszMRgvyL+qZnOpmSi1fuKX/0RqgqMnvXuThpQb+uxdz6R9Zd6Rh
 w7L/pZKThfrbtaS/l1DWZ0cKmQHMC7lDxi8dmj2wdc8xs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724533897; x=1725138697; i=j.neuschaefer@gmx.net;
 bh=WWKJmlyziFh2JhfYQ5FDb2jfpsbVRpU6iOcmM63/BgA=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XD+z+3rquRVT52l+oZWLv74gVXJ/6W3DrhAsMEivtlPXahsEeKmwJOK7E+bH/2oZ
 8Y1UqFzEb0FcW8pHIKqafXjX0DSj2pT8jw7W/CWb4uink7j7HkVKKa3Ea8VYgS1K5
 3IxrLqMMmmsA3AO1FZVnytMQL1LDw18CUL9824wLRrAwCLqk73aeL6Ui34aIFOl1K
 LqS+9E45cHQHZT/IpCDYqHJJEh7FDsdte6o4Nj/7DCMCZRhVCswbIR3ODLsgh5CTJ
 /yEVa7C0JSCK7ahaSUAuiubBZf1yiijT1hWLU92idr0tcOqzr7IQDntvGADTQm2es
 31mZbvZMqEmju7BzuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=XD+z+3rq
Subject: [Buildroot] [PATCH] package/frotz: update package hash for verion
 2.54
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Thomas Huth <huth@tuxfamily.org>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVjZW50bHksIGhhc2ggY2hlY2tzIGhhdmUgYmVlbiBmYWlsaW5nIGZvciBmcm90ei0yLjU0LnRh
ci5iejIuCkZvcnR1bmF0ZWx5LCB0aGUgb2xkIHZlcnNpb24gY2FuIHN0aWxsIGJlIGRvd25sb2Fk
ZWQgZnJvbQpzb3VyY2VzLmJ1aWxkcm9vdC5vcmc6CgokIHdnZXQgLXEgaHR0cHM6Ly9zb3VyY2Vz
LmJ1aWxkcm9vdC5uZXQvZnJvdHovZnJvdHotMi41NC50YXIuYnoyCiQgc2hhMjU2c3VtIGZyb3R6
LTIuNTQudGFyLmJ6MgpiZGY5MTMxZTZkZTQ5MTA4YzlmMDMyMjAwY2VhM2NiNDAxMWU1Y2EwYzlm
YmRiZjViMGMwNWY3YzU2YzgxMzk1ICBmcm90ei0yLjU0LnRhci5iejIKCkRpZmZpbmcgdGhlIG9s
ZCBhbmQgY3VycmVudCB1bnBhY2tlZCB0YXJiYWxscyBzaG93cyB0aGF0IHRoZSBjaGFuZ2UgaXMg
YmVuaWduCmFuZCBhcHBlYXJzIHRvIGJlIGR1ZSB0byBhIGNoYW5nZSBpbiBHaXRMYWIncyB0YXJi
YWxsIGdlbmVyYXRpb246CgoJZGlmZiAtcnUgZnJvdHotMi41NC9NYWtlZmlsZSBmcm90ei0yLjU0
LW5ldy9NYWtlZmlsZQoJLS0tIGZyb3R6LTIuNTQvTWFrZWZpbGUgMjAyMi0wNC0xNCAwODo0Nzo0
MS4wMDAwMDAwMDAgKzAyMDAKCSsrKyBmcm90ei0yLjU0LW5ldy9NYWtlZmlsZSAgICAgMjAyMi0w
NC0xNCAwODo0Nzo0MS4wMDAwMDAwMDAgKzAyMDAKCUBAIC0yNjEsNyArMjYxLDcgQEAKCSBHSVRf
REFURSA9ICQoc2hlbGwgZ2l0IHNob3cgLXMgLS1mb3JtYXQ9JWNpKQoJIGVsc2UKCSBHSVRfSEFT
SCA9IDVhODZkZTJmMDc5OWJkZTEyNjk5YTAxODllYTEyYmU4Yzk2MTk0YTUKCS1HSVRfSEFTSF9T
SE9SVCA9IDVhODZkZTIKCStHSVRfSEFTSF9TSE9SVCA9IDVhODZkZTJmCgkgR0lUX0RBVEUgPSAy
MDIyLTA0LTEzIDIzOjQ3OjQxIC0wNzAwCgkgZW5kaWYKCSBleHBvcnQgQ0ZMQUdTCgpGb3IgY29t
cGFyaXNvbiwgdGhlIHNvdXJjZXMgZmlsZXMgaW4gZ2l0WzFdIGNvbnRhaW4gIkdJVF9IQVNIX1NI
T1JUID0KJEZvcm1hdDolaCQiIGV0Yy4sIHJhdGhlciB0aGFuIGFuIGFjdHVhbCBjb21taXQgaGFz
aC9kYXRlLgoKWzFdOiBodHRwczovL2dpdGxhYi5jb20vRGF2aWRHcmlmZml0aC9mcm90ei8tL2Js
b2IvMi41NC9NYWtlZmlsZT9yZWZfdHlwZT10YWdzI0wyNTQKCkZpeGVzOiBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8wNzdlNDc1NmU1NjkwM2YwOTRiOTM1YWY0ZWU4ODI5
NTA3ZTBjM2RlLwpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBn
bXgubmV0PgotLS0KIHBhY2thZ2UvZnJvdHovZnJvdHouaGFzaCB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
ZnJvdHovZnJvdHouaGFzaCBiL3BhY2thZ2UvZnJvdHovZnJvdHouaGFzaAppbmRleCAxNDVhYTM4
MDBmLi41YzdlMmM4NWU2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2Zyb3R6L2Zyb3R6Lmhhc2gKKysr
IGIvcGFja2FnZS9mcm90ei9mcm90ei5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNh
bGN1bGF0ZWQKLXNoYTI1NiAgYmRmOTEzMWU2ZGU0OTEwOGM5ZjAzMjIwMGNlYTNjYjQwMTFlNWNh
MGM5ZmJkYmY1YjBjMDVmN2M1NmM4MTM5NSAgZnJvdHotMi41NC50YXIuYnoyCitzaGEyNTYgIDc1
NmQ3ZTExMzcwYzljOGU2MTU3M2UzNTBlMmE1MDcxZTc3ZmQyNzgxYmU3NGMxMDdiZDQzMmY4MTdm
M2FiYzcgIGZyb3R6LTIuNTQudGFyLmJ6Mgogc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2
MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgwNjQzICBDT1BZSU5HCgotLS0K
YmFzZS1jb21taXQ6IDhiZDAwYzE2ZDhhZjJiNGI2MjBhMGIyYzEzNmU2ODMwYjlkNmIzYTAKY2hh
bmdlLWlkOiAyMDI0MDgyNC1mcm90ei1iN2MyNWQzY2U4YjIKCkJlc3QgcmVnYXJkcywKLS0KSi4g
TmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
