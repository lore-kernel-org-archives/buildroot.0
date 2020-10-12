From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 12 Oct 2020 21:41:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/unixodbc: bump to version 2.3.9
In-Reply-To: <20201012194144.2949015-1-fontaine.fabrice@gmail.com>
References: <20201012194144.2949015-1-fontaine.fabrice@gmail.com>
Message-ID: <20201012194144.2949015-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- libedit is an optional dependency since version 2.3.9 and
  https://github.com/lurcher/unixODBC/commit/6ebf06767e398dc0b7d4aa090e20f7814c2ae383
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unixodbc/unixodbc.hash | 10 +++++-----
 package/unixodbc/unixodbc.mk   |  9 ++++++++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
index 4d0ad191d1..ba094f7627 100644
--- a/package/unixodbc/unixodbc.hash
+++ b/package/unixodbc/unixodbc.hash
@@ -1,6 +1,6 @@
-# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.7.tar.gz.md5
-md5 274a711b0c77394e052db6493840c6f9  unixODBC-2.3.7.tar.gz
+# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.9.tar.gz.md5
+md5  06f76e034bb41df5233554abe961a16f  unixODBC-2.3.9.tar.gz
 # Locally computed
-sha256 45f169ba1f454a72b8fcbb82abd832630a3bf93baa84731cf2949f449e1e3e77  unixODBC-2.3.7.tar.gz
-sha256 a6b9aa1e9bfade121164c06fd975e9b913a8e38bf33d25ff967dfa3ed07d12f8  COPYING
-sha256 1e594f4c7fd6d099eca4bd1340b39d871ce0298331d8ebd4b68935548ee45cf4  exe/COPYING
+sha256  52833eac3d681c8b0c9a5a65f2ebd745b3a964f208fc748f977e44015a31b207  unixODBC-2.3.9.tar.gz
+sha256  a6b9aa1e9bfade121164c06fd975e9b913a8e38bf33d25ff967dfa3ed07d12f8  COPYING
+sha256  1e594f4c7fd6d099eca4bd1340b39d871ce0298331d8ebd4b68935548ee45cf4  exe/COPYING
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index efcd5e3d4e..cdc4e69a7e 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNIXODBC_VERSION = 2.3.7
+UNIXODBC_VERSION = 2.3.9
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
 UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
 UNIXODBC_INSTALL_STAGING = YES
@@ -13,6 +13,13 @@ UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
 
 UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
 
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+UNIXODBC_CONF_OPTS += --enable-editline
+UNIXODBC_DEPENDENCIES += libedit
+else
+UNIXODBC_CONF_OPTS += --disable-editline
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 UNIXODBC_CONF_OPTS += --enable-iconv
 UNIXODBC_DEPENDENCIES += libiconv
-- 
2.28.0
