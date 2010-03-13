From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 13 Mar 2010 21:54:09 +0100
Subject: [Buildroot] [git commit master] pppd: enable ipv6 support if
	toolchain supports it
Message-ID: <20100313205449.79B99776BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=acac2eceb6f8c22d757de348e45172a7f3d928da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1273

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    4 ++++
 package/pppd/pppd.mk |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index a8f890e..f1edd16 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,6 +8,10 @@
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
 	mtd-utils, squashfs
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#1273 BR2_INET_IPV6 does not enable IPv6 in pppd
+
 2010.02, Release February 26th, 2010:
 
 	Fixes all over the tree.
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 0888aa9..46d5b6f 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -17,6 +17,7 @@ $(DL_DIR)/$(PPPD_SOURCE):
 
 pppd-source: $(DL_DIR)/$(PPPD_SOURCE)
 
+PPPD_OPTIONS_$(BR2_INET_IPV6) += HAVE_INET6=y
 PPPD_OPTIONS_$(BR2_PACKAGE_PPPD_FILTER) += FILTER=y
 
 $(PPPD_DIR)/.unpacked: $(DL_DIR)/$(PPPD_SOURCE)
-- 
1.6.3.3
