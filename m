From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Sep 2013 23:27:49 +0200
Subject: [Buildroot] [RFCv1 11/11] dependencies: remove useless targets
In-Reply-To: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378416469-17708-12-git-send-email-thomas.petazzoni@free-electrons.com>
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
index 4a220e0..cf0c189 100644
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
