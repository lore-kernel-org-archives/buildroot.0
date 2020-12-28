From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Mon, 28 Dec 2020 17:11:31 +0100
Subject: [Buildroot] [PATCH v2 11/14] package/nmap: add SELinux module
In-Reply-To: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
References: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
Message-ID: <20201228161134.303992-12-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for nmap is added by the admin/netutils module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/nmap/nmap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 46ffd5aef4..aed278ccba 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -12,6 +12,7 @@ NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included
 NMAP_LICENSE = nmap license
 NMAP_LICENSE_FILES = LICENSE
+NMAP_SELINUX_MODULES = netutils
 
 # needed by libpcap
 NMAP_LIBS_FOR_STATIC_LINK += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
-- 
2.25.4
