From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Sep 2011 21:57:47 +0200
Subject: [Buildroot] [PATCH 11/15] fakeroot: remove target package
In-Reply-To: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
Message-ID: <581f2ce901c20b5bfb734e8d0bdb64f4fbad34f4.1317325743.git.thomas.petazzoni@free-electrons.com>
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
index c69f31e..e47d8ba 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -15,8 +15,4 @@ endef
 
 FAKEROOT_POST_PATCH_HOOKS += FAKEROOT_PATCH_FAKEROOT_IN
 
-# The package for the target cannot be selected (build problems when
-# largefile is enabled), but is needed for the host package to work
-# due to deficiencies in the package infrastructure.
-$(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.4.1
