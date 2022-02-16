Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CD0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 22:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B00B0416FC;
	Wed, 16 Feb 2022 22:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EszNhgdDtNcc; Wed, 16 Feb 2022 22:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0A7F416E3;
	Wed, 16 Feb 2022 22:23:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAF631BF59C
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 22:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D969440278
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 22:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1pD9aUau3w8 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 22:23:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 276F940274
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 22:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 45F8A8378B; Wed, 16 Feb 2022 22:15:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 23:22:48 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1db408a3512719b3cb6da649be539de9a047b462
X-Git-Newrev: 245a2838267334e2d6e2d62a749f6b386f82a1ba
X-Patchwork-Hint: ignore
Message-Id: <20220216221530.45F8A8378B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/xen: security
 bump to version 4.14.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=245a2838267334e2d6e2d62a749f6b386f82a1ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Includes a number of bugfixes and the security fixes up to xsa-395:
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-4/

Drop the now upstream xsa38* patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7d3845f10ccc0810243036439b955cd9f49d3da4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 11 +----------
 package/xen/xen.mk   | 19 +------------------
 2 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 10a778053a..a81d05e3f7 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,12 +1,3 @@
 # Locally computed
-sha256  a3dad76a772393a1875e8f44a6059a95fea4bde40f97b800966969ac6f3a498d  xen-4.14.3.tar.gz
+sha256  e76d56dfcdabf5d80aa06819f44472de49526a518dbb483eb08e7ff9aec2c669  xen-4.14.4.tar.gz
 sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
-# https://xenbits.xenproject.org/xsa/advisory-385.html
-sha256  831e86c3adfec532b1a48a0b967b7c58c37db3733aee8d78216eb9d535b34f12  xsa385-4.15.patch
-# https://xenbits.xenproject.org/xsa/advisory-386.html
-sha256  f2f83c825e249bba9454437b48bbd8307fe7a224f56484388a67af124dfd279b  xsa386.patch
-# https://xenbits.xenproject.org/xsa/advisory-388.html
-sha256  6917267482101a3f8f1d13905e14994344a0af81370c7a2b92275fb176b321a0  xsa388-4.14-1.patch
-sha256  d5886e046c69f34f98f7e1fc6ffcc36d92f8fc79242b9dc88412c39aa79b4ac3  xsa388-4.14-2.patch
-# https://xenbits.xenproject.org/xsa/advisory-389.html
-sha256  b243284679b32ab8c817a2e41562d8694d9781fa8096c268bb41b0cd91684baa  xsa389-4.14.patch
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index cfc166dc4c..03341d4275 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,30 +4,13 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.14.3
+XEN_VERSION = 4.14.4
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_CPE_ID_VENDOR = xen
 XEN_CPE_ID_PREFIX = cpe:2.3:o
 XEN_DEPENDENCIES = host-acpica host-python3
-XEN_PATCH = \
-	https://xenbits.xenproject.org/xsa/xsa385-4.15.patch \
-	https://xenbits.xenproject.org/xsa/xsa386.patch \
-	https://xenbits.xenproject.org/xsa/xsa388-4.14-1.patch \
-	https://xenbits.xenproject.org/xsa/xsa388-4.14-2.patch \
-	https://xenbits.xenproject.org/xsa/xsa389-4.14.patch
-
-# xsa385-4.15.patch
-XEN_IGNORE_CVES += CVE-2021-28706
-# xsa386.patch
-XEN_IGNORE_CVES += CVE-2021-28702
-# xsa388-4.14-1.patch
-XEN_IGNORE_CVES += CVE-2021-28704 CVE-2021-28707
-# xsa388-4.14-2.patch
-XEN_IGNORE_CVES += CVE-2021-28708
-# xsa389-4.14.patch
-XEN_IGNORE_CVES += CVE-2021-28705 CVE-2021-28709
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
