From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:52:45 +0200
Subject: [Buildroot] [git commit] pkg-virtual: remove VERSION/SOURCE
Message-ID: <20160703111558.0518B8179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d29fd96a437a540a3aa996194712f8decf4c0f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package infrastructure doesn't attempt to download a package
that has an empty version string, there's no need to define the VERSION and
SOURCE variables in the virtual package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-virtual.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 3fbe0a3..bcb2cad 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -43,12 +43,6 @@ endif
 
 $(2)_IS_VIRTUAL = YES
 
-# A virtual package does not have any source associated
-$(2)_SOURCE =
-
-# Fake a version string, so it looks nicer in the build log
-$(2)_VERSION = virtual
-
 # Add dependency against the provider
 $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
 
