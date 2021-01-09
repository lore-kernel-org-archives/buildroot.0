From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 17:06:01 +0100
Subject: [Buildroot] [git commit] linux: indicate proper CPE prefix
Message-ID: <20210109154753.14C8182DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f5c3d602281c0de7e7078a46398c0c7e6d9f5db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE type of the Linux kernel is special, it should be "o", unlike
all other packages that use "a". We therefore need to override
<pkg>_CPE_ID_PREFIX, so that the CPE ID of the linux package matches
with the CPE dictionary.

Reported-by: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
