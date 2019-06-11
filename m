From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 11 Jun 2019 12:29:48 +0200
Subject: [Buildroot] [PATCH v3 06/15] arch: add BR2_ARCH_NEEDS_GCC_AT_LEAST_9
In-Reply-To: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
References: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190611102957.7145-7-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

This new symbol will be used by architectures introduced with gcc 9 and
by external toolchains based on gcc 9.

[1] https://gcc.gnu.org/gcc-9/changes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
v3: rebase patch on top of master branch sha1:
    04efb17c863606cdbc2405d01c3d48d6868c5245
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index db1199c6a2..d8d841b1a2 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -301,6 +301,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2d7db3e3ac..80eb68be62 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -75,6 +75,7 @@ config BR2_GCC_VERSION_7_X
 
 config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	# Broken or unsupported architectures
 	depends on !BR2_csky
 	depends on !BR2_or1k
-- 
2.17.1
