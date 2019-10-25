From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 25 Oct 2019 21:54:56 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: enable PIC/PIE,
 RELRO and SSP by default
Message-ID: <20191025195456.8583-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enhance security by enabling PIC/PIE, RELRO and SSP by default.

This could help making IoT more secure and fight againt the assumption
that buildroot does not support binary hardening (see
https://cyber-itl.org/2019/08/26/iot-data-writeup.html)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index a6e280b885..0a74079ef6 100644
--- a/Config.in
+++ b/Config.in
@@ -717,6 +717,7 @@ comment "Security Hardening Options"
 
 config BR2_PIC_PIE
 	bool "Build code with PIC/PIE"
+	default y
 	depends on BR2_SHARED_LIBS
 	help
 	  Generate Position-Independent Code (PIC) and link
@@ -724,7 +725,7 @@ config BR2_PIC_PIE
 
 choice
 	bool "Stack Smashing Protection"
-	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
+	default BR2_SSP_ALL
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	help
 	  Enable stack smashing protection support using GCC's
@@ -785,6 +786,7 @@ comment "Stack Smashing Protection needs a toolchain w/ SSP"
 
 choice
 	bool "RELRO Protection"
+	default BR2_RELRO_FULL
 	depends on BR2_SHARED_LIBS
 	help
 	  Enable a link-time protection know as RELRO (RELocation Read
-- 
2.23.0
