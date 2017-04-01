From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:27:47 +0200
Subject: [Buildroot] [git commit] package: use SPDX short identifier for MPL
	family licenses
Message-ID: <20170401134425.A393980119@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f33fd75afc1701ee1ded34454db7ce170adc4c9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for MPLv1.0/MPLv1.1/MPLv2.0 is MPL-1.0/MPL-1.1/
MPL-2.0.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/MPLv([1-2]\.[0-1])/MPL-\1/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/armadillo/armadillo.mk             | 2 +-
 package/bind/bind.mk                       | 2 +-
 package/ca-certificates/ca-certificates.mk | 2 +-
 package/cairo/cairo.mk                     | 2 +-
 package/czmq/czmq.mk                       | 2 +-
 package/filemq/filemq.mk                   | 2 +-
 package/freeswitch/freeswitch.mk           | 2 +-
 package/heirloom-mailx/heirloom-mailx.mk   | 2 +-
 package/kmsxx/kmsxx.mk                     | 2 +-
 package/libical/libical.mk                 | 2 +-
 package/libnice/libnice.mk                 | 2 +-
 package/libnspr/libnspr.mk                 | 2 +-
 package/libnss/libnss.mk                   | 2 +-
 package/mp4v2/mp4v2.mk                     | 2 +-
 package/rabbitmq-server/rabbitmq-server.mk | 2 +-
 package/tstools/tstools.mk                 | 2 +-
 package/zmqpp/zmqpp.mk                     | 2 +-
 package/zyre/zyre.mk                       | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 813a41b..714c1b2 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -8,7 +8,7 @@ ARMADILLO_VERSION = 6.500.4
 ARMADILLO_SITE = http://downloads.sourceforge.net/project/arma
 ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
-ARMADILLO_LICENSE = MPLv2.0
+ARMADILLO_LICENSE = MPL-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
 
 $(eval $(cmake-package))
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 860ee9d..37ba17c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -10,7 +10,7 @@ BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
-BIND_LICENSE = MPLv2.0
+BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_TARGET_SERVER_SBIN = arpaname ddns-confgen dnssec-checkds dnssec-coverage
 BIND_TARGET_SERVER_SBIN += dnssec-importkey dnssec-keygen dnssec-revoke
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index fafc434..199c6b6 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -12,7 +12,7 @@ CA_CERTIFICATES_DEPENDENCIES = host-openssl
 # but it must be at least python 2.7
 CA_CERTIFICATES_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
-CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPLv2.0 (data)
+CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
 define CA_CERTIFICATES_BUILD_CMDS
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 8660b5a..0d62dc3 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -6,7 +6,7 @@
 
 CAIRO_VERSION = 1.14.8
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
-CAIRO_LICENSE = LGPL-2.1 or MPLv1.1 (library)
+CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 8c4de71..5305789 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -11,7 +11,7 @@ CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
 CZMQ_AUTORECONF = YES
 CZMQ_INSTALL_STAGING = YES
 CZMQ_DEPENDENCIES = zeromq host-pkgconf
-CZMQ_LICENSE = MPLv2.0
+CZMQ_LICENSE = MPL-2.0
 CZMQ_LICENSE_FILES = LICENSE
 
 # asciidoc is a python script that imports unicodedata, which is not in
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 2eadc5d..581e8a8 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -11,7 +11,7 @@ FILEMQ_AUTORECONF = YES
 FILEMQ_CONF_ENV = filemq_have_asciidoc=no
 FILEMQ_INSTALL_STAGING = YES
 FILEMQ_DEPENDENCIES = czmq openssl zeromq
-FILEMQ_LICENSE = MPLv2.0
+FILEMQ_LICENSE = MPL-2.0
 FILEMQ_LICENSE_FILES = LICENSE
 
 define FILEMQ_CREATE_CONFIG_DIR
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 4e81854..32439b8 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -7,7 +7,7 @@
 FREESWITCH_VERSION = 1.6.15
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
-FREESWITCH_LICENSE = MPLv1.1, \
+FREESWITCH_LICENSE = MPL-1.1, \
 	GPLv3+ with font exception (fonts), \
 	Apache-2.0 (apr, apr-util), \
 	LGPLv2+ (sofia-sip), \
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index f92203e..2f7e635 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -7,7 +7,7 @@
 HEIRLOOM_MAILX_VERSION = 12.5
 HEIRLOOM_MAILX_SOURCE = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
 HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/heirloom-mailx
-HEIRLOOM_MAILX_LICENSE = BSD-4-Clause, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)
+HEIRLOOM_MAILX_LICENSE = BSD-4-Clause, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPL-1.1 (nss)
 HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index c06d20b..fd7b1a0 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -6,7 +6,7 @@
 
 KMSXX_VERSION = bd5f6471e619a6ba2987bc7f66ef78a531f94d6c
 KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
