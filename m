From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 00:01:14 +0200
Subject: [Buildroot] [git commit] dtc: install libfdt library and headers
	for host variant
Message-ID: <20160725220138.DAB7C81D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ca9b7cf66941a66cff736aadaf8a31afe55f964
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dtc package currently does not install libfdt for the host install.
It can be useful to have libfdt on the host, such as for building QEMU
with the --enable-fdt configure switch.

Signed-off-by: David Raeman <draeman@bbn.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
