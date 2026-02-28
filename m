Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C864BFEE4ED
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 15:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A367407CD;
	Sat, 28 Feb 2026 15:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfZqbnryOuln; Sat, 28 Feb 2026 15:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB33407CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772293061;
	bh=V5ohTY86Lla8ed+CGljmsoGVY18yFTeZZg6yhcFQwvU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K4fPhjQX+thfdtoDNSCYW+ecSTsZoIF4KfYiStwdrsfnwltyDYYD2hRNEm7my3NHW
	 KiTAGe3b8qXW94fvSucoskpAVuilgfeEOc91HGAMRtFj05TE5EfI7Le87XGXEhjfmH
	 Ll1xpYyUcPkAqtfOV19YbLfNKgbBzq36K+E2J7xhkkLHc6hHJWRnJ3+ukY/iIBfr95
	 pCmfAs5Rs/eiWMHeWSIVnwMP0VXgDj6dH1K7359wAOvCYivKuIbYAg3/3fEiTKDbCx
	 fgRxzWPaVvie6Z6IFvypKA68xPa3gWLN8Gw3TGNIiuamAjp7cxbCsRg2Y6N6Gopggw
	 iyPk+M6QsBVGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB33407CE;
	Sat, 28 Feb 2026 15:37:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB6D01D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 913C983C59
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfV-sL7vtcIQ for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 15:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE6083388
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EE6083388
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 891A9852ED; Sat, 28 Feb 2026 15:37:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 16:22:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a035a0f99fa3bbeca776d741bbdeb6c04b3b35c8
X-Git-Newrev: 359a92df2964f9af2f01b770c38bcdc7f9cba641
X-Patchwork-Hint: ignore
Message-Id: <20260228153737.891A9852ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lxc: bump version to
 6.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/359a92df2964f9af2f01b770c38bcdc7f9cba641
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://discuss.linuxcontainers.org/t/lxc-6-0-lts-has-been-released/19567
https://discuss.linuxcontainers.org/t/lxc-6-0-1-lts-has-been-released/20283
https://discuss.linuxcontainers.org/t/lxc-6-0-2-lts-has-been-released/21632
https://discuss.linuxcontainers.org/t/lxc-6-0-3-lts-has-been-released/22402
https://discuss.linuxcontainers.org/t/lxc-6-0-4-lts-has-been-released/23390
https://discuss.linuxcontainers.org/t/lxc-6-0-5-lts-has-been-released/24438

Removed patch which is included in this release.

Systemd support was replaced by dbus:
https://github.com/lxc/lxc/commit/820d2a2b3a886ebfe46cd256ba8c320e50fcc5cd

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...1-src-lxc-syscall_numbers.h-drop-define-1.patch | 138 ---------------------
 package/lxc/lxc.hash                               |   2 +-
 package/lxc/lxc.mk                                 |  10 +-
 3 files changed, 6 insertions(+), 144 deletions(-)

diff --git a/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
deleted file mode 100644
index d6eb7476dc..0000000000
--- a/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 964740d28c9a0da52a75d579d7fdfa53df67e925 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 30 Mar 2024 16:50:46 +0100
-Subject: [PATCH] src/lxc/syscall_numbers.h: drop define -1
-
-Drop "#define -1" to avoid the following m68k build failure with gcc 12:
-
-In file included from ../src/lxc/syscall_wrappers.h:19,
-                 from ../src/lxc/mount_utils.h:15,
-                 from ../src/lxc/conf.h:24,
-                 from ../src/lxc/log.h:19,
-                 from ../src/lxc/storage/btrfs.c:20:
-../src/lxc/syscall_numbers.h:423:25: error: macro names must be identifiers
-  423 |                 #define -1
-      |                         ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/f40a517eba86838b11b4b1d6a8a05b8233a3394d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/lxc/lxc/commit/82fe01821cd5cb8548598d7d93b07d6ef3f6b604
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- src/lxc/syscall_numbers.h | 13 -------------
- 1 file changed, 13 deletions(-)
-
-diff --git a/src/lxc/syscall_numbers.h b/src/lxc/syscall_numbers.h
-index ae5fdd0641c6..5dc1259fef1c 100644
---- a/src/lxc/syscall_numbers.h
-+++ b/src/lxc/syscall_numbers.h
-@@ -51,7 +51,6 @@
- 			#define __NR_keyctl 5241
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_keyctl not defined for your architecture"
- 	#endif
- #endif
-@@ -88,7 +87,6 @@
- 			#define __NR_memfd_create 5314
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_memfd_create not defined for your architecture"
- 	#endif
- #endif
-@@ -123,7 +121,6 @@
- 			#define __NR_pivot_root 5151
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_pivot_root not defined for your architecture"
- 	#endif
- #endif
-@@ -158,7 +155,6 @@
- 			#define __NR_setns 5303
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_setns not defined for your architecture"
- 	#endif
- #endif
-@@ -193,7 +189,6 @@
- 			#define __NR_sethostname 5165
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_sethostname not defined for your architecture"
- 	#endif
- #endif
-@@ -260,7 +255,6 @@
- 			#define __NR_signalfd4 5283
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_signalfd4 not defined for your architecture"
- 	#endif
- #endif
-@@ -295,7 +289,6 @@
- 			#define __NR_unshare 5262
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_unshare not defined for your architecture"
- 	#endif
- #endif
-@@ -330,7 +323,6 @@
- 			#define __NR_bpf 5315
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_bpf not defined for your architecture"
- 	#endif
- #endif
-@@ -365,7 +357,6 @@
- 			#define __NR_faccessat 5259
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_faccessat not defined for your architecture"
- 	#endif
- #endif
-@@ -420,7 +411,6 @@
- 			#define __NR_seccomp 5312
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_seccomp not defined for your architecture"
- 	#endif
- #endif
-@@ -455,7 +445,6 @@
- 			#define __NR_gettid 5178
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_gettid not defined for your architecture"
- 	#endif
- #endif
-@@ -494,7 +483,6 @@
- 			#define __NR_execveat 5316
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_execveat not defined for your architecture"
- 	#endif
- #endif
-@@ -733,7 +721,6 @@
- 			#define __NR_personality (132 + 5000)
- 		#endif
- 	#else
--		#define -1
- 		#warning "__NR_personality not defined for your architecture"
- 	#endif
- #endif
--- 
-2.43.0
-
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 8b3365ddfc..cfe0e5ab6b 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2693a4c654dcfdafb3aa95c262051d8122afa1b6f5cef1920221ebbdee934d07  lxc-5.0.3.tar.gz
+sha256  2e540c60b9dd49e7ee1a4efa5e9c743b05df911b81b375ed5043d9dd7ee0b48a  lxc-6.0.5.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 7a5f91e1a8..2f17960e55 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 5.0.3
+LXC_VERSION = 6.0.5
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
@@ -69,11 +69,11 @@ else
 LXC_CONF_OPTS += -Dopenssl=false
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-LXC_CONF_OPTS += -Dsd-bus=enabled
-LXC_DEPENDENCIES += systemd
+ifeq ($(BR2_PACKAGE_DBUS),y)
+LXC_CONF_OPTS += -Ddbus=true
+LXC_DEPENDENCIES += dbus
 else
-LXC_CONF_OPTS += -Dsd-bus=disabled
+LXC_CONF_OPTS += -Ddbus=false
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
