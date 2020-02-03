From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 16:49:45 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: fix separator comment
 location
Message-ID: <20200203154034.A3A0B873EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4293d0ec51a26c0875e66a8c60a2c2779b00ff6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the fis and gadgetfs-test packages were removed, their respective
options in Config.in.legacy were placed before the "Legacy options
removed in 2020.02", while they should have been placed after. Let's
fix that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 955e5f2f7d..0e479a8808 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,8 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2020.02"
+
 config BR2_PACKAGE_GADGETFS_TEST
 	bool "gadgetfs-test was removed"
 	select BR2_LEGACY
@@ -158,8 +160,6 @@ config BR2_PACKAGE_FIS
 	help
 	  The fis package was removed.
 
-comment "Legacy options removed in 2020.02"
-
 config BR2_PACKAGE_REFPOLICY_POLICY_VERSION
 	string "refpolicy policy version"
 	help
