From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 24 May 2017 13:30:30 -0700
Subject: [Buildroot] [PATCH 2/2] package: xen: Depend on the host-acpica
	package
In-Reply-To: <20170524203030.8187-1-alistair.francis@xilinx.com>
References: <20170524203030.8187-1-alistair.francis@xilinx.com>
Message-ID: <20170524203030.8187-3-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a dependency on the host ACPICA package as Xen tools require iasl to
build.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 package/xen/xen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 89c09f872..79c511ac5 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -8,7 +8,7 @@ XEN_VERSION = 4.8.1
 XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
-XEN_DEPENDENCIES = host-python
+XEN_DEPENDENCIES = host-python host-acpica
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
-- 
2.11.0
