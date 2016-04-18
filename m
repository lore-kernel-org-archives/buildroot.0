From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:21:58 +0200
Subject: [Buildroot] [git commit] rp-pppoe: select pppd
Message-ID: <20160418192251.DDA8A8082A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1dfd80e467d06b338738d35acbdf23d705a1a68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's no benefit on it being an autodep since it makes it harder to
find, and pppd can be selected directly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rp-pppoe/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index d37203c..7f6afe2 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -1,6 +1,12 @@
+comment "rp-pppoe needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_RP_PPPOE
 	bool "rp-pppoe"
-	depends on BR2_PACKAGE_PPPD
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_PPPD
 	help
 	  An implementation of the Point-to-point protocol over Ethernet.
 	  Has userspace client and server deamons. You likely only need
