From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 08:33:08 +0200
Subject: [Buildroot] [git commit] dhcpcd: fix legal info
Message-ID: <20180420063321.9ACE58816D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f97bbcd5f6c981cc18a09b72832e973ff43aa33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest version bump to 7.0.3 moved dhcpcd.c to under src/. Since the
tarball now has a LICENSE file, use that instead.

While at it, add a hash for that file.

Fixes:
http://autobuild.buildroot.net/results/f57/f5790e0a82a3b814d828d18eb71a3f6c422bb2b8/
http://autobuild.buildroot.net/results/6b9/6b930827913f9b4d2602d5777f4243ba7b295ca7/
http://autobuild.buildroot.net/results/603/603eda004a502f613e9b92cea4fb8cc9e4068255/

Cc: John Stile <johns@msli.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcpcd/dhcpcd.hash | 2 ++
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 99b7fe786e..605e87609e 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,4 @@
 # sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-7.0.3.tar.xz.distinfo.asc
 sha256	a255d9aecceb1c77a9862f1c0d31a48ba37aab5ef2ca5ad76fc7a907b6ea292e	dhcpcd-7.0.3.tar.xz
+# Locally calculated
+sha256	b120a64b92cfb2453b61df4457a3c0eb163ef9c1c397822826756a31581f3947	LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 1bb0dd8a51..92a78cd7ad 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -9,7 +9,7 @@ DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2-Clause
-DHCPCD_LICENSE_FILES = dhcpcd.c
+DHCPCD_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCPCD_CONFIG_OPTS += --enable-static
