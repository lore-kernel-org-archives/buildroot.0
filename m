From: Alistair Francis <alistair.francis@wdc.com>
Date: Tue,  4 Feb 2020 13:08:55 -0800
Subject: [Buildroot] [PATCH] package/xen: Use host-python3 to build
Message-ID: <20200204210855.26196-1-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/xen/xen.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 951af963e0..fa49f5996b 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -8,7 +8,7 @@ XEN_VERSION = 4.13.0
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
-XEN_DEPENDENCIES = host-acpica host-python
+XEN_DEPENDENCIES = host-acpica host-python3
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
@@ -21,7 +21,7 @@ XEN_CONF_OPTS = \
 	--disable-ocamltools \
 	--with-initddir=/etc/init.d
 
-XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python2
+XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python3
 XEN_MAKE_ENV = \
 	XEN_TARGET_ARCH=$(XEN_ARCH) \
 	CROSS_COMPILE=$(TARGET_CROSS) \
-- 
2.25.0
