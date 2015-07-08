From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jul 2015 23:45:21 +0200
Subject: [Buildroot] [git commit] snmppp: autoreconf is not needed anymore
Message-ID: <20150708214801.6A19D8191B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bb40c7d8608e1e55c19d00ab142c4fce14bd73e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tarballs of recent versions ship a configure script.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snmppp/snmppp.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

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
