Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34C3CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FF7240430;
	Sun,  7 Apr 2024 08:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HWrnA7-h48r; Sun,  7 Apr 2024 08:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C94BE405C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C94BE405C8;
	Sun,  7 Apr 2024 08:52:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E43041BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D017E40530
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pr6Cy4KqX0Cp for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A42EA404F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A42EA404F1
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8999B84BCD; Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 10:51:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1858231b29661cb3a81d0f5c1569530e09da6a6
X-Git-Newrev: a7d9080d6c6838305dbd8c3621bcde2b04ad8526
X-Patchwork-Hint: ignore
Message-Id: <20240407085210.8999B84BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhttpd: add libxcrypt optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7d9080d6c6838305dbd8c3621bcde2b04ad8526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/12.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: CMakeFiles/uhttpd.dir/main.c.o: in function `main':
/home/autobuild/autobuild/instance-4/output-1/build/uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c/main.c:437:(.text.startup+0x628): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/ccd789b301b6ddcca1b29e26d5cc48d54427a001

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uhttpd/Config.in | 1 +
 package/uhttpd/uhttpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/uhttpd/Config.in b/package/uhttpd/Config.in
index 8d5d8bee13..eeb169a96d 100644
--- a/package/uhttpd/Config.in
+++ b/package/uhttpd/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_UHTTPD
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  uHTTPd is a tiny single threaded HTTP server with TLS, CGI
 	  and Lua support. It is intended as a drop-in replacement for
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
index ba8e13ccb8..f4fcccfa67 100644
--- a/package/uhttpd/uhttpd.mk
+++ b/package/uhttpd/uhttpd.mk
@@ -11,6 +11,10 @@ UHTTPD_LICENSE = ISC
 UHTTPD_LICENSE_FILES = uhttpd.h
 UHTTPD_DEPENDENCIES = libubox json-c
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+UHTTPD_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 UHTTPD_DEPENDENCIES += lua
 UHTTPD_CONF_OPTS += -DLUA_SUPPORT=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
