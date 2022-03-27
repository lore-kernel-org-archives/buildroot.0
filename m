Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1144DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C75DF60BA1;
	Sun, 27 Mar 2022 16:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atOnIKWAYh0m; Sun, 27 Mar 2022 16:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E842C60B9D;
	Sun, 27 Mar 2022 16:10:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4B41BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B08A60B9D
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vxBi2bil4c2 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4CE860E2B
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 585CF85DB6; Sun, 27 Mar 2022 16:00:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:59:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3de486f8b052b25c8e29a82903b334ca90f25735
X-Git-Newrev: b5f82a4a5a6f14b4d178a4d662784d7bd6f7fada
X-Patchwork-Hint: ignore
Message-Id: <20220327160039.585CF85DB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wget: bump version to 1.21.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5f82a4a5a6f14b4d178a4d662784d7bd6f7fada
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 1.21.3 (for details see [1])

- remove legacy --with-libidn option (see [2]), replace with
  --enable-iri option in case locale support and libidn2 are available

[1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00017.html
[2] https://git.savannah.gnu.org/cgit/wget.git/commit/configure.ac?id=a24e67e239ef949cc77a4c4e5a0beb703026a296

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wget/wget.hash | 4 ++--
 package/wget/wget.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 7f89bedb88..22674650a2 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3  wget-1.21.2.tar.lz
+sha256  dbd2fb5e47149d4752d0eaa0dac68cc49cf20d46df4f8e326ffc8f18b2af4ea5  wget-1.21.3.tar.lz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 8a73c33699..455faaed12 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.2
+WGET_VERSION = 1.21.3
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
@@ -33,11 +33,12 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WGET_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIDN2),y)
-WGET_CONF_OPTS += --with-libidn
+# BR2_ENABLE_LOCALE and BR2_PACKAGE_LIBICONV are mutually exclusive
+ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV)$(BR2_PACKAGE_LIBIDN2),yy)
+WGET_CONF_OPTS += --enable-iri
 WGET_DEPENDENCIES += libidn2
 else
-WGET_CONF_OPTS += --without-libidn
+WGET_CONF_OPTS += --disable-iri
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
