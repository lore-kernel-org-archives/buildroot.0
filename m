From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:16 +0200
Subject: [Buildroot] [PATCH 07/16] icu: add quotes around TARGET_CXX
In-Reply-To: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
Message-ID: <883882caedbf89af8de4a37d93bd566ebb952f57.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that TARGET_CXX contains a --sysroot= option and therefore spaces,
it needs to be used with quotes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/icu/icu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 17f153e..7961b07 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -33,7 +33,7 @@ $(ICU_DIR)/.configured: $(ICU_HOST_DIR)/.configured
 	(cd $(ICU_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		CXX=$(TARGET_CXX) \
+		CXX="$(TARGET_CXX)" \
 		./configure $(QUIET) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
-- 
1.7.0.4
