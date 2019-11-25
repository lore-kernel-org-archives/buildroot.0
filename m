From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 18:13:39 +0100
Subject: [Buildroot] [git commit] package/stunnel: bump to version 5.56
Message-ID: <20191202083935.2E0528152E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02dda8f29b2bfee23af9a80a5fd429d76690f338
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes of the bugfix release:
 - https://www.stunnel.org/NEWS.html

Also:
 - rename COPYRIGHT.GPL to COPYRIGHT.md
 - rename COPYING to COPYING.md

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stunnel/stunnel.hash | 8 ++++----
 package/stunnel/stunnel.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 7dde175563..b741b0e816 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.55.tar.gz.sha256
-sha256	90de69f41c58342549e74c82503555a6426961b29af3ed92f878192727074c62	stunnel-5.55.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.56.tar.gz.sha256
+sha256	7384bfb356b9a89ddfee70b5ca494d187605bb516b4fff597e167f97e2236b22	stunnel-5.56.tar.gz
 # Locally calculated
-sha256	81d0b7244f44ef81dd0b299cf681037c5a42d468b8533e53aff6d1ac84c97dc8	COPYING
-sha256	1ee2b290e92c211b08df10e9fcaf32596cdb22b8eae731b18c2c074a4a83eebe	COPYRIGHT.GPL
+sha256	f46e2613769e23e23348b6eb667dc85309da2252c8cc2016db92ad93d743aea4	COPYING.md
+sha256	62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d	COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 261e331cfa..f8265c4cf4 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).55
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).56
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
@@ -14,7 +14,7 @@ STUNNEL_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 STUNNEL_LICENSE = GPL-2.0+
-STUNNEL_LICENSE_FILES = COPYING COPYRIGHT.GPL
+STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 STUNNEL_DEPENDENCIES += systemd
