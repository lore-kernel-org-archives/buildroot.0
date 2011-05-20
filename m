From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 21 May 2011 01:39:21 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain/crosstool-NG: update to 1.11.3
In-Reply-To: <1305934762-10058-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1305934762-10058-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1305934762-10058-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1.11.3 is the latest stable version, and it has a few improvements
we'll find usefull. For example, it hasa a boolean option for
disabling the {,e}glibc fortified build (instead of requiring us
to shoehorn it in extra cflags.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 .../002-no-sysroot-prompt-in-backend.patch         |   12 ------------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    2 +-
 2 files changed, 1 insertions(+), 13 deletions(-)
 delete mode 100644 toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch

diff --git a/toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch b/toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch
deleted file mode 100644
index 4c3426a..0000000
--- a/toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff --git a/config/toolchain.in b/config/toolchain.in
---- a/config/toolchain.in
-+++ b/config/toolchain.in
-@@ -20,7 +20,7 @@
- 
- config SYSROOT_NAME
-     string
--    prompt "sysroot directory name"
-+    prompt "sysroot directory name" if ! BACKEND
-     depends on USE_SYSROOT
-     default "sysroot"
-     help
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index b9888bf..1fe4501 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -14,7 +14,7 @@ uclibc: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
 # Internal variables
 
 # Crostool-NG hard-coded configuration options
-CTNG_VERSION:=1.10.1
+CTNG_VERSION:=1.11.3
 CTNG_SITE:=http://crosstool-ng.org/download/crosstool-ng/
 CTNG_SOURCE:=crosstool-ng-$(CTNG_VERSION).tar.bz2
 CTNG_DIR:=$(BUILD_DIR)/crosstool-ng-$(CTNG_VERSION)
-- 
1.7.2.3
