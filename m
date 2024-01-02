Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E2DC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07F0B40A5B;
	Tue,  2 Jan 2024 20:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F0B40A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id We87Gq0vanhN; Tue,  2 Jan 2024 20:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D945940A7D;
	Tue,  2 Jan 2024 20:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D945940A7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA9E1BF302
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D949C408C0
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D949C408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O07v823LSiXG for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B434540A5C
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B434540A5C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1BB583CBF; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:08:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b25176ee9a373d00ab18e46d3e39f6a56dfbbfcf
X-Git-Newrev: 17fb3f966d400943466440704500fd401080f443
X-Patchwork-Hint: ignore
Message-Id: <20240102201716.A1BB583CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pax-utils: bump to version 1.3.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=17fb3f966d400943466440704500fd401080f443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to get latest release
- autotools has been replaced by meson since
  https://gitweb.gentoo.org/proj/pax-utils.git/commit/?id=063fcaeaa05074a9d90acec2f68b25dfb8ecd279

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pax-utils/pax-utils.hash |  2 +-
 package/pax-utils/pax-utils.mk   | 23 +++++++++++++----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/package/pax-utils/pax-utils.hash b/package/pax-utils/pax-utils.hash
index 0ef8fad643..464dd14a5b 100644
--- a/package/pax-utils/pax-utils.hash
+++ b/package/pax-utils/pax-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9742d2a31d53a4e0f6df0d3721ab6f7cf8b0404c95fee3b00e678c1ff6db7f21  pax-utils-1.2.6.tar.xz
+sha256  907fdcfc6c6c2913a8e42847f8096027b0a953b9344208d14daf2324fd711638  pax-utils-1.3.7.tar.bz2
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index 704e50e738..5dd1842df3 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -4,28 +4,31 @@
 #
 ################################################################################
 
-PAX_UTILS_VERSION = 1.2.6
-PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
-PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
+PAX_UTILS_VERSION = 1.3.7
+PAX_UTILS_SITE = https://gitweb.gentoo.org/proj/pax-utils.git/snapshot
+PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.bz2
 PAX_UTILS_LICENSE = GPL-2.0
 PAX_UTILS_LICENSE_FILES = COPYING
 PAX_UTILS_CPE_ID_VENDOR = gentoo
 
 PAX_UTILS_DEPENDENCIES = host-pkgconf
-PAX_UTILS_CONF_OPTS = --without-python
+PAX_UTILS_CONF_OPTS = \
+	-Dbuild_manpages=disabled \
+	-Dlddtree_implementation=sh \
+	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 PAX_UTILS_DEPENDENCIES += libcap
-PAX_UTILS_CONF_OPTS += --with-caps
+PAX_UTILS_CONF_OPTS += -Duse_libcap=enabled
 else
-PAX_UTILS_CONF_OPTS += --without-caps
+PAX_UTILS_CONF_OPTS += -Duse_libcap=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 PAX_UTILS_DEPENDENCIES += libseccomp
-PAX_UTILS_CONF_OPTS += --with-seccomp
+PAX_UTILS_CONF_OPTS += -Duse_seccomp=true
 else
-PAX_UTILS_CONF_OPTS += --without-seccomp
+PAX_UTILS_CONF_OPTS += -Duse_seccomp=false
 endif
 
 # lddtree and symtree need bash
@@ -36,5 +39,5 @@ endef
 endif
 PAX_UTILS_POST_INSTALL_TARGET_HOOKS += PAX_UTILS_REMOVE_BASH_TOOLS
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
