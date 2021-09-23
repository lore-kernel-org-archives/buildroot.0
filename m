Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091CAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:07:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82C760F70
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C82C760F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F08360643;
	Thu, 23 Sep 2021 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hH3a9Flazr5W; Thu, 23 Sep 2021 21:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBE3B606B8;
	Thu, 23 Sep 2021 21:07:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10FDC1BF9C2
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3DC34049B
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89brBZclnhGM for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF55A404FA
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3C5AC8D212; Thu, 23 Sep 2021 21:04:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 22:22:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 013eee14520e08d04beec9706d917a052952d6c1
X-Git-Newrev: c3a907a770b88529ea5a93c77cf001096799c556
X-Patchwork-Hint: ignore
Message-Id: <20210923210442.3C5AC8D212@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbredir: bump to version 0.11.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c3a907a770b88529ea5a93c77cf001096799c556
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package
- Add patch to allow tests to be disabled
- Update indentation in hash file (two spaces)

usbredirserver was the only executable that was installed before.
Disable tools to keep the same behavior.

https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.11.0/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/usbredir/0001-meson-add-tests-option.patch | 46 ++++++++++++++++++++++
 package/usbredir/usbredir.hash                     | 10 +++--
 package/usbredir/usbredir.mk                       | 10 +++--
 3 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/package/usbredir/0001-meson-add-tests-option.patch b/package/usbredir/0001-meson-add-tests-option.patch
new file mode 100644
index 0000000000..b2df1587b1
--- /dev/null
+++ b/package/usbredir/0001-meson-add-tests-option.patch
@@ -0,0 +1,46 @@
+From 8490a7ac101d4ee0a78c44b252d3b7a6c2508c74 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 21 Aug 2021 11:55:48 +0200
+Subject: [PATCH] meson: add tests option
+
+Add tests option to allow the user to disable them
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.freedesktop.org/spice/usbredir/-/commit/8490a7ac101d4ee0a78c44b252d3b7a6c2508c74]
+---
+ meson.build       | 4 +++-
+ meson_options.txt | 5 +++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 6e773a7..a6d21b8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -106,7 +106,9 @@ if host_machine.system() != 'windows'
+         subdir('fuzzing')
+     endif
+ endif
+-subdir('tests')
++if get_option('tests').enabled()
++    subdir('tests')
++endif
+ subdir('data')
+ 
+ summary(summary_info, bool_yn: true)
+diff --git a/meson_options.txt b/meson_options.txt
+index b35732b..63e8c85 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -21,3 +21,8 @@ option('tools',
+     type : 'feature',
+     value : 'enabled',
+     description : 'Build usbredir\'s tools such as usbredirect')
++
++option('tests',
++    type : 'feature',
++    value : 'enabled',
++    description : 'Build usbredir\'s tests such as filter')
+-- 
+GitLab
+
diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index 485315d28c..e11d4aa720 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,4 +1,6 @@
-# locally computed hash
-sha256 87bc9c5a81c982517a1bec70dc8d22e15ae197847643d58f20c0ced3c38c5e00  usbredir-0.8.0.tar.bz2
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LIB
+# https://spice-space.org/download/usbredir/usbredir-0.11.0.tar.xz.sha256sum
+sha256  72dd5f3aa90dfbc0510b5149bb5b1654c8f21fdc405dfce7b5dc163dcff19cba  usbredir-0.11.0.tar.xz
+
+# Hash for license files
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LIB
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 8848670ea9..25c4bb382e 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.8.0
-USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.bz2
+USBREDIR_VERSION = 0.11.0
+USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
 USBREDIR_SITE = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPL-2.1+ (libraries)
 USBREDIR_LICENSE_FILES = COPYING.LIB
 USBREDIR_INSTALL_STAGING = YES
 USBREDIR_DEPENDENCIES = host-pkgconf libusb
+USBREDIR_CONF_OPTS = \
+	-Dgit_werror=disabled \
+	-Dtests=disabled \
+	-Dtools=disabled
 
 ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
 
@@ -26,4 +30,4 @@ USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
 
 endif # BR2_PACKAGE_USBREDIR_SERVER
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
