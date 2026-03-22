Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE0AF483EA
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18CD940D40;
	Mon, 23 Mar 2026 19:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hr2izDYgkQ3l; Mon, 23 Mar 2026 19:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ECB640D52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295301;
	bh=EiNJuyQG84E9g3JQ6xkYyz3e2nD45ShOtPrnUpgjsV0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a2KlKlEztObz8niO7/mjrxeIMsTxRaDIiszvl4j8LKqZcTeIjoJUuy5OZ2Q3R/kJR
	 Ivtg2TivSNC4GzSf3s5Ht+0xp+LYPTbKQf/WIocH5GjBNDhicDSGDmgaKo+gJ6Udx0
	 +PxxJHZhCGZa+oCaC4rsfx7fwtE+moVmtEq4Vov9ghLXvMnnxfr0fJf7gFuv5fx+H4
	 WeD93Y/N+9VpCfvdvK5wqJfNP+R6/xTtd40ZezmCQ+LNvlSB8TLkUcTRwLDaq6GSim
	 V0c0xYGXIPBNgEjLlbhyftkmiXFX7rU6TLShec4hrnmtoD+pxMbUZ9MGNYJSp2EoH8
	 wn5qkAv0jrJNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ECB640D52;
	Mon, 23 Mar 2026 19:48:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A7A353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AABD640C88
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V03VDlCPgmGJ for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7C8840CBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7C8840CBA
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4872684CB3; Mon, 23 Mar 2026 19:47:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Mar 2026 14:35:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9c20750e26ccb652e5cf0dc95d3e077440a1ce4
X-Git-Newrev: fe4b42063055f9ee2ae8e6c95d902e732c343cf9
X-Patchwork-Hint: ignore
Message-Id: <20260323194746.4872684CB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/piglit: bump version to git
 ec0fc2fef0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fe4b42063055f9ee2ae8e6c95d902e732c343cf9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Includes
https://gitlab.freedesktop.org/mesa/piglit/-/commit/ec0fc2fef0755b1595c3799ab25129174a4b2007
which fixes build with gcc >= 16.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/piglit/piglit.hash | 2 +-
 package/piglit/piglit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 8158177e4f..83c4c1fa3f 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  060d45db7304446ef280afd60fad3a728bcd9fdfe4c204b8a236e6a4a46ce592  piglit-3051e13ae12e1c927c7baace3138a8bebec7018a-git4.tar.gz
+sha256  b7892506de63d4f5b62c6e5dbb0c7e0d14497cc4617f8784e4e446bfe81941ec  piglit-ec0fc2fef0755b1595c3799ab25129174a4b2007-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index e61c3c9e61..c4c004c824 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = 3051e13ae12e1c927c7baace3138a8bebec7018a
+PIGLIT_VERSION = ec0fc2fef0755b1595c3799ab25129174a4b2007
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
