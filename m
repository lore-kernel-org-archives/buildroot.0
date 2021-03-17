From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 17 Mar 2021 17:43:46 +0100
Subject: [Buildroot] [PATCH 2/2] package/kf5-kcoreaddons: disable package
 affected by binutils bug 27597
In-Reply-To: <20210317164346.1917962-1-giulio.benetti@benettiengineering.com>
References: <20210314230738.1c19d335@windsurf.home>
 <20210317164346.1917962-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210317164346.1917962-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is affected by binutils bug 27597 and no work around has
been found, so let's disable it if
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y.

Fixes:
http://autobuild.buildroot.net/results/0c1/0c1e7e094b0990970f28cda2be0e3fe7d82ce6a2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/kf5/kf5-kcoreaddons/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kf5/kf5-kcoreaddons/Config.in b/package/kf5/kf5-kcoreaddons/Config.in
index 88fda03ee0..02bd38e395 100644
--- a/package/kf5/kf5-kcoreaddons/Config.in
+++ b/package/kf5/kf5-kcoreaddons/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KF5_KCOREADDONS
 	bool "kf5-kcoreaddons"
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
 	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
-- 
2.25.1
