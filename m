From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jun 2013 00:26:14 +0200
Subject: [Buildroot] [RFCv2 19/19] Remove toolchain/toolchain-buildroot.mk
In-Reply-To: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372285574-29423-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                         | 4 +---
 toolchain/toolchain-buildroot.mk | 2 --
 2 files changed, 1 insertion(+), 5 deletions(-)
 delete mode 100644 toolchain/toolchain-buildroot.mk

diff --git a/Makefile b/Makefile
index 9a97791..181ff38 100644
--- a/Makefile
+++ b/Makefile
@@ -313,9 +313,7 @@ include support/dependencies/dependencies.mk
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-include toolchain/toolchain-buildroot.mk
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 include toolchain/toolchain-external.mk
 else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
 include toolchain/toolchain-crosstool-ng.mk
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
deleted file mode 100644
index 38dcb1f..0000000
--- a/toolchain/toolchain-buildroot.mk
+++ /dev/null
@@ -1,2 +0,0 @@
-# Include files required for the internal toolchain backend
-
-- 
1.8.1.2
