Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62698C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 09:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D955F40472;
	Wed,  6 Dec 2023 09:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D955F40472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LqcFY3zSG8Z1; Wed,  6 Dec 2023 09:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB66A40120;
	Wed,  6 Dec 2023 09:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB66A40120
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 001821BF83E
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBA5A40120
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA5A40120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BLaA_BkaBJJk for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 09:12:38 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08396400EA
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 09:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08396400EA
Date: Wed, 06 Dec 2023 09:11:46 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <BeznnlTq0vvbpFka026Yd1oSJiN00BCfdSJrIJ5StZU1JXCG4xA25tNDQp7PhX_G1YfZ10xV9k1i4ohYUe6W64UxlEcmcdninKgmLEVMp6A=@protonmail.com>
Feedback-ID: 6956783:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protonmail.com; 
 s=protonmail3; t=1701853949; x=1702113149;
 bh=gchdbuCPsYQwLJgZXkbzPnS/cvC/OdCl6TXp7l+S1CY=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=qFH6BuSYBdg5gMh8IBG9cov4V5XF23A6ncojsjR2zmxtLjmPAr/Crnr8yhUgMtz/S
 1hZa/KL56M2Ga45eB7e8XeZzh7eLNdFs+eKE3ynx5E9bzFuC3++COISC7IifNeUEMq
 Cuv+/fmhBI4aqXkd43hVazy7rTbjVLQuLxbVwMZR6uOm/rQSmZCFlUnaTc2ecxKtXM
 u4BF1ejV12vVF8rgt8s6uDOPRDbP4iXNX+gO0veyuoZlSXfMs4zc7nOOuWK5EuHfn7
 hVSW6iFtcKZ7d9NcKK2DJ/DM2AOAukEGFD4c/JNZZFY7GwJbIIcJBB0C0647OfBhLP
 4+0Y+NULCI+pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=qFH6BuSY
Subject: [Buildroot] [PATCH] package/gloox: bump version to 1.0.28
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
From: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Reply-To: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: multipart/mixed; boundary="===============4152753378289374309=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.

--===============4152753378289374309==
Content-Type: multipart/alternative;
 boundary="b1_fAZOgDU0y6AgSYi5ad7bIx9k8i2K8gKvUmd2f72Td4"

This is a multi-part message in MIME format.

--b1_fAZOgDU0y6AgSYi5ad7bIx9k8i2K8gKvUmd2f72Td4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogWWFpciBCZW4tQXZyYWhhbSA8eWFpcmJhQHByb3Rvbm1haWwuY29tPgot
LS0KcGFja2FnZS9nbG9veC9nbG9veC5oYXNoIHwgMiArLQpwYWNrYWdlL2dsb294L2dsb294Lm1r
IHwgMiArLQoyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2dsb294L2dsb294Lmhhc2ggYi9wYWNrYWdlL2dsb294L2ds
b294Lmhhc2gKaW5kZXggNjZhM2MyZDFiZS4uOTYzYjc5ODI5OSAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9nbG9veC9nbG9veC5oYXNoCisrKyBiL3BhY2thZ2UvZ2xvb3gvZ2xvb3guaGFzaApAQCAtMSwz
ICsxLDMgQEAKIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAwYjhiNzM3MTQzOWJjNThkOWU1
MTM4NGI2MTZjOTY0YjE4YjdiNDFiODdhZjFiNzg1NTEwNDM4MGVkYTg2ZmZiIGdsb294LTEuMC4y
Ny50YXIuYnoyCitzaGEyNTYgNTkxYmQxMmMyNDllZGUwYjUwYTFlZjZiOTlhYzBkZThlZjljMWJh
NGZkMmUxODZmOTdhNzQwMjE1Y2M1OTY2YyBnbG9veC0xLjAuMjgudGFyLmJ6MgpzaGEyNTYgNDBh
MjBjNDFjOGRhYmI4YmE2MWJlYTk4M2ZhOGYyZjY5ODllNjdmYWM1NmJiNjJjMjI0OTA1MzgwN2Zk
MjZhZiBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dsb294L2dsb294Lm1rIGIvcGFja2Fn
ZS9nbG9veC9nbG9veC5tawppbmRleCAzNDk1ZGI5NmYwLi4wZDI0ZjgwMDhiIDEwMDY0NAotLS0g
YS9wYWNrYWdlL2dsb294L2dsb294Lm1rCisrKyBiL3BhY2thZ2UvZ2xvb3gvZ2xvb3gubWsKQEAg
LTQsNyArNCw3IEBACiMKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCi1HTE9PWF9WRVJTSU9OID0g
MS4wLjI3CitHTE9PWF9WRVJTSU9OID0gMS4wLjI4CkdMT09YX1NPVVJDRSA9IGdsb294LSQoR0xP
T1hfVkVSU0lPTikudGFyLmJ6MgpHTE9PWF9TSVRFID0gaHR0cHM6Ly9jYW1heWEubmV0L2Rvd25s
b2FkCkdMT09YX0xJQ0VOU0UgPSBHUEwtMy4wIHdpdGggT3BlblNTTCBleGNlcHRpb24KLS0gMi4z
OS4y

