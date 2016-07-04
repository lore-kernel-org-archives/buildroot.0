From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 11:29:31 +0200
Subject: [Buildroot] [git commit] vde2: enable building host package
Message-ID: <20160704092942.799D8816A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=692e392448255fe5dab824072a0a6e01977f7087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation of enabling vde2 support in host-qemu package.

Signed-off-by: Simon Maes <simonn.maes@gmail.com>
[Thomas:
 - add HOST_VDE2_CONF_OPTS and HOST_VDE2_MAKE, like we have for the
   target variant.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vde2/vde2.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index bad758d..d9b11bb 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -37,4 +37,16 @@ VDE2_CONF_OPTS = \
 #??Package does not build in parallel due to improper make rules
 VDE2_MAKE = $(MAKE1)
 
+HOST_VDE2_CONF_OPTS = \
+	--disable-experimental  \
+	--disable-cryptcab      \
+	--disable-pcap          \
+	--disable-python        \
+	--disable-profile       \
+	--disable-kernel-switch \
+	--enable-tuntap         \
+
+HOST_VDE2_MAKE = $(MAKE1)
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
