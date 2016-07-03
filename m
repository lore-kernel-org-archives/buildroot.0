From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2016 00:24:22 +0200
Subject: [Buildroot] [PATCH 2/4] vde2: enable building host package
In-Reply-To: <1467584664-11640-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467584664-11640-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467584664-11640-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Maes <simonn.maes@gmail.com>

In preparation of enabling vde2 support in host-qemu package.

Signed-off-by: Simon Maes <simonn.maes@gmail.com>
[Thomas:
 - add HOST_VDE2_CONF_OPTS and HOST_VDE2_MAKE, like we have for the
   target variant.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vde2/vde2.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index bad758d..d9b11bb 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -37,4 +37,16 @@ VDE2_CONF_OPTS = \
 #?Package does not build in parallel due to improper make rules
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
-- 
2.7.4
