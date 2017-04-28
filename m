From: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
Date: Fri, 28 Apr 2017 11:35:20 +0200
Subject: [Buildroot] [PATCH 1/2] Use HOSTCC_NOCCACHE for both
	core-dependencies and DEPENDENCIES_HOST_PREREQ
Message-ID: <1493372121-32177-1-git-send-email-alfredo.alvarez_fernandez@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This also fixes make clean host-ccache

Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
---
 support/dependencies/dependencies.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index d4b0409..ef2ae9b 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -23,8 +23,8 @@ core-dependencies:
 		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
 		$(TOPDIR)/support/dependencies/dependencies.sh
 
-dependencies: HOSTCC=$(HOSTCC_NOCCACHE)
-dependencies: HOSTCXX=$(HOSTCXX_NOCCACHE)
+core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
+core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
 
 ################################################################################
-- 
2.7.4