--b1_fAZOgDU0y6AgSYi5ad7bIx9k8i2K8gKvUmd2f72Td4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48L2Rpdj48c3Bhbj48L3NwYW4+PHNwYW4+U2lnbmVkLW9mZi1ieTogPHNwYW4+WWFpciBC
ZW4tQXZyYWhhbSAmbHQ7PGEgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciBub2ZvbGxv
dyBub29wZW5lciIgaHJlZj0ibWFpbHRvOnlhaXJiYUBwcm90b25tYWlsLmNvbSI+eWFpcmJhQHBy
b3Rvbm1haWwuY29tPC9hPiZndDs8L3NwYW4+PC9zcGFuPjxkaXY+PHNwYW4+LS0tPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+Jm5ic3A7cGFja2FnZS9nbG9veC9nbG9veC5oYXNoIHwgMiArLTwvc3Bh
bj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwO3BhY2thZ2UvZ2xvb3gvZ2xvb3gubWsgJm5ic3A7IHwg
MiArLTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOzIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKTwvc3Bhbj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PjxzcGFuPmRpZmYgLS1naXQgYS9wYWNrYWdlL2dsb294L2dsb294Lmhhc2ggYi9wYWNrYWdlL2ds
b294L2dsb294Lmhhc2g8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5pbmRleCA2NmEzYzJkMWJlLi45
NjNiNzk4Mjk5IDEwMDY0NDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPi0tLSBhL3BhY2thZ2UvZ2xv
b3gvZ2xvb3guaGFzaDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPisrKyBiL3BhY2thZ2UvZ2xvb3gv
Z2xvb3guaGFzaDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPkBAIC0xLDMgKzEsMyBAQDwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyMgTG9jYWxseSBjYWxjdWxhdGVkPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4+LXNoYTI1NiAmbmJzcDswYjhiNzM3MTQzOWJjNThkOWU1MTM4NGI2MTZjOTY0YjE4
YjdiNDFiODdhZjFiNzg1NTEwNDM4MGVkYTg2ZmZiICZuYnNwO2dsb294LTEuMC4yNy50YXIuYnoy
PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+K3NoYTI1NiAmbmJzcDs1OTFiZDEyYzI0OWVkZTBiNTBh
MWVmNmI5OWFjMGRlOGVmOWMxYmE0ZmQyZTE4NmY5N2E3NDAyMTVjYzU5NjZjICZuYnNwO2dsb294
LTEuMC4yOC50YXIuYnoyPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7c2hhMjU2ICZuYnNw
OzQwYTIwYzQxYzhkYWJiOGJhNjFiZWE5ODNmYThmMmY2OTg5ZTY3ZmFjNTZiYjYyYzIyNDkwNTM4
MDdmZDI2YWYgJm5ic3A7TElDRU5TRTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPmRpZmYgLS1naXQg
YS9wYWNrYWdlL2dsb294L2dsb294Lm1rIGIvcGFja2FnZS9nbG9veC9nbG9veC5tazwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPmluZGV4IDM0OTVkYjk2ZjAuLjBkMjRmODAwOGIgMTAwNjQ0PC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4+LS0tIGEvcGFja2FnZS9nbG9veC9nbG9veC5tazwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPisrKyBiL3BhY2thZ2UvZ2xvb3gvZ2xvb3gubWs8L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj5AQCAtNCw3ICs0LDcgQEA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsjPC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8L3NwYW4+
PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDs8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4tR0xPT1hfVkVS
U0lPTiA9IDEuMC4yNzwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPitHTE9PWF9WRVJTSU9OID0gMS4w
LjI4PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7R0xPT1hfU09VUkNFID0gZ2xvb3gtJChH
TE9PWF9WRVJTSU9OKS50YXIuYnoyPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7R0xPT1hf
U0lURSA9IDxhIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIgbm9mb2xsb3cgbm9vcGVu
ZXIiIGhyZWY9Imh0dHBzOi8vY2FtYXlhLm5ldC9kb3dubG9hZCI+aHR0cHM6Ly9jYW1heWEubmV0
L2Rvd25sb2FkPC9hPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwO0dMT09YX0xJQ0VOU0Ug
PSBHUEwtMy4wIHdpdGggT3BlblNTTCBleGNlcHRpb248L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4t
LSA8L3NwYW4+PC9kaXY+PHNwYW4+Mi4zOS4yPC9zcGFuPjxzcGFuPjwvc3Bhbj48ZGl2IGNsYXNz
PSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jayIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyI+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWdu
YXR1cmVfYmxvY2stdXNlciI+PGRpdj48L2Rpdj4NCiAgICA8L2Rpdj4NCiAgICANCiAgICAgICAg
ICAgIDxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXByb3RvbiBwcm90b25t
YWlsX3NpZ25hdHVyZV9ibG9jay1lbXB0eSI+DQogICAgICAgIA0KICAgICAgICAgICAgPC9kaXY+
DQo8L2Rpdj4NCg==


--b1_fAZOgDU0y6AgSYi5ad7bIx9k8i2K8gKvUmd2f72Td4--


--===============4152753378289374309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4152753378289374309==--

