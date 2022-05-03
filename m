Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172ADC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A144181443;
	Tue,  3 May 2022 19:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHReAdDSSBzi; Tue,  3 May 2022 19:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC2F581396;
	Tue,  3 May 2022 19:24:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B71E61BF33A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4FD3401C5
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGwKNzvpCnFI for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:24:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D37B5400F8
 for <buildroot@buildroot.org>; Tue,  3 May 2022 19:24:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 94DDD85162; Tue,  3 May 2022 19:14:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 21:22:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4bb84ad1743a643a748734245c1715e93ed25c3
X-Git-Newrev: d9ac60d52a0a44281eb0a9ae9bb876942168edbb
X-Patchwork-Hint: ignore
Message-Id: <20220503191422.94DDD85162@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eigen: bump to version 3.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9ac60d52a0a44281eb0a9ae9bb876942168edbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 3.3.7:
- https://eigen.tuxfamily.org/index.php?title=ChangeLog#Eigen_3.3.8
- https://eigen.tuxfamily.org/index.php?title=ChangeLog#Eigen_3.3.9
- https://eigen.tuxfamily.org/index.php?title=ChangeLog#Eigen_3.4.0

This commit slightly change the logic defining CMAKE_Fortran_COMPILER in
CONF_OPTS to set it only if BR2_TOOLCHAIN_HAS_FORTRAN=y. This is because
eigen cmake file fails if CMAKE_Fortran_COMPILER is set to a
non-existing fortran compiler.

Note: COPYING.BSD hash changed due to the addition of a new-line at the
end of the file. The content of the file did not changed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/eigen/eigen.hash | 4 ++--
 package/eigen/eigen.mk   | 9 ++++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/eigen/eigen.hash b/package/eigen/eigen.hash
index 5ec561ad10..ad7d6da9dc 100644
--- a/package/eigen/eigen.hash
+++ b/package/eigen/eigen.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256  685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11  eigen-3.3.7.tar.bz2
-sha256  4f877e5ae4672568ef82cfd0023e2cef4a7cf55d867ab249efc9569a7eb9e5b1  COPYING.BSD
+sha256  b4c198460eba6f28d34894e3a5710998818515104d6e74e5cc331ce31e46e626  eigen-3.4.0.tar.bz2
+sha256  51928dce36213c5333ba3172e847d735d4c6e9b7ff2722a326c49067155b82eb  COPYING.BSD
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  f5b330efdad110cdd84d585ec61220b0650461fa599e36b13e1726c9346dcfb9  COPYING.MINPACK
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 98e6c61e38..9df286e11f 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EIGEN_VERSION = 3.3.7
+EIGEN_VERSION = 3.4.0
 EIGEN_SOURCE = eigen-$(EIGEN_VERSION).tar.bz2
 EIGEN_SITE = $(call gitlab,libeigen,eigen,$(EIGEN_VERSION))
 EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
@@ -15,7 +15,10 @@ EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # Default Eigen CMake installs .pc file in /usr/share/pkgconfig
 # change it to /usr/lib/pkgconfig, to be consistent with other packages.
-EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig \
-	-DCMAKE_Fortran_COMPILER=$(TARGET_FC)
+EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig
+
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+EIGEN_CONF_OPTS += -DCMAKE_Fortran_COMPILER=$(TARGET_FC)
+endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
