Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB594C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7850F4051D;
	Wed,  9 Feb 2022 21:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1yempvfkdaf; Wed,  9 Feb 2022 21:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78C7F403A7;
	Wed,  9 Feb 2022 21:34:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2274C1BF9C1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0595414A2
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTHX29us8GlS for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0341B40194
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 09EE68323C; Wed,  9 Feb 2022 21:26:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 538dc7f0270485675d8d88d0a7be3ab21901f0b0
X-Git-Newrev: 1a1db54c309ac1509ddffd26da35313ac923202a
X-Patchwork-Hint: ignore
Message-Id: <20220209212600.09EE68323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libftdi1: drop python2 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a1db54c309ac1509ddffd26da35313ac923202a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libftdi1/Config.in   | 2 +-
 package/libftdi1/libftdi1.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
index 2d32573563..ec91366115 100644
--- a/package/libftdi1/Config.in
+++ b/package/libftdi1/Config.in
@@ -24,7 +24,7 @@ comment "libftdipp1 needs a toolchain w/ C++, wchar"
 
 config BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS
 	bool "python bindings"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Python bindings for libftdi
 
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 6688694b47..d2e3f42e14 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -24,7 +24,7 @@ LIBFTDI1_CONF_OPTS += -DFTDIPP=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS),y)
-LIBFTDI1_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3) host-swig
+LIBFTDI1_DEPENDENCIES += python3 host-swig
 LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=ON
 else
 LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
