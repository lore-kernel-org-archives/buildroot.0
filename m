From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 23:05:26 +0200
Subject: [Buildroot] [git commit] iproute2: use @D instead of IPROUTE2_DIR
Message-ID: <20160807210547.4C83E80338@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40c69fc5b5948f3573a6ab84bed53de6a62768ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We more generally use $(@D) instead of $(pkg_DIR) to refer to the
package source directory, so this commit updates iproute2 to also use
$(@D) everywhere.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iproute2/iproute2.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index edc17ad..09e68c5 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -27,13 +27,13 @@ ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
 define IPROUTE2_WITH_IPTABLES
 	# Makefile is busted so it never passes IPT_LIB_DIR properly
-	$(SED) "s/-DIPT/-DXT/" $(IPROUTE2_DIR)/tc/Makefile
+	$(SED) "s/-DIPT/-DXT/" $(@D)/tc/Makefile
 endef
 else
 define IPROUTE2_WITH_IPTABLES
 	# em_ipset needs xtables, but configure misdetects it
-	echo "TC_CONFIG_IPSET:=n" >>$(IPROUTE2_DIR)/Config
-	echo "TC_CONFIG_XT:=n" >>$(IPROUTE2_DIR)/Config
+	echo "TC_CONFIG_IPSET:=n" >>$(@D)/Config
+	echo "TC_CONFIG_XT:=n" >>$(@D)/Config
 endef
 endif
 
@@ -42,7 +42,7 @@ ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 IPROUTE2_DEPENDENCIES += berkeleydb
 else
 define IPROUTE2_DISABLE_ARPD
-	echo "HAVE_BERKELEY_DB:=n" >> $(IPROUTE2_DIR)/Config
+	echo "HAVE_BERKELEY_DB:=n" >> $(@D)/Config
 endef
 endif
 
