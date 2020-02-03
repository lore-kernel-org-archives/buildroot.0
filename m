From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  3 Feb 2020 05:29:50 -0800
Subject: [Buildroot] [PATCH 4/5] package/libsepol: change policy version to
 an int
In-Reply-To: <20200203132951.1331252-1-aduskett@gmail.com>
References: <20200203132951.1331252-1-aduskett@gmail.com>
Message-ID: <20200203132951.1331252-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The policy version has to be a number, as such, set the type to int.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libsepol/Config.in     | 4 ++--
 package/refpolicy/refpolicy.mk | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 4453e298a6..aac31c21b8 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -10,8 +10,8 @@ config BR2_PACKAGE_LIBSEPOL
 if BR2_PACKAGE_LIBSEPOL
 
 config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
-	string "Policy version"
-	default "30"
+	int "Policy version"
+	default 30
 endif
 
 comment "libsepol needs a toolchain w/ threads"
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 001519f8cd..05c1bf270d 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -26,8 +26,7 @@ REFPOLICY_MAKE = \
 	$(TARGET_MAKE_ENV) \
 	$(MAKE1)
 
-REFPOLICY_POLICY_VERSION = \
-	$(call qstrip,$(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION))
+REFPOLICY_POLICY_VERSION = $(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION)
 REFPOLICY_POLICY_STATE = \
 	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
 
-- 
2.24.1
