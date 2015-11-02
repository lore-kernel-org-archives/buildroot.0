From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 2 Nov 2015 15:56:52 +0100
Subject: [Buildroot] [PATCH 2/3] linux-headers: add 4.3.x series
In-Reply-To: <1446476213-28962-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1446476213-28962-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1446476213-28962-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1a8ec69..913cc2a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_4_2
+	default BR2_KERNEL_HEADERS_4_3
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -71,6 +71,10 @@ choice
 		bool "Linux 4.2.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 
+	config BR2_KERNEL_HEADERS_4_3
+		bool "Linux 4.3.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -92,6 +96,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3
+	bool "4.3.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2
 	bool "4.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
@@ -203,4 +211,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.12"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.5"		if BR2_KERNEL_HEADERS_4_2
+	default "4.3"		if BR2_KERNEL_HEADERS_4_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.4.10
