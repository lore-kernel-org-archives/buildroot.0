From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:37:48 +0200
Subject: [Buildroot] [git commit] package/dhcp: add missing dependency on
 zlib
Message-ID: <20190422203405.60EF88139F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03785e13e44d2699abd9cdfe175a42d8983b0cad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_ZLIB=y, we enable zlib support in the bind included
in dhcp, but we forget to add zlib to DHCP_DEPENDENCIES, so it doesn't
get built before dhcp, causing build failures.

Fixes:

  http://autobuild.buildroot.net/results/5a33057ceaf3f53e6ba9deab3f214a4c8a644352/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcp/dhcp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 812e4870b9..9e7444eea6 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -45,6 +45,7 @@ DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
+DHCP_DEPENDENCIES += zlib
 DHCP_BIND_CONF_OPTS += --with-zlib
 else
 DHCP_BIND_CONF_OPTS += --without-zlib
