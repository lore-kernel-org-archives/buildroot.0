From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:37:20 +0100
Subject: [Buildroot] [git commit] libnet: PF_PACKET is always available on
	Linux
Message-ID: <20151201232124.6E89F821F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=546a661ecc64d4c93bffe47ea93d9ca1c4422fdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: remove mistakenly added empty line.]

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnet/libnet.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index 3b62a79..d13c453 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -7,6 +7,8 @@
 LIBNET_VERSION = 1.1.6
 LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
 LIBNET_INSTALL_STAGING = YES
+# PF_PACKET is always available on Linux
+LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
 LIBNET_LICENSE = BSD-2c, BSD-3c
 LIBNET_LICENSE_FILES = doc/COPYING
 
