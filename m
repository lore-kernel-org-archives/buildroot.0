Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C58CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA7B407C3;
	Sun,  7 Apr 2024 15:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZvHMsqmXELv; Sun,  7 Apr 2024 15:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4569407CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4569407CD;
	Sun,  7 Apr 2024 15:37:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 888F91BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A7581E00
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBwAZbCxRP_a for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F0781DF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8F0781DF7
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D030855F4; Sun,  7 Apr 2024 15:36:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 345ccb523e412b390d42073cd976a3288b0733c1
X-Git-Newrev: 6a1059850cd28b2bf25eabb5fa1c44d3ff92fd55
X-Patchwork-Hint: ignore
Message-Id: <20240407153656.9D030855F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtty: add libxcrypt optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a1059850cd28b2bf25eabb5fa1c44d3ff92fd55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-14/output-1/host/lib/gcc/i686-buildroot-linux-gnu/12.3.0/../../../../i686-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/0fd5a118f6173233fc3e9ebc9477948031355dd7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rtty/Config.in | 1 +
 package/rtty/rtty.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/rtty/Config.in b/package/rtty/Config.in
index 198d465713..da5afb8364 100644
--- a/package/rtty/Config.in
+++ b/package/rtty/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RTTY
 	bool "rtty"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Access your device's terminal from anywhere via the web.
 
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 8a40f584de..b2fac14432 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -10,6 +10,10 @@ RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
 RTTY_DEPENDENCIES = libev
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+RTTY_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 RTTY_DEPENDENCIES += mbedtls
 RTTY_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
