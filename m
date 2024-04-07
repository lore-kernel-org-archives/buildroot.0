Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB20CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66721408F1;
	Sun,  7 Apr 2024 15:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmsfalvOyoRc; Sun,  7 Apr 2024 15:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C94640911
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C94640911;
	Sun,  7 Apr 2024 15:37:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5D71BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC0DF60A53
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDhhlWvfSI5Y for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADA27608BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADA27608BD
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A82E77FD28; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e7450b63d33dc059de0f5352d7b31afe32c17d3
X-Git-Newrev: 166b05b54585bd67ed7920152462f6fe7778f3c4
X-Patchwork-Hint: ignore
Message-Id: <20240407153657.A82E77FD28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: add libxcrypt optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=166b05b54585bd67ed7920152462f6fe7778f3c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

configure: error: crypt() not found

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/cd97aa4ee49c3052b762deccb5aa28cd23c54f5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/shadow/Config.in | 1 +
 package/shadow/shadow.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index b08b06457b..987605c7fa 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -3,6 +3,7 @@ menuconfig BR2_PACKAGE_SHADOW
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # reallocarray, explicit_bzero
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Utilities to deal with user accounts.
 
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 2092903b2d..491f271330 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -88,6 +88,10 @@ else
 SHADOW_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SHADOW_DEPENDENCIES += libxcrypt
+endif
+
 # linux-pam is also used without account-tools-setuid enabled
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 SHADOW_CONF_OPTS += --with-libpam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
