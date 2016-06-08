From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  8 Jun 2016 23:21:58 +0200
Subject: [Buildroot] [PATCH 2/3] package/openpowerlink: link demos
	applications with PCIe library interface
In-Reply-To: <1465420919-3920-1-git-send-email-romain.naour@gmail.com>
References: <1465420919-3920-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1465420919-3920-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit f1bc98f396778c9fd8c884527787eb538212f398 the CFG_BUILD_KERNEL_STACK
option wasn't set when the PCIe library interface is selected.

The build fail since the default choice "Link to Application" (which require
libpcap) is used.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/openpowerlink/openpowerlink.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 53c636c..4d27d5a 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -131,6 +131,9 @@ OPENPOWERLINK_CONF_OPTS += \
 else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
 OPENPOWERLINK_CONF_OPTS += \
 	-DCFG_BUILD_KERNEL_STACK="Linux Kernel Module"
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB),y)
+OPENPOWERLINK_CONF_OPTS += \
+	-DCFG_BUILD_KERNEL_STACK="Kernel stack on PCIe card"
 endif
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE),y)
-- 
2.5.5
