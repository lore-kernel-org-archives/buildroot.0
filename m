Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78358C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:33:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20641610C7
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20641610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2A2160F48;
	Wed,  6 Oct 2021 19:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jb_e8s-_d_cm; Wed,  6 Oct 2021 19:33:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD4C160F46;
	Wed,  6 Oct 2021 19:33:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CA021BF9B6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD00D408F6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlbtSHZDcnJ0 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05C544090D
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7FBDF93465; Wed,  6 Oct 2021 19:28:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b94c49ddcc054bbb1a524ed42266780f0f468f7d
X-Git-Newrev: 3b2ce753bbfb07b0033144600518da6300464ed7
X-Patchwork-Hint: ignore
Message-Id: <20211006192814.7FBDF93465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smcroute: bump version to v2.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b2ce753bbfb07b0033144600518da6300464ed7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Upstream has .sha256 checksum files, drop redundant .md5 checksum
 - Backport upstream patch to silence bogus error message for loopback
 - SMCRoute is useless w/o kernel support, use same fixups as mrouted

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...0001-Avoid-trying-to-delete-inactive-VIFs.patch | 51 ++++++++++++++++++++++
 package/smcroute/smcroute.hash                     |  6 +--
 package/smcroute/smcroute.mk                       |  9 +++-
 3 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch b/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch
new file mode 100644
index 0000000000..07f49dffcf
--- /dev/null
+++ b/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch
@@ -0,0 +1,51 @@
+From 8ce1d117a31e35d97fb955b82edf13514267eaab Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Tue, 28 Sep 2021 11:09:47 +0200
+Subject: [PATCH] Avoid trying to delete inactive VIFs
+Organization: Westermo Network Technologies AB
+
+When probing interfaces at startup, there's a check for IFF_MULTICAST,
+if this flag is not set we try to delete its corresponding VIF/MIF.
+This is for hanlding .conf reload scenarios where an interface has had
+its MULTICAST flag dropped.
+
+However, when starting up on Linux systems, the loopback interface has
+no MULTICAST flag set.  This leads to the following bogus warning:
+
+   Failed deleting VIF for iface lo: Resource temporarily unavailable
+
+This patch makes sure to check if we have a registered kernel VIF/MIF
+for an interface before attempting to delete it.
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+---
+ src/mroute.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/mroute.c b/src/mroute.c
+index 291e9c4..6a80a47 100644
+--- a/src/mroute.c
++++ b/src/mroute.c
+@@ -298,6 +298,9 @@ static int mroute4_del_vif(struct iface *iface)
+ 	if (iface->mrdisc)
+ 		rc = mrdisc_deregister(iface->vif);
+ 
++	if (iface->vif == ALL_VIFS)
++		return 0;
++
+ 	if (kern_vif_del(iface)) {
+ 		switch (errno) {
+ 		case ENOENT:
+@@ -910,6 +913,9 @@ static int mroute6_del_mif(struct iface *iface)
+ {
+ 	int rc = 0;
+ 
++	if (iface->mif == ALL_VIFS)
++		return 0;
++
+ 	if (kern_mif_del(iface) && errno != ENOENT) {
+ 		switch (errno) {
+ 		case ENOENT:
+-- 
+2.25.1
+
diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index 62b72239cc..26d55adf88 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,6 +1,6 @@
-# Upstream .md5 and .sha256 from GitHub
-sha256	7eca88389cc08cbfe75f787e02ab32a390ef806555069a08abe8d7fa925ed094  smcroute-2.5.2.tar.gz
-md5	dc29e6bd3024a1ad3dd0f2d8c2aed16e  smcroute-2.5.2.tar.gz
+# Upstream .sha256 from GitHub
+sha256	4342b95c99e410cab75e9ee80f20480e0170d8b07b8e31553ba1bec3e377fc56  smcroute-2.5.3.tar.gz
 
 # Locally generated
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  d260ea4b9d4b01317568850c3271e3923b546ea4ad57c899e79434f1cc8bcf0b  0001-Avoid-trying-to-delete-inactive-VIFs.patch
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index e8fc54bb42..96da0dc346 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.5.2
+SMCROUTE_VERSION = 2.5.3
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
@@ -30,4 +30,11 @@ endef
 
 SMCROUTE_POST_INSTALL_TARGET_HOOKS += SMCROUTE_PRUNE_COMPAT_SCRIPT
 
+# We will asume that CONFIG_NET and CONFIG_INET are already
+# set in the kernel configuration provided by the user.
+define MROUTED_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTICAST)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MROUTE)
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
