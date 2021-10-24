Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647C8C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:16:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB72F60EDF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB72F60EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95C12401E3;
	Sun, 24 Oct 2021 14:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpPEcA31Q28s; Sun, 24 Oct 2021 14:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E04B40251;
	Sun, 24 Oct 2021 14:16:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 094B81BF47D
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECAD1606AE
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4mj_aznpDXU for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:16:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18F4D6066B
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:16:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5C1068862A; Sun, 24 Oct 2021 14:13:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 16:16:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 289a15f33b522ca5c90bef0cdb0851412b00c811
X-Git-Newrev: 657de04a2fbf8f080f3b950cbeee61f2d26f6ad4
X-Patchwork-Hint: ignore
Message-Id: <20211024141316.5C1068862A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipcalc: bump to version 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=657de04a2fbf8f080f3b950cbeee61f2d26f6ad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- Update indentation in hash file (two spaces)

https://gitlab.com/ipcalc/ipcalc/-/blob/1.0.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Do-not-fail-to-build-if-ronn-is-missing.patch | 49 ----------------------
 .../ipcalc/0002-Include-stdarg-for-va_list.patch   | 29 -------------
 package/ipcalc/ipcalc.hash                         |  4 +-
 package/ipcalc/ipcalc.mk                           |  2 +-
 4 files changed, 3 insertions(+), 81 deletions(-)

diff --git a/package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch b/package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch
deleted file mode 100644
index 419f4bba44..0000000000
--- a/package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 322294d7bf61f9fdf0e45e9b6c6013a7c6a35bfd Mon Sep 17 00:00:00 2001
-From: Derrick Lyndon Pallas <derrick@meter.com>
-Date: Wed, 14 Oct 2020 18:25:54 +0000
-Subject: [PATCH] Do not fail to build if ronn is missing
-
-If ruby-ronn is missing, we can not compile the man page from markdown but
-that should not prevent the application from building.
-
-Signed-off-by: Derrick Lyndon Pallas <derrick@meter.com>
----
- meson.build | 23 ++++++++++++-----------
- 1 file changed, 12 insertions(+), 11 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index a2169fc..981d4a4 100644
---- a/meson.build
-+++ b/meson.build
-@@ -72,16 +72,17 @@ ipcalc = executable('ipcalc',
- 	install : true
- )
- 
--ronn = find_program('ronn', required: true)
--
--ipcalc_1 = custom_target(
--	'ipcalc.1',
--	output : 'ipcalc.1',
--	input : 'ipcalc.1.md',
--	command : [ronn, '--pipe', '-r', '@INPUT@'],
--	capture: true,
--	install_dir: join_paths(get_option('mandir'), 'man1'),
--	install: true
--)
-+ronn = find_program('ronn', required: false)
-+if ronn.found()
-+	ipcalc_1 = custom_target(
-+		'ipcalc.1',
-+		output : 'ipcalc.1',
-+		input : 'ipcalc.1.md',
-+		command : [ronn, '--pipe', '-r', '@INPUT@'],
-+		capture: true,
-+		install_dir: join_paths(get_option('mandir'), 'man1'),
-+		install: true
-+	)
-+endif
- 
- subdir('tests')
--- 
-2.28.0
-
diff --git a/package/ipcalc/0002-Include-stdarg-for-va_list.patch b/package/ipcalc/0002-Include-stdarg-for-va_list.patch
deleted file mode 100644
index 9261ce383c..0000000000
--- a/package/ipcalc/0002-Include-stdarg-for-va_list.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7795c02fb1e0f5fdbdf949007e52684c590235d4 Mon Sep 17 00:00:00 2001
-From: Derrick Lyndon Pallas <derrick@meter.com>
-Date: Wed, 14 Oct 2020 18:40:38 +0000
-Subject: [PATCH] Include stdarg for va_list
-
-While several function signatures use va_list, stdarg was never included.
-This fixes that.
-
-Signed-off-by: Derrick Lyndon Pallas <derrick@meter.com>
----
- ipcalc.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ipcalc.h b/ipcalc.h
-index 0e81320..a220dc5 100644
---- a/ipcalc.h
-+++ b/ipcalc.h
-@@ -20,6 +20,8 @@
- #ifndef _IPCALC_H
- #define _IPCALC_H
- 
-+#include <stdarg.h> /* for va_list */
-+
- #if defined(USE_GEOIP)
-   void geo_ip_lookup(const char *ip, char **country, char **ccode, char **city, char  **coord);
-   int geo_setup(void);
--- 
-2.28.0
-
diff --git a/package/ipcalc/ipcalc.hash b/package/ipcalc/ipcalc.hash
index df610eb693..bf9b34a610 100644
--- a/package/ipcalc/ipcalc.hash
+++ b/package/ipcalc/ipcalc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d7aca371335ab3e35364bcfe34cd0229db005be8bebb9236608ec318cb3f7748  ipcalc-1.0.0.tar.bz2
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dac080c0773cc14c1d6f818899351d2286cace85751dd9dc704944e54c2c3565  ipcalc-1.0.1.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index 8a43200456..704844292a 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPCALC_VERSION = 1.0.0
+IPCALC_VERSION = 1.0.1
 IPCALC_SITE = $(call gitlab,ipcalc,ipcalc,$(IPCALC_VERSION))
 IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
