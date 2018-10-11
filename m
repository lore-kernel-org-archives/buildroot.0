From: Lionel Orry <lionel.orry@gmail.com>
Date: Thu, 11 Oct 2018 11:57:55 +0200
Subject: [Buildroot] [PATCH v2 4/4] pkg-cmake: <pkg>_SUBDIR cleanup
In-Reply-To: <20181011095755.9188-1-lionel.orry@gmail.com>
References: <20181011095755.9188-1-lionel.orry@gmail.com>
Message-ID: <20181011095755.9188-4-lionel.orry@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No functional change is brought by this modification.

This patch removes redundant <pkg>_SRCDIR declaration
  (already defined in pkg-generic.mk)

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
---
 package/pkg-cmake.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 51a1929ebb..b9ce8ff622 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -60,8 +60,6 @@ $(2)_INSTALL_OPTS		?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install/fast
 
-$(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
-
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
 
-- 
2.19.1
