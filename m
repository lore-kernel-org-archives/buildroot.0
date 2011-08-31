From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:31:20 +0200
Subject: [Buildroot] [PATCH 12/15] fakeroot: remove target package
In-Reply-To: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0562d18055fece5f8968cf7e4f28040ab387d0ea.1314826232.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As explained in the comment, the fakeroot target package was only here
to workaround deficiencies in the package infrastructure regarding the
patching procedure. Those issues have been fixed in
7a41cbf938d6a189109b8b15dc2cef8638c5a0c2, so clean things up in
fakeroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fakeroot/fakeroot.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 804588d..d24701d 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -16,8 +16,4 @@ endef
 
 FAKEROOT_POST_PATCH_HOOKS += FAKEROOT_PATCH_FAKEROOT_IN
 
-# The package for the target cannot be selected (build problems when
-# largefile is enabled), but is needed for the host package to work
-# due to deficiencies in the package infrastructure.
-$(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.4.1
