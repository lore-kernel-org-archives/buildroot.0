From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:36 -0600
Subject: [Buildroot] [NEXT 21/26] linux-headers: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-22-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package will report with the same CPE as the
linux package.  As such, depending on the toolchain
approach, there will be a duplicate record with the
same information.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/linux-headers/linux-headers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index f1e3790..2e3e531 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -84,6 +84,7 @@ endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
 
 LINUX_HEADERS_LICENSE = GPL-2.0
 LINUX_HEADERS_LICENSE_FILES = COPYING
+LINUX_HEADERS_CPE_ID = linux:linux_kernel:$(LINUX_HEADERS_VERSION)
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
-- 
1.9.1
