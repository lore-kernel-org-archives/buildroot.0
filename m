Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81179C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A8D482ADD;
	Mon, 27 Jun 2022 22:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A8D482ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_2z9OU1vWor; Mon, 27 Jun 2022 22:27:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D5B882A83;
	Mon, 27 Jun 2022 22:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D5B882A83
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E03601BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8B6640A0D
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8B6640A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23VZIBFbJXgJ for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:26:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11B05400D6
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11B05400D6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A93C2876AE; Mon, 27 Jun 2022 22:14:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:26:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f32afb8f30474897fe51f2baf9ffdfc25b72f8ce
X-Git-Newrev: 6ef40982fa41fe57dc1396af82a1a0ff23a96272
X-Patchwork-Hint: ignore
Message-Id: <20220627221414.A93C2876AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tio: bump to version 1.40
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ef40982fa41fe57dc1396af82a1a0ff23a96272
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package
- Add inih mandatory dependency
- COPYING has been removed because it was redundant with LICENSE file:
  https://github.com/tio/tio/commit/39a9c4bbdaf2f77bda04fdbee506a206eecdb5e9
- Update indentation in hash file (two spaces)

https://github.com/tio/tio/blob/v1.40/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tio/Config.in | 1 +
 package/tio/tio.hash  | 6 +++---
 package/tio/tio.mk    | 7 ++++---
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/tio/Config.in b/package/tio/Config.in
index d5d619100e..a84daf8a24 100644
--- a/package/tio/Config.in
+++ b/package/tio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TIO
 	bool "tio"
 	depends on !BR2_sparc64 && !BR2_sparc
+	select BR2_PACKAGE_INIH
 	help
 	  "tio" is a simple TTY terminal application which features a
 	  straightforward commandline interface to easily connect to
diff --git a/package/tio/tio.hash b/package/tio/tio.hash
index 3053bd1bf0..5058ccca8e 100644
--- a/package/tio/tio.hash
+++ b/package/tio/tio.hash
@@ -1,5 +1,5 @@
-# Locally computed:
-sha256 a8f5ed6994cacb96780baa416b19e5a6d7d67e8c162a8ea4fd9eccd64984ae44  tio-1.32.tar.xz
+# From https://github.com/tio/tio/releases/download/v1.40/tio-1.40.tar.xz.sha256sum:
+sha256  beafc4763552ff7cf3a368e8af36258018ef85fac32133c4635051d7615ab527  tio-1.40.tar.xz
 
 # Hash for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  9248dee77ee136321f24556a96e07ff8f90461013941884a9defd0ac825ef131  LICENSE
diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index 31f1dfb5a8..5c469667f6 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-TIO_VERSION = 1.32
+TIO_VERSION = 1.40
 TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
 TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
 TIO_LICENSE = GPL-2.0+
-TIO_LICENSE_FILES = COPYING
+TIO_LICENSE_FILES = LICENSE
+TIO_DEPENDENCIES = inih
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
