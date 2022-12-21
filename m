Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8337DC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 08:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 113F361002;
	Wed, 21 Dec 2022 08:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 113F361002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKi30hfmjGnd; Wed, 21 Dec 2022 08:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 034E16102E;
	Wed, 21 Dec 2022 08:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034E16102E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF5A71BF3F6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 08:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB0FE61020
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 08:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB0FE61020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJXWxR4vWtoT for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 08:10:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C272160FD5
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 08:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C272160FD5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE4AA86B23; Wed, 21 Dec 2022 08:10:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 09:07:05 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c463cfc0fbf9c0acbf7464eb70f421a9e3fc4ec2
X-Git-Newrev: b61f781e5057a1f56565250def900e1ae1a9a03c
X-Patchwork-Hint: ignore
Message-Id: <20221221081019.AE4AA86B23@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/exempi: bump to
 version 2.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b61f781e5057a1f56565250def900e1ae1a9a03c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Samples can be disabled since version 2.6.2 and
https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/a8db9f4e7e4156ee7e52def01f1f83ca5fa7de40

This bump will fix the following build failure on arm with gcc 10 raised
since bump to version 2.6.0 in commit
55f1d0a3592253df2a356c195e5131a970eade9b and
https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/0872e35a30457d2ecf746a1bebdb7d94636d0e2f
https://github.com/adobe/XMP-Toolkit-SDK/commit/0872e35a30457d2ecf746a1bebdb7d94636d0e2f
thanks to
https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/f26d77ba26a7245a95068bca2eea9608f4e79f80:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../XMPFiles/source/.libs/libXMPFiles.a(XMPFiles_Impl.o):(.rodata+0x5c): multiple definition of `typeinfo name for TXMPMeta<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >'; XMPFilesCoverage.o:(.rodata+0x0): first defined here

https://gitlab.freedesktop.org/libopenraw/exempi/-/blob/2.6.3/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/c440719de02a154c6bdae11bda06ea30c131c71d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 63b540638c72969bf8c3eb6c06e1c49c4fbcbb9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exempi/exempi.hash | 2 +-
 package/exempi/exempi.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
index 5df610de17..772d9130d4 100644
--- a/package/exempi/exempi.hash
+++ b/package/exempi/exempi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  072451ac1e0dc97ed69a2e5bfc235fd94fe093d837f65584d0e3581af5db18cd  exempi-2.6.1.tar.bz2
+sha256  80b3aa0b7f54978c6a49cc5f5f1d3b6e9524b59de74ef92b3bf0abeba4c28fb1  exempi-2.6.3.tar.xz
 sha256  3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index 56fbe20379..f808afd53c 100644
--- a/package/exempi/exempi.mk
+++ b/package/exempi/exempi.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-EXEMPI_VERSION = 2.6.1
-EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
+EXEMPI_VERSION = 2.6.3
+EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.xz
 EXEMPI_SITE = https://libopenraw.freedesktop.org/download
 EXEMPI_INSTALL_STAGING = YES
-EXEMPI_CONF_OPTS = --disable-unittest
+EXEMPI_CONF_OPTS = --disable-samples --disable-unittest
 EXEMPI_DEPENDENCIES = host-pkgconf expat zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 EXEMPI_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
