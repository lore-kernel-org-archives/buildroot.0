From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  2 Nov 2017 11:45:18 +0100
Subject: [Buildroot] [PATCH 2/4] ti-gfx: only available on x86(-64) hosts
In-Reply-To: <20171102104520.29257-1-peter@korsgaard.com>
References: <20171102104520.29257-1-peter@korsgaard.com>
Message-ID: <20171102104520.29257-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ti-gfx is provided as a x86 self extracting executable, so it is only
available on x86(-64) hosts.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-gfx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 6ec2f23117..dc49d822a2 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
-- 
2.11.0
