Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E162C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 21:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48AC660C07;
	Sun, 13 Mar 2022 21:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kj-iRIfxfmi5; Sun, 13 Mar 2022 21:27:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 549B860B1B;
	Sun, 13 Mar 2022 21:27:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD14C1BF982
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C780781D70
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Z6NEHKfMfYu for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 21:26:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D37DB81DB2
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 21:26:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8320683CFD; Sun, 13 Mar 2022 21:17:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 22:17:22 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e838466c74dd7088074156e722a2c28797eb4f2e
X-Git-Newrev: d578d93e0e1dce841d8d9fe75f12d37a6c1f1661
X-Patchwork-Hint: ignore
Message-Id: <20220313211754.8320683CFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libxml2: security
 bump to version 2.9.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=d578d93e0e1dce841d8d9fe75f12d37a6c1f1661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following security issues:
- [CVE-2022-23308] Use-after-free of ID and IDREF attributes
- Use-after-free in xmlXIncludeCopyRange
- Fix Null-deref-in-xmlSchemaGetComponentTargetNs
- Fix memory leak in xmlXPathCompNodeTest
- Fix null pointer deref in xmlStringGetNodeList
- Fix several memory leaks found by Coverity

https://gitlab.gnome.org/GNOME/libxml2/-/tags/v2.9.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4b6703847376838d0b091acd9b0e0193b6439657)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index ce6c3c4825..81ac3e3f31 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256  c8d6681e38c56f172892c85ddc0852e1fd4b53b4209e7f4ebf17f7e2eae71d92  libxml2-2.9.12.tar.gz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.9/libxml2-2.9.13.sha256sum
+sha256  276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e  libxml2-2.9.13.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 5d688acae5..f13eaff1ad 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,8 +4,11 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.12
-LIBXML2_SITE = http://xmlsoft.org/sources
+LIBXML2_VERSION_MAJOR = 2.9
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).13
+LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
+LIBXML2_SITE = \
+	http://ftp.gnome.org/pub/gnome/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
