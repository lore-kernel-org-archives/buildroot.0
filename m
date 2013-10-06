From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 16:19:22 +0200
Subject: [Buildroot] [PATCHv2 12/21] dependencies: remove useless targets
In-Reply-To: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381069171-29748-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependencies-source, dependencies-clean and dependencies-dirclean
targets are not needed, as long as 'dependencies' is not used in the
<pkg>_DEPENDENCIES of a package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.mk | 8 --------
 1 file changed, 8 deletions(-)

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
-- 
1.8.1.2
