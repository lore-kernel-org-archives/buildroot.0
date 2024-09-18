Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D32CCDD555
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5916B412A2;
	Wed, 18 Sep 2024 20:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0WCNSdKzbrz; Wed, 18 Sep 2024 20:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 156784128B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 156784128B;
	Wed, 18 Sep 2024 20:35:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1197D1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B609C411FE
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_eK8QhMYga8 for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6042A40223
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6042A40223
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B45882128; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 22:27:54 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9705d4baabd3cbfd989c9adc0bf20e9173b4a8f8
X-Git-Newrev: e003060329e71d700010a079a8027ed4872b9eae
X-Patchwork-Hint: ignore
Message-Id: <20240918203458.5B45882128@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/armadillo:
 temporarily update the site URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=e003060329e71d700010a079a8027ed4872b9eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Following an email exchange with Conrad Sand, one of the maintainers of
the project, I learned that version 9.900.2 has been moved to
https://sourceforge.net/projects/arma/files/retired/.

This patch fixes the package download error, waiting for a subsequent
patch that will restore the previous URL to bump to a more recent
version.

Adding the .RETIRED suffix to the downloaded tarball generated the
following error:

armadillo-9.900.2.tar.xz.RETIRED: OK (sha256: d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05)
>>> armadillo 9.900.2 Extracting
buildroot/dl/armadillo/armadillo-9.900.2.tar.xz.RETIRED | buildroot/output/host/bin/tar --strip-components=1 -C buildroot/output/build/armadillo-9.900.2   -xf -
/bin/bash: line 1: buildroot/dl/armadillo/armadillo-9.900.2.tar.xz.RETIRED: Permission denied
buildroot/output/host/bin/tar: This does not look like a tar archive
buildroot/output/host/bin/tar: Exiting with failure status due to previous errors
make[1]: *** [package/pkg-generic.mk:213: buildroot/output/build/armadillo-9.900.2/.stamp_extracted] Error 2

which required the addition of ARMADILLO_EXTRACT_CMDS to be fixed.

Finally, it was also necessary to modify the tarball's hash.

Fixes:
- http://autobuild.buildroot.org/results/d4e9e7b453960a4f62a199344b30b729a4f235bc

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f69fe48404edaf83514920beecc46b2ab83927f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index cc91fb456a..9b19b8c8c4 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05  armadillo-9.900.2.tar.xz
+sha256  d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05  armadillo-9.900.2.tar.xz.RETIRED
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 8661bfd9da..81684a44f7 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ARMADILLO_VERSION = 9.900.2
-ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
-ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
+ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz.RETIRED
+ARMADILLO_SITE = https://sourceforge.net/projects/arma/files/retired
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
@@ -30,4 +30,8 @@ ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
 ARMADILLO_DEPENDENCIES += lapack
 endif
 
+define ARMADILLO_EXTRACT_CMDS
+	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) $($(PKG)_DL_DIR)/$(ARMADILLO_SOURCE)
+endef
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
