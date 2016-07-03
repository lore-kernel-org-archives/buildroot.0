From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jul 2016 11:49:57 +0200
Subject: [Buildroot] [PATCH 09/13] skeleton: remove SOURCE variable
In-Reply-To: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467539401-3411-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the package infrastructure doen't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the skeleton package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skeleton/skeleton.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 4e3cdc6..d8d1e70 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -4,9 +4,6 @@
 #
 ################################################################################
 
-# source included in buildroot
-SKELETON_SOURCE =
-
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
-- 
2.7.4
