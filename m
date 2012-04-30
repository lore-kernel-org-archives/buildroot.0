From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Apr 2012 22:59:22 +0200
Subject: [Buildroot] [git commit] iproute2: bump to version 3.3.0
Message-ID: <20120430210141.CA06896C2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29f656e081e4848835ee913f49aece959551c188
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 3.3.0
We now need to keep builtin headers since it's using very modern defines
which aren't yet mainstream in glibc or uClibc.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/iproute2.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 100f20a..ee5c04a 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 3.1.0
+IPROUTE2_VERSION = 3.3.0
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 
@@ -25,8 +25,6 @@ endef
 endif
 
 define IPROUTE2_CONFIGURE_CMDS
-	# Use kernel headers
-	rm -r $(IPROUTE2_DIR)/include/netinet
 	# arpd needs berkeleydb
 	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
 	echo "IPT_LIB_DIR:=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
