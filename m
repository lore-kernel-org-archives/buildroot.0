From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:09:17 +0100
Subject: [Buildroot] [git commit] package/nmap: add SELinux module
Message-ID: <20201229134644.1918182830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be41ce5c53355200e6f55beaea56a8eb671e23e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for nmap is added by the admin/netutils module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
