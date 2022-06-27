Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C27C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A744159A;
	Mon, 27 Jun 2022 20:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A744159A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KWREaHVViFa; Mon, 27 Jun 2022 20:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D76B40946;
	Mon, 27 Jun 2022 20:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D76B40946
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D85981BF9B5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2AF160E33
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2AF160E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgf2UKM1pCjd for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0326E60C0A
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0326E60C0A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C1E3D875B4; Mon, 27 Jun 2022 20:31:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 22:39:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7601ca8a6280bb17b96c9a8728a506cae9554f18
X-Git-Newrev: f95e593c0127951c870221b812553b23ade06d9d
X-Patchwork-Hint: ignore
Message-Id: <20220627203135.C1E3D875B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speexdsp: bump to version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f95e593c0127951c870221b812553b23ade06d9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball and so drop autoreconf
- Update hash of COPYING (trailing white space removed:
  https://gitlab.xiph.org/xiph/speexdsp/-/commit/68311d46785be76d2a186c75578d51108bff6dfb)

https://gitlab.xiph.org/xiph/speexdsp/-/tags/SpeexDSP-1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/speexdsp/speexdsp.hash | 6 ++++--
 package/speexdsp/speexdsp.mk   | 6 ++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/speexdsp/speexdsp.hash b/package/speexdsp/speexdsp.hash
index 82e054d4d4..b46df791b4 100644
--- a/package/speexdsp/speexdsp.hash
+++ b/package/speexdsp/speexdsp.hash
@@ -1,3 +1,5 @@
+# From https://ftp.osuosl.org/pub/xiph/releases/speex/SHA256SUMS.txt
+sha256  8c777343e4a6399569c72abc38a95b24db56882c83dbdb6c6424a5f4aeb54d3d  speexdsp-1.2.1.tar.gz
+
 # Locally computed
-sha256  0fe0e31be215f820bed0f9c913c673997773fce3a03a4555658e7b73a54eed7b  speexdsp-SpeexDSP-1.2.0.tar.bz2
-sha256  671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
+sha256  2654a4264b2bfe298dedc508748d140111840c315cc8eb646a3a68c13fa75b01  COPYING
diff --git a/package/speexdsp/speexdsp.mk b/package/speexdsp/speexdsp.mk
index 8e886b2b21..8edad7c0d2 100644
--- a/package/speexdsp/speexdsp.mk
+++ b/package/speexdsp/speexdsp.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-SPEEXDSP_VERSION = 1.2.0
-SPEEXDSP_SOURCE = speexdsp-SpeexDSP-$(SPEEXDSP_VERSION).tar.bz2
-SPEEXDSP_SITE = https://gitlab.xiph.org/xiph/speexdsp/-/archive/SpeexDSP-$(SPEEXDSP_VERSION)
+SPEEXDSP_VERSION = 1.2.1
+SPEEXDSP_SITE = https://downloads.xiph.org/releases/speex
 SPEEXDSP_LICENSE = BSD-3-Clause
 SPEEXDSP_LICENSE_FILES = COPYING
 SPEEXDSP_INSTALL_STAGING = YES
 SPEEXDSP_DEPENDENCIES = host-pkgconf
-SPEEXDSP_AUTORECONF = YES
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
