From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Jan 2021 22:13:34 +0100
Subject: [Buildroot] [PATCH] linux: indicate proper CPE prefix
Message-ID: <20210107211336.3030397-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CPE type of the Linux kernel is special, it should be "o", unlike
all other packages that use "a". We therefore need to override
<pkg>_CPE_ID_PREFIX, so that the CPE ID of the linux package matches
with the CPE dictionary.

Reported-by: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 648f6ea2a5..50d2ae3ff8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -14,6 +14,7 @@ LINUX_LICENSE_FILES = \
 endif
 LINUX_CPE_ID_VENDOR = $(LINUX_NAME)
 LINUX_CPE_ID_NAME = $(LINUX_NAME)_kernel
+LINUX_CPE_ID_PREFIX = cpe:2.3:o
 
 define LINUX_HELP_CMDS
 	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
-- 
2.29.2
