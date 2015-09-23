From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 24 Sep 2015 11:43:51 +1200
Subject: [Buildroot] [PATCHv3 3/3] micropython: Bump version to v1.4.6
In-Reply-To: <1443051831-8292-1-git-send-email-judge.packham@gmail.com>
References: <1443051831-8292-1-git-send-email-judge.packham@gmail.com>
Message-ID: <1443051831-8292-4-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
This incorporates some build fixes that we were carrying as separate
patches. Build tested for x86 and mips32.

Changes since v1/v2
- New patch

 package/micropython/micropython.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 1358864..f5e0ce7 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = v1.4.5
+MICROPYTHON_VERSION = v1.4.6
 MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
-MICROPYTHON_PATCH = \
-	https://github.com/micropython/micropython/commit/8b4fb4fe140e9cf57fcfa258d0d2d6fe19090fc5.patch \
-	https://github.com/micropython/micropython/commit/587914169cc6ff7f0513bd14c42dcbb275bf77bd.patch
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
-- 
2.5.0
