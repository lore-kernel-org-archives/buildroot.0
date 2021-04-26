From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Apr 2021 21:52:52 +0200
Subject: [Buildroot] [git commit] package/kf5-kcoreaddons: disable package
 affected by binutils bug 27597
Message-ID: <20210426192739.7D40184080@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73745ef03bcc729121cc5447d466d04cb948c80a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is affected by binutils bug 27597 and no work around has
been found, so let's disable it if
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y.

Fixes:
http://autobuild.buildroot.net/results/0c1/0c1e7e094b0990970f28cda2be0e3fe7d82ce6a2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
