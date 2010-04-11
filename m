From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Use BR2_HAVE_DOCUMENTATION instead
	of BR2_HAVE_{MANPAGES, INFOPAGES}
Message-ID: <20100411195034.3E13020B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0e56099e70fe491bfe37d6935769b60891e1f395
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk           |    2 +-
 package/axel/axel.mk             |    2 +-
 package/hdparm/hdparm.mk         |    2 +-
 package/ltrace/ltrace.mk         |    2 +-
 package/netsnmp/netsnmp.mk       |    2 +-
 package/pppd/pppd.mk             |    2 +-
 package/pptp-linux/pptp-linux.mk |    2 +-
 package/rp-pppoe/rp-pppoe.mk     |    2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index b3e1d9b..9940d28 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -75,7 +75,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--disable-monodoc \
 		--disable-stack-protector \
 		--with-distro=none \
-		$(if $(BR2_HAVE_MANPAGES),--enable,--disable)-manpages \
+		$(if $(BR2_HAVE_DOCUMENTATION),--enable,--disable)-manpages \
 		$(if $(BR2_PACKAGE_AVAHI_AUTOIPD),--enable,--disable)-autoipd \
 		--with-avahi-user=default \
 		--with-avahi-group=default \
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 2e42a18..8891795 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -32,7 +32,7 @@ $(AXEL_DIR)/$(AXEL_BINARY): $(AXEL_DIR)/Makefile.settings
 
 $(TARGET_DIR)/$(AXEL_TARGET_BINARY): $(AXEL_DIR)/$(AXEL_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) install-bin
-ifeq ($(BR2_HAVE_MANPAGES),y)
+ifeq ($(BR2_HAVE_DOCUMENTATION),y)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) install-man
 endif
 
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index c1b83c0..cc747eb 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -29,7 +29,7 @@ $(HDPARM_DIR)/$(HDPARM_BINARY): $(HDPARM_DIR)/.unpacked
 $(TARGET_DIR)/$(HDPARM_TARGET_BINARY): $(HDPARM_DIR)/$(HDPARM_BINARY)
 	rm -f $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
 	$(INSTALL) -D -m 0755 $(HDPARM_DIR)/$(HDPARM_BINARY) $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
-ifeq ($(BR2_HAVE_MANPAGES),y)
+ifeq ($(BR2_HAVE_DOCUMENTATION),y)
 	$(INSTALL) -D $(HDPARM_DIR)/hdparm.8 $(TARGET_DIR)/usr/share/man/man8/hdparm.8
 endif
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 424c39d..c99f223 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -60,7 +60,7 @@ $(LTRACE_DIR)/$(LTRACE_BINARY): $(LTRACE_DIR)/.configured
 $(TARGET_DIR)/$(LTRACE_TARGET_BINARY): $(LTRACE_DIR)/$(LTRACE_BINARY)
 	#$(MAKE) DESTDIR=$(TARGET_DIR) ARCH=$(LTRACE_ARCH)  -C $(LTRACE_DIR) install
 	$(INSTALL) -D $(LTRACE_DIR)/$(LTRACE_BINARY) $@
-ifeq ($(BR2_HAVE_MANPAGES),y)
+ifeq ($(BR2_HAVE_DOCUMENTATION),y)
 	$(INSTALL) -D $(LTRACE_DIR)/ltrace.1 \
 		$(TARGET_DIR)/usr/share/man/man1/ltrace.1
 endif
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index fb0151c..86f7a94 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -52,7 +52,7 @@ else
 NETSNMP_CONFIGURE_OPENSSL:=--without-openssl
 endif
 
-ifneq ($(findstring y,$(BR2_HAVE_MANPAGES)$(BR2_HAVE_INFOPAGES)),y)
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 NETSNMP_DOCS:=--disable-manuals
 endif
 
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 32be428..31ddbb6 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -8,7 +8,7 @@ PPPD_VERSION = 2.4.5
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
-PPPD_MANPAGES = $(if $(BR2_HAVE_MANPAGES),chat pppd pppdump pppstats)
+PPPD_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),chat pppd pppdump pppstats)
 PPPD_MAKE = $(MAKE) CC=$(TARGET_CC) COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR) $(PPPD_MAKE_OPT)
 
 ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index db187d9..8de0832 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -51,7 +51,7 @@ $(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY): $(PPTP_LINUX_DIR)/.unpacked
 
 $(TARGET_DIR)/$(PPTP_LINUX_TARGET_BINARY): $(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY)
 	cp -dpf $(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY) $@
-ifeq ($(BR2_HAVE_MANPAGES),y)
+ifeq ($(BR2_HAVE_DOCUMENTATION),y)
 	mkdir -p $(TARGET_DIR)/usr/share/man/man8
 	$(INSTALL) -m 644 $(PPTP_LINUX_DIR)/pptp.8 $(TARGET_DIR)/usr/share/man/man8/pptp.8
 endif
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 1aa5467..bb17750 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -53,7 +53,7 @@ $(RP_PPPOE_DIR)/$(RP_PPPOE_BINARY): $(RP_PPPOE_TOPDIR)/.configured
 
 $(TARGET_DIR)/$(RP_PPPOE_TARGET_BINARY): $(RP_PPPOE_DIR)/$(RP_PPPOE_BINARY)
 	cp -dpf $(RP_PPPOE_DIR)/$(RP_PPPOE_BINARY) $@
-ifeq ($(BR2_HAVE_MANPAGES),y)
+ifeq ($(BR2_HAVE_DOCUMENTATION),y)
 	mkdir -p $(TARGET_DIR)/usr/share/man/man8
 	$(INSTALL) -m 644 $(RP_PPPOE_TOPDIR)/man/pppoe.8 $(TARGET_DIR)/usr/share/man/man8/pppoe.8
 endif
-- 
1.6.3.3
