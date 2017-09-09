From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:10:54 +0200
Subject: [Buildroot] [git commit] libmodbus: bump to version 3.1.4
Message-ID: <20170909200832.8A8A380E30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26493c0f1b0dd16b0a1e37deaead7b4a489c3af0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tests compilation and documentation generation.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmodbus/libmodbus.hash | 2 +-
 package/libmodbus/libmodbus.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index 095164d..b5c4450 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	046d63f10f755e2160dc56ef681e5f5ad3862a57c1955fd82e0ce036b69471b6	libmodbus-3.0.6.tar.gz
+sha256  c8c862b0e9a7ba699a49bc98f62bdffdfafd53a5716c0e162696b4bf108d3637  libmodbus-3.1.4.tar.gz
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 6f0f342..e5a6c63 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.0.6
+LIBMODBUS_VERSION = 3.1.4
 LIBMODBUS_SITE = http://libmodbus.org/releases
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_INSTALL_STAGING = YES
+LIBMODBUS_CONF_OPTS = --without-documentation --disable-tests
 
 $(eval $(autotools-package))
