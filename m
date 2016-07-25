From: David Raeman <draeman@bbn.com>
Date: Mon, 25 Jul 2016 15:52:27 -0400
Subject: [Buildroot] [PATCH 2/2] host-dtc: Install libftd and associated
	header files.
In-Reply-To: <20160725195227.21112-1-draeman@bbn.com>
References: <20160725195227.21112-1-draeman@bbn.com>
Message-ID: <20160725195227.21112-2-draeman@bbn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dtc package currently does not install libfdt for the host install.
It can be useful to have libfdt on the host, such as for building QEMU
with the --enable-fdt configure switch.

Signed-off-by: David Raeman <draeman@bbn.com>
---
 package/dtc/dtc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 8fdcdbe..febd592 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -51,7 +51,9 @@ define HOST_DTC_BUILD_CMDS
 endef
 
 define HOST_DTC_INSTALL_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
+	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin install-lib \
+		install-includes
+
 endef
 
 $(eval $(generic-package))
-- 
2.7.4
