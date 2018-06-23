From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Jun 2018 21:59:45 +0200
Subject: [Buildroot] [PATCH 1/1] mosh: fix build with protobuf 3.6.0
Message-ID: <20180623195945.26671-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

protobuf now requires C++11

Fixes:
 - http://autobuild.buildroot.net/results/6e4550e080a9d558b441dcc735b6be14f39fb03f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mosh/mosh.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index fa6ab17010..f9e335799d 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -10,6 +10,9 @@ MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
 
+# protobuf needs c++11 (since 3.6.0)
+MOSH_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MOSH_CONF_OPTS += --with-crypto-library=openssl
 MOSH_DEPENDENCIES += openssl
-- 
2.14.1
