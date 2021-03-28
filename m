From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:13:51 +0200
Subject: [Buildroot] [PATCH 4/7] package/eigen: use gitlab macro
In-Reply-To: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
References: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210328191355.778786-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/eigen/eigen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 1645489717..c9998da357 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -6,7 +6,7 @@
 
 EIGEN_VERSION = 3.3.7
 EIGEN_SOURCE = eigen-$(EIGEN_VERSION).tar.bz2
-EIGEN_SITE = https://gitlab.com/libeigen/eigen/-/archive/$(EIGEN_VERSION)
+EIGEN_SITE = $(call gitlab,libeigen,eigen,$(EIGEN_VERSION))
 EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
 EIGEN_INSTALL_STAGING = YES
-- 
2.30.2
