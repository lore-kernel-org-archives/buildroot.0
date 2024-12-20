Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BD9E7718C
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 22:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBDF4407AD;
	Fri, 20 Dec 2024 22:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbA70gLVHHKe; Fri, 20 Dec 2024 22:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8725407CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8725407CD;
	Fri, 20 Dec 2024 22:06:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1518938
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 22:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF9CA40187
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 22:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Eync0vgHcNw for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 22:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C422F40181
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C422F40181
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 22:06:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA6BF87412; Fri, 20 Dec 2024 22:06:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Dec 2024 22:55:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 635c5f8a7dfa39bdd0413b48ae2752fc41bb6fac
X-Git-Newrev: ed59c2b7aa088b44d5d402bf4ddf454a99e45587
X-Patchwork-Hint: ignore
Message-Id: <20241220220629.AA6BF87412@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proj: add an option to build and
 install apps
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed59c2b7aa088b44d5d402bf4ddf454a99e45587
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The proj package includes command line applications. Those have always
been disabled in Buildroot. Those applications can be useful for
scripting, and also for runtime testing the libraries.

This commit adds a package Kconfig option to enable those apps.

Tested-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Acked-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/proj/Config.in | 12 ++++++++++++
 package/proj/proj.mk   |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/proj/Config.in b/package/proj/Config.in
index 6d172e2ee9..86966a4d10 100644
--- a/package/proj/Config.in
+++ b/package/proj/Config.in
@@ -14,6 +14,18 @@ config BR2_PACKAGE_PROJ
 
 	  http://proj4.org/
 
+if BR2_PACKAGE_PROJ
+
+config BR2_PACKAGE_PROJ_APPS
+	bool "build apps"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Build and install proj command line apps. Those command line
+	  applications are: cct, cs2cs, geod, gie, invgeod, invproj,
+	  proj, projinfo, projsync.
+
+endif
+
 comment "proj needs a toolchain w/ C++, gcc >= 4.7, NPTL, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 19b5f1012e..361c1e50b1 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -20,7 +20,7 @@ PROJ_CXXFLAGS += -O0
 endif
 
 PROJ_CONF_OPTS = \
-	-DBUILD_APPS=OFF \
+	-DBUILD_APPS=$(if $(BR2_PACKAGE_PROJ_APPS),ON,OFF) \
 	-DCMAKE_C_FLAGS="$(PROJ_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(PROJ_CXXFLAGS)"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
