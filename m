From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:54:59 +0200
Subject: [Buildroot] [git commit] getent: remove VERSION/SOURCE
Message-ID: <20160703111558.87D23820F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c772a3942f14d4b3e58d4f36bed0139b70804be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package infrastructure doesn't attempt to download a package
that has an empty version string, there's no need to define the VERSION and
SOURCE variables in the getent package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/getent/getent.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/getent/getent.mk b/package/getent/getent.mk
index 18f0991..ed249e8 100644
--- a/package/getent/getent.mk
+++ b/package/getent/getent.mk
@@ -4,10 +4,6 @@
 #
 ################################################################################
 
-# source included in Buildroot
-GETENT_SOURCE =
-
-GETENT_VERSION = buildroot-$(BR2_VERSION)
 GETENT_LICENSE = LGPLv2.1+
 
 # For glibc toolchains, we use the getent program built/installed by