-KMSXX_LICENSE = MPLv2.0
+KMSXX_LICENSE = MPL-2.0
 KMSXX_LICENSE_FILES = LICENSE
 KMSXX_INSTALL_STAGING = YES
 KMSXX_DEPENDENCIES = libdrm host-pkgconf
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index 3793429..7125aa8 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -7,7 +7,7 @@
 LIBICAL_VERSION = 1.0.1
 LIBICAL_SITE = https://github.com/libical/libical/releases/download/v$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
-LIBICAL_LICENSE = MPLv1.0 or LGPL-2.1
+LIBICAL_LICENSE = MPL-1.0 or LGPL-2.1
 LIBICAL_LICENSE_FILES = LICENSE
 
 # building without this option is broken, it is used by
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 61cfb24..5ec2b61 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -6,7 +6,7 @@
 
 LIBNICE_VERSION = 0.1.13
 LIBNICE_SITE = http://nice.freedesktop.org/releases
-LIBNICE_LICENSE = MPLv1.1 or LGPL-2.1
+LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index d95f970..1fc82be 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -10,7 +10,7 @@ LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_
 LIBNSPR_SUBDIR = nspr
 LIBNSPR_INSTALL_STAGING = YES
 LIBNSPR_CONFIG_SCRIPTS = nspr-config
-LIBNSPR_LICENSE = MPLv2.0
+LIBNSPR_LICENSE = MPL-2.0
 LIBNSPR_LICENSE_FILES = nspr/LICENSE
 
 # Set the host CFLAGS and LDFLAGS so NSPR does not guess wrongly
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 76532e8..d624cde 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -10,7 +10,7 @@ LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_
 LIBNSS_DISTDIR = dist
 LIBNSS_INSTALL_STAGING = YES
 LIBNSS_DEPENDENCIES = libnspr sqlite zlib
-LIBNSS_LICENSE = MPLv2.0
+LIBNSS_LICENSE = MPL-2.0
 LIBNSS_LICENSE_FILES = nss/COPYING
 
 # --gc-sections triggers binutils ld segfault
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 2acbb4e..b6b7d9a 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -8,7 +8,7 @@ MP4V2_VERSION = 2.0.0
 MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
 MP4V2_SITE = https://mp4v2.googlecode.com/files
 MP4V2_INSTALL_STAGING = YES
-MP4V2_LICENSE = MPLv1.1
+MP4V2_LICENSE = MPL-1.1
 MP4V2_LICENSE_FILES = COPYING
 
 # help2man expects to be able to run utilities on the build machine to
diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index ac76939..f4671ae 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -7,7 +7,7 @@
 RABBITMQ_SERVER_VERSION = 3.6.6
 RABBITMQ_SERVER_SITE = http://www.rabbitmq.com/releases/rabbitmq-server/v$(RABBITMQ_SERVER_VERSION)
 RABBITMQ_SERVER_SOURCE = rabbitmq-server-$(RABBITMQ_SERVER_VERSION).tar.xz
-RABBITMQ_SERVER_LICENSE = MPLv1.1, Apache-2.0, BSD-2-Clause, EPL, MIT, MPLv2.0
+RABBITMQ_SERVER_LICENSE = MPL-1.1, Apache-2.0, BSD-2-Clause, EPL, MIT, MPL-2.0
 RABBITMQ_SERVER_LICENSE_FILES = LICENSE-MPL-RabbitMQ \
 				LICENSE LICENSE-APACHE2-ExplorerCanvas \
 				LICENSE-APL2-Rebar LICENSE-APL2-Stomp-Websocket \
diff --git a/package/tstools/tstools.mk b/package/tstools/tstools.mk
index 3355db8..99f7ca9 100644
--- a/package/tstools/tstools.mk
+++ b/package/tstools/tstools.mk
@@ -9,7 +9,7 @@ TSTOOLS_VERSION = 08f6be304040e7b84760ac3920bcff4a563b6cd2
 TSTOOLS_SITE = $(call github,kynesim,tstools,$(TSTOOLS_VERSION))
 # tstools upstream doesn't contain any license file so far. See:
 # https://github.com/kynesim/tstools/issues/32
-TSTOOLS_LICENSE = MPLv1.1
+TSTOOLS_LICENSE = MPL-1.1
 TSTOOLS_LICENSE_FILES =
 
 define TSTOOLS_BUILD_CMDS
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 3e35fd7..d651c32 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -8,7 +8,7 @@ ZMQPP_VERSION = 4.1.2
 ZMQPP_SITE = $(call github,zeromq,zmqpp,$(ZMQPP_VERSION))
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
-ZMQPP_LICENSE = MPLv2.0
+ZMQPP_LICENSE = MPL-2.0
 ZMQPP_LICENSE_FILES = LICENSE
 ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index e47da97..baaa57f 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -6,7 +6,7 @@
 
 ZYRE_VERSION = 1d949e4bf79b694ea883c325f5813e87ddc2a687
 ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
-ZYRE_LICENSE = MPLv2.0
+ZYRE_LICENSE = MPL-2.0
 ZYRE_LICENSE_FILES = LICENSE
 ZYRE_INSTALL_STAGING = YES
 ZYRE_DEPENDENCIES = czmq zeromq host-pkgconf
