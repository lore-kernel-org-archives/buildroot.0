Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33991E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 15:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D425C80D99;
	Sun, 21 Dec 2025 15:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzQNERoFU-Wr; Sun, 21 Dec 2025 15:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFED480DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766331215;
	bh=gvNO6h3tR1FNyvcewHQ08fFKpZC1Y72YKhjoxByn/+0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tFFNff7id2dEBKABVRCFhJ93T+ww+XdxoBwWGFY+RgqOf/Bijcv1VRSN+hLH+mXEJ
	 ygtJZZpGwzHCi8osCvrnyg0KtstNalzEGkFpN3HebMTVqJ3idhsZmu7ODHepnun3bx
	 x6G9bSB2ySaZez2umY/0YRfkYnaUyJ2UeRNlcwYoy+o6n74H14Mg2cRXMNMP4dJGZ0
	 jvz1PJbSFaEZAbuSuAgSPanc4RdA3qcZHEsEqT5M0FcZ0dmP1421AxPpqvaUeS2f2O
	 fc9HA6LUtMe1h+a93cVtVWgRMi5KEe/kewiCuRRz3v01h50ventlpevKPvRxTFlET3
	 7zB80cnMU2y4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFED480DEE;
	Sun, 21 Dec 2025 15:33:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 306D3119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16F4440337
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4muo6pAOP6s for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 15:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2DDB40092
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2DDB40092
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:33:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB33684CC9; Sun, 21 Dec 2025 15:33:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 16:31:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8446df007e319b71c7b96fa50c323461fd0c61a
X-Git-Newrev: e42b3de3b1ccd41ef1907a791a7d3792d201c0be
X-Patchwork-Hint: ignore
Message-Id: <20251221153331.DB33684CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmbus: bump version to 0.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e42b3de3b1ccd41ef1907a791a7d3792d201c0be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/rscada/libmbus/blob/0.9.0/release_notes.txt

Downloading the source tarball is broken since at least Oct 30th, 2024
as reported by the buildroot autobuilders:
https://autobuild.buildroot.net/?reason=libmbus-0.8.0&step=50&start=50

Switching to the github helper provides the correct source code but the
tarball downloaded has a different hash. A quick search did not provide
alternative download locations for the original tarball
libmbus-0.8.0.tar.gz.

To solve the broken build we do not only switch _SITE to github but also
bump the package to 0.9.0 and add autoreconf which needs two directories
being created in _POST_PATCH_HOOKS. One missing directory was already
reported upstream: https://github.com/rscada/libmbus/issues/179

Updated license hash due to upstream commit:
https://github.com/rscada/libmbus/commit/ab8919136d3cabb943b1cbdd4d6e2f7eea4b8f3f

Fixes:
https://autobuild.buildroot.net/results/91a/91a82dc73bf87cf1969cd6a2ddea1809ab9a1613/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: change release notes url to use tag]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmbus/libmbus.hash |  4 ++--
 package/libmbus/libmbus.mk   | 12 ++++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/libmbus/libmbus.hash b/package/libmbus/libmbus.hash
index 493bab5820..212ae9ddef 100644
--- a/package/libmbus/libmbus.hash
+++ b/package/libmbus/libmbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9fca42592da0ba75df66c6f885a4dbfa916d23e65e3d1ce6e38d940d2a2719a4  libmbus-0.8.0.tar.gz
-sha256  ea171a4ae443eca7186f564db2c3cc8b84c1ac343f227f92cd52ec6a948f4a74  COPYING
+sha256  89fadb9074f5f719b2988cf30af1f8ced3e40f9f499b5b9047f8f33f876cce2d  libmbus-0.9.0.tar.gz
+sha256  034b36d855501ea9c5588f4753335d08757149a02faf1d61baa9a6d861be4e3a  COPYING
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 61f797b5b9..65287b083d 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -4,10 +4,18 @@
 #
 ################################################################################
 
-LIBMBUS_VERSION = 0.8.0
-LIBMBUS_SITE = http://www.rscada.se/public-dist
+LIBMBUS_VERSION = 0.9.0
+LIBMBUS_SITE = $(call github,rscada,libmbus,$(LIBMBUS_VERSION))
 LIBMBUS_INSTALL_STAGING = YES
 LIBMBUS_LICENSE = BSD-3-Clause
 LIBMBUS_LICENSE_FILES = COPYING
+# github tarball does not include configure
+LIBMBUS_AUTORECONF = YES
+# Autoreconf is missing some directories
+define LIBMBUS_CREATE_DIRS
+	mkdir -p $(@D)/libltdl
+	mkdir -p $(@D)/m4
+endef
+LIBMBUS_POST_PATCH_HOOKS += LIBMBUS_CREATE_DIRS
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
