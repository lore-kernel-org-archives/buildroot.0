From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 05 May 2014 19:20:33 +0200
Subject: [Buildroot] [PATCH] github packages: use tarball download via
 github helper iso git clone
Message-ID: <dccb637f035428285884.1399310433@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tarball download from github is preferred, because:
- download size is smaller
- git clone may be blocked in some corporate environments

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/cppzmq/cppzmq.mk                   |  2 +-
 package/czmq/czmq.mk                       |  2 +-
 package/json-javascript/json-javascript.mk |  2 +-
 package/qtuio/qtuio.mk                     |  2 +-
 package/sconeserver/sconeserver.mk         |  2 +-
 package/tvheadend/tvheadend.mk             |  2 +-
 package/zmqpp/zmqpp.mk                     |  2 +-
 package/znc/znc.mk                         |  2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CPPZMQ_VERSION = 235803740753312576495301ebf5b8ed76407173
-CPPZMQ_SITE = git://github.com/zeromq/cppzmq.git
+CPPZMQ_SITE = $(call github,zeromq,cppzmq,$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = zeromq
 CPPZMQ_LICENSE = MIT
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CZMQ_VERSION = v2.2.0
-CZMQ_SITE = git://github.com/zeromq/czmq.git
+CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
 
 # Autoreconf required as we use the git tree
 CZMQ_AUTORECONF = YES
diff --git a/package/json-javascript/json-javascript.mk b/package/json-javascript/json-javascript.mk
--- a/package/json-javascript/json-javascript.mk
+++ b/package/json-javascript/json-javascript.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 JSON_JAVASCRIPT_VERSION = 42c18c621a411c3f39a81bb0a387fc50dcd738d9
-JSON_JAVASCRIPT_SITE = git://github.com/douglascrockford/JSON-js.git
+JSON_JAVASCRIPT_SITE = $(call github,douglascrockford,JSON-js,$(JSON_JAVASCRIPT_VERSION))
 JSON_JAVASCRIPT_LICENSE = Public Domain
 JSON_JAVASCRIPT_LICENSE_FILES = json2.js
 
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QTUIO_VERSION = abe4973ff60654aad9df7037c4ca15c45f811d24
-QTUIO_SITE = git://github.com/x29a/qTUIO.git
+QTUIO_SITE = $(call github,x29a,qTUIO,$(QTUIO_VERSION))
 QTUIO_INSTALL_STAGING = YES
 QTUIO_DEPENDENCIES = qt
 
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -7,7 +7,7 @@
 # Release 0.6.0 doesn't build cleanly, so use a recent
 # Git commit.
 SCONESERVER_VERSION = d58f2de88c681939554089f786e360042a30c8f8
-SCONESERVER_SITE = git://github.com/sconemad/sconeserver.git
+SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
 
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TVHEADEND_VERSION = 6482d33ba90848018c530018e5c38992b8ac921c
-TVHEADEND_SITE = git://github.com/tvheadend/tvheadend.git
+TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE
 TVHEADEND_DEPENDENCIES = host-pkgconf host-python openssl
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZMQPP_VERSION = 36413487f05b165dfc82ad307a5a1c36a795e607
-ZMQPP_SITE = git://github.com/benjamg/zmqpp.git
+ZMQPP_SITE = $(call github,benjamg,zmqpp,$(ZMQPP_VERSION))
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
 ZMQPP_LICENSE = LGPLv3+ with exceptions
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZNC_VERSION = b396cafdb249544164ed02942a5babba59e519a3
-ZNC_SITE = git://github.com/znc/znc.git
+ZNC_SITE = $(call github,znc,znc,$(ZNC_VERSION))
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
 ZNC_DEPENDENCIES = host-pkgconf host-autoconf host-automake
