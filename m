Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B197CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 17:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 532C360AD6;
	Fri, 18 Mar 2022 17:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5AfziZXHzi2; Fri, 18 Mar 2022 17:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85EE160A79;
	Fri, 18 Mar 2022 17:33:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D558E1BF34E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 17:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2995812E7
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 17:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new); dkim=neutral
 reason="invalid (public key: not available)" header.d=embedded.rocks
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMmXHzQns6P4 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 17:33:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 458F881299
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 17:33:54 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 4E17E240026
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 18:33:52 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4KKrhv4F68z9rxR
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 18:33:51 +0100 (CET)
Authentication-Results: mail.embedded.rocks (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=embedded.rocks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:x-mailer:message-id:date:date:subject:subject:from
 :from:received:received; s=default; t=1647624829; x=1648229630;
 bh=OqlatCem+JNWHgJVNvnVYtKEVd4W+O5riZ123P1ZJ/k=; b=CW6mXJRSDL7w
 uAdFdSLRfNvfvBnesaGqgm/9VM9gGyjk2ieSJouLh6VkjtiSzYgBabKT+hwuzfCj
 bZLHUNiOEwh5GtBz3d0HjMfrKNJKgiMn1fx9Oan8fI+Nj4QXeGSE/0yRtYs+7tk7
 SdrN/RC104wYJGRpDiqZ2DXO6C4tK3Un9pIdyktsM99okV2e9ZNaJRiLVitKzZUn
 kPGgQJHftJPQdNkYQtPy4+z+2fshVNaz0dfM9yBg06WhxYh9bZaxMTiBIsv33B/e
 ZuqcOZnaV2COjVq3GWOvglzARrn3/PTh+o32V6/eQlCFROaMMuRbyI9FpiYaFIaX
 CSo0/ECNMA==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id LH-ncTaEJb1t; Fri, 18 Mar 2022 18:33:49 +0100 (CET)
Received: from nzxt.fritz.box (port-92-193-142-156.dynamic.as20676.net
 [92.193.142.156]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Fri, 18 Mar 2022 18:33:49 +0100 (CET)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 17:33:47 +0000
Message-Id: <20220318173347.68409-1-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.43.0-0
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+
Ci0tLQogcGFja2FnZS9sdXYvbHV2Lmhhc2ggfCAyICstCiBwYWNrYWdlL2x1di9sdXYubWsgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2L2x1di5oYXNoIGIvcGFja2FnZS9sdXYvbHV2Lmhhc2gK
aW5kZXggMmZiMmI1YzRmYy4uNGNkYjkxNzI5ZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9sdXYvbHV2
Lmhhc2gKKysrIGIvcGFja2FnZS9sdXYvbHV2Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2Fs
bHkgY2FsY3VsYXRlZAotc2hhMjU2ICA0YjZmYmFhODlkMjQyMGVkZjYwNzBhZDllNTIyOTkzZTEz
MmJkN2ViMjU0MGZmNzU0YzJiOWYxNDk3NzQ0ZGIyICBsdXYtMS40Mi4wLTEudGFyLmd6CitzaGEy
NTYgIDU2N2E2ZjNkY2RjZjhhOWI1NGRkYzU3ZmZlZjg5ZDFlOTUwZDcyODMyYjg1ZWU4MWM4Yzgz
YTlkNGUwZTlkZTIgIGx1di0xLjQzLjAtMC50YXIuZ3oKIHNoYTI1NiAgY2ZjNzc0OWI5NmY2M2Jk
MzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0MTdiYzUyM2QzMCAgTElDRU5T
RS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2L2x1di5tayBiL3BhY2thZ2UvbHV2L2x1di5t
awppbmRleCAyZGM5YWYzYjdhLi4zNmZjZGM3NDJlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1di9s
dXYubWsKKysrIGIvcGFja2FnZS9sdXYvbHV2Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotTFVWX1ZFUlNJT04gPSAxLjQyLjAtMQorTFVWX1ZFUlNJT04g
PSAxLjQzLjAtMAogTFVWX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbHV2aXQvbHV2L3JlbGVh
c2VzL2Rvd25sb2FkLyQoTFVWX1ZFUlNJT04pCiBMVVZfTElDRU5TRSA9IEFwYWNoZS0yLjAKIExV
Vl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
