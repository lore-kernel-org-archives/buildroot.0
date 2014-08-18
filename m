From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 19 Aug 2014 02:03:27 +0400
Subject: [Buildroot] [PATCH 2/2] packages: add WCHAR dependency for packages
	that select native binutils
In-Reply-To: <1408399407-23604-1-git-send-email-abrodkin@synopsys.com>
References: <1408399407-23604-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1408399407-23604-3-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Native binutils require uClibc with WCHAR.
Otherwise build stops with error - https://bugs.busybox.net/show_bug.cgi?id=6218

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropwatch/Config.in | 1 +
 package/oprofile/Config.in  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index 0c9aca6..a19b29f 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_DROPWATCH
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_USE_WCHAR # native binutils require WCHAR
 	help
 	  Dropwatch is an interactive utility for monitoring and
 	  recording packets that are dropped by the kernel
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 075e9ea..4dca560 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_OPROFILE
 	depends on !BR2_xtensa
 	# libpfm4 is needed on PowerPC, and requires thread support
 	depends on BR2_TOOLCHAIN_HAS_THREADS || !BR2_powerpc
+	depends on BR2_USE_WCHAR # native binutils require WCHAR
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
-- 
1.9.3
