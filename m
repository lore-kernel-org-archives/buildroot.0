Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DE6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D44C040903;
	Sun, 27 Feb 2022 19:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2Jtvm54ENTG; Sun, 27 Feb 2022 19:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08084408F2;
	Sun, 27 Feb 2022 19:47:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D6A61BF3EC
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CED3240220
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnj5X8awgSLl for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:45:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF35A40533
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:45:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 45A23836B3; Sun, 27 Feb 2022 19:37:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:34:50 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b7179080ca9b0d9c7f8933050325bb4a5d13123b
X-Git-Newrev: 307f91968d2b7e7c6f005326e23664939e1600df
X-Patchwork-Hint: ignore
Message-Id: <20220227193728.45A23836B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/util-linux: bump
 version to 2.37.3 (fixes CVE-2021-3996, CVE-2021-3995)
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

commit: https://git.buildroot.net/buildroot/commit/?id=307f91968d2b7e7c6f005326e23664939e1600df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- add 'touch' workaround for missing disk-utils/raw.8 file ([1], [2]) in
  util-linux-2.37.3 release download package

For details see [1].

[1] https://www.spinics.net/lists/util-linux-ng/msg17037.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: put fix in POST_PATCH instead of PRE_COMPILE hook]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b292f1d41a8734b6cdcbcf2ae726b51f9e1338a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index eafbe9254a..9c10a42dca 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
-sha256  6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9  util-linux-2.37.2.tar.xz
+sha256  590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776  util-linux-2.37.3.tar.xz
 # License files, locally calculated
 sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index cf0fee409b..e59ef7dadc 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.37
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -35,6 +35,13 @@ UTIL_LINUX_CONF_OPTS += \
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 
+# workaround missing disk-utils/raw.8 file in util-linux-2.37.3
+# release download package
+define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
+	touch $(@D)/disk-utils/raw.8
+endef
+UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
+
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
