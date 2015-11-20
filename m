From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Fri, 20 Nov 2015 16:29:28 +0100
Subject: [Buildroot] [PATCH 2/2] libnet: PF_PACKET is always available on
	Linux
In-Reply-To: <1448033368-8081-1-git-send-email-joris.lijssens@gmail.com>
References: <1448033368-8081-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <1448033368-8081-2-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/libnet/libnet.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index 3b62a79..1a5e610 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -7,7 +7,10 @@
 LIBNET_VERSION = 1.1.6
 LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
 LIBNET_INSTALL_STAGING = YES
+# PF_PACKET is always available on Linux
+LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
 LIBNET_LICENSE = BSD-2c, BSD-3c
 LIBNET_LICENSE_FILES = doc/COPYING
 
+
 $(eval $(autotools-package))
-- 
1.8.3.1
