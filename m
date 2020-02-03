From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 15:28:19 +0100
Subject: [Buildroot] [git commit] package/refpolicy: remove dependency on
 policycoreutils
Message-ID: <20200203141720.7E3A6888C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dcb5513ef0db8266b107a7f9fbc5fc1fedc888d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only host-policycoreutils is needed to build refpolicy. Remove the uneeded
target package.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/Config.in    | 8 --------
 package/refpolicy/refpolicy.mk | 3 +--
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index e775865317..d9cf6e6531 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
-	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # policycoreutils
-	depends on !BR2_STATIC_LIBS # policycoreutils
-	select BR2_PACKAGE_POLICYCOREUTILS
 	select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
 	help
 	  The SELinux Reference Policy project (refpolicy) is a
@@ -26,10 +22,6 @@ config BR2_PACKAGE_REFPOLICY
 
 	  https://github.com/TresysTechnology/refpolicy
 
-comment "refpolicy needs a toolchain w/ threads, dynamic library"
-	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-
 if BR2_PACKAGE_REFPOLICY
 
 config BR2_PACKAGE_REFPOLICY_POLICY_VERSION
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 1c3b1bc541..66bddd1aee 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -15,8 +15,7 @@ REFPOLICY_DEPENDENCIES = \
 	host-checkpolicy \
 	host-policycoreutils \
 	host-setools \
-	host-gawk \
-	policycoreutils
+	host-gawk
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 REFPOLICY_DEPENDENCIES += host-python3
