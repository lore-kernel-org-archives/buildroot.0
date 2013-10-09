From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 15:10:42 +0200
Subject: [Buildroot] [git commit] dependencies: remove useless targets
Message-ID: <20131009143429.5EDF09B99F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c5efee81d2d1f6ba2939030c9674ab375c0187d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependencies-source, dependencies-clean and dependencies-dirclean
targets are not needed, as long as 'dependencies' is not used in the
<pkg>_DEPENDENCIES of a package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 97f85e6..155a909 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -33,14 +33,6 @@ dependencies: HOSTCC=$(HOSTCC_NOCCACHE)
 dependencies: HOSTCXX=$(HOSTCXX_NOCCACHE)
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
 
-dependencies-source:
-
-dependencies-clean:
-	rm -f $(SSTRIP_TARGET)
-
-dependencies-dirclean:
-	true
-
 ################################################################################
 #
 # Toplevel Makefile options
