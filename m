From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 16:19:14 +0200
Subject: [Buildroot] [PATCHv2 04/21] toolchain: move helpers.mk into
	toolchain-external/
In-Reply-To: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381069171-29748-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The helpers.mk file is no longer used by the Crosstool-NG backend, so
it is moved into the toolchain/toolchain-external/ directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot.mk              | 2 --
 toolchain/toolchain-external.mk               | 2 +-
 toolchain/{ => toolchain-external}/helpers.mk | 0
 3 files changed, 1 insertion(+), 3 deletions(-)
 rename toolchain/{ => toolchain-external}/helpers.mk (100%)

diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index 3a05800..ff89125 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -2,8 +2,6 @@
 # build of binutils, uClibc, kernel headers and all the intermediate
 # gcc steps.
 
-include toolchain/helpers.mk
-
 BUILDROOT_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
 toolchain-buildroot: host-gcc-final
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index 2f43db7..2644689 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -1,4 +1,4 @@
 # Required includes for the external toolchain backend
 
-include toolchain/helpers.mk
+include toolchain/toolchain-external/helpers.mk
 include toolchain/toolchain-external/ext-tool.mk
diff --git a/toolchain/helpers.mk b/toolchain/toolchain-external/helpers.mk
similarity index 100%
rename from toolchain/helpers.mk
rename to toolchain/toolchain-external/helpers.mk
-- 
1.8.1.2
