From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Jan 2020 17:01:34 +0100
Subject: [Buildroot] [git commit] package/tcpdump: remove unnecessary
 dependency on zlib
Message-ID: <20200109155146.93AB5870B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a103aeb43696a8ff886e62e3a8cc30c9ef7c4c8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tcpdump package currently depends on zlib, but this is not
needed. The commit removes this non-mandatory dependency.

Signed-off-by: Mircea Gliga <gliga.mircea@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tcpdump/tcpdump.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 72bf6f8704..01a46b9b5f 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -16,7 +16,7 @@ TCPDUMP_CONF_OPTS = \
 	--without-crypto \
 	--with-system-libpcap \
 	$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
-TCPDUMP_DEPENDENCIES = zlib libpcap
+TCPDUMP_DEPENDENCIES = libpcap
 
 ifeq ($(BR2_STATIC_LIBS),y)
 TCPDUMP_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
