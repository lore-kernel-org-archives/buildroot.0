From: Mircea Gliga <gliga.mircea@gmail.com>
Date: Wed,  8 Jan 2020 14:08:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/tcpdump: remove unnecessary
 dependency on zlib
In-Reply-To: <20200108120821.22004-1-gliga.mircea@gmail.com>
References: <20200108120821.22004-1-gliga.mircea@gmail.com>
Message-ID: <20200108120821.22004-2-gliga.mircea@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tcpdump package currently depends on zlib, but this is not
needed. The commit removes this non-mandatory dependency.

Signed-off-by: Mircea Gliga <gliga.mircea@gmail.com>
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
-- 
2.24.1
