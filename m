From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 10 Mar 2021 10:14:53 +0100
Subject: [Buildroot] [PATCH v2 6/6] package/kf5-kcoreaddons: disable package
 while building for Nios II
In-Reply-To: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210310091453.23611-7-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package fails to build with Nios II up to gcc version 10.x and no
work around has been found. So let's disable it whil building for Nios
II.

Fixes:
http://autobuild.buildroot.net/results/0c1/0c1e7e094b0990970f28cda2be0e3fe7d82ce6a2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/kf5/kf5-kcoreaddons/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kf5/kf5-kcoreaddons/Config.in b/package/kf5/kf5-kcoreaddons/Config.in
index 88fda03ee0..0acb68297b 100644
--- a/package/kf5/kf5-kcoreaddons/Config.in
+++ b/package/kf5/kf5-kcoreaddons/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KF5_KCOREADDONS
 	bool "kf5-kcoreaddons"
+	depends on !BR2_nios
 	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
 	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
-- 
2.25.1
