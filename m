From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  8 Jul 2015 12:36:13 +0200
Subject: [Buildroot] [PATCH] snmppp: autoreconf is not needed anymore
Message-ID: <1436351773-13436-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tarballs of recent versions ship a configure script.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/snmppp/snmppp.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 29b1d99..026fe6e 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -9,8 +9,6 @@ SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
 SNMPPP_INSTALL_STAGING = YES
-# no configure script in tarball
-SNMPPP_AUTORECONF = YES
 SNMPPP_CONF_OPTS = $(if $(BR2_PACKAGE_SNMPPP_LOGGING),--enable-logging,--disable-logging)
 SNMPPP_LICENSE = SNMP++
 SNMPPP_LICENSE_FILES = src/v3.cpp
-- 
1.9.1
