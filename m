From: Min Xu <xuminready@gmail.com>
Date: Wed, 30 May 2018 15:13:14 -0700
Subject: [Buildroot] [PATCH v3 2/2] shadowsocks-libev: bump to version 3.2.0
 add a patch for libipset licence add hashes for the license files Fix
 shadowsocks-libev.mk
In-Reply-To: <20180530221315.19012-1-xuminready@gmail.com>
References: <20180530221315.19012-1-xuminready@gmail.com>
Message-ID: <20180530221315.19012-2-xuminready@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Min Xu <xuminready@gmail.com>
---
 .../0001-docs-add-BSD-3-Clause-licence.patch       | 52 ++++++++++++++++++++++
 package/shadowsocks-libev/shadowsocks-libev.hash   |  8 +++-
 package/shadowsocks-libev/shadowsocks-libev.mk     |  9 ++--
 3 files changed, 63 insertions(+), 6 deletions(-)
 create mode 100644 package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch

diff --git a/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch b/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch
new file mode 100644
index 0000000..64dda02
--- /dev/null
+++ b/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch
@@ -0,0 +1,52 @@
+From 0047295445c499e010706598c50f1bff8b0d632c Mon Sep 17 00:00:00 2001
+From: Min Xu <xuminready@gmail.com>
+Date: Wed, 30 May 2018 13:16:12 -0700
+Subject: [PATCH] docs: add BSD-3-Clause licence
+
+add missing licence for shadowsocks-libev/libipset
+
+Signed-off-by: Min Xu <xuminready@gmail.com>
+---
+ libipset/LICENSE.txt | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+ create mode 100644 libipset/LICENSE.txt
+
+diff --git a/libipset/LICENSE.txt b/libipset/LICENSE.txt
+new file mode 100644
+index 0000000..cff38df
+--- /dev/null
++++ b/libipset/LICENSE.txt
+@@ -0,0 +1,30 @@
++Copyright ? 2009-2013, RedJack, LLC.
++All rights reserved.
++
++Redistribution and use in source and binary forms, with or without
++modification, are permitted provided that the following conditions are
++met:
++
++  ? Redistributions of source code must retain the above copyright
++    notice, this list of conditions and the following disclaimer.
++
++  ? Redistributions in binary form must reproduce the above copyright
++    notice, this list of conditions and the following disclaimer in
++    the documentation and/or other materials provided with the
++    distribution.
++
++  ? Neither the name of RedJack Software, LLC nor the names of its
++    contributors may be used to endorse or promote products derived
++    from this software without specific prior written permission.
++
++THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
++A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
++HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
++SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
++OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+-- 
+2.11.0
+
diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index 07f10f4..e8be8a8 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -1,2 +1,8 @@
 # Locally computed
-sha256 58fb438d2cfe33cfa6ac8c50e587e2138c50e59a4b943f88d22883bf2e192a96  shadowsocks-libev-3.1.3.tar.gz
+sha256 5521cf623a07fd1e393528516a83acd2b66c5d4bb4535a52662806a6a060c606 shadowsocks-libev-3.2.0.tar.gz
+
+# License files, locally calculated
+sha256 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
+sha256 c41a4bc2c4c43e4daa3051e77e31b2d5c8500498afaeac6d831d55a4bb8de3fb  libbloom/LICENSE
+sha256 4fa2ada54f8c0410ec243265378242ffe862386d5ac517f8dd30a1911d25ae93  libcork/COPYING
+sha256 4b3adc9ce620fa868f1dda328203dbccbd3e9f5fbafb49c581edc386a504ee1a  libipset/LICENSE.txt
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index b711754..ddb2880 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-SHADOWSOCKS_LIBEV_VERSION = 3.1.3
+SHADOWSOCKS_LIBEV_VERSION = 3.2.0
 SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
-SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, MIT(c-ares), BSD-2-Clause or GPL-2.0+(libev), ISC(libsodium), Apache-2.0(mbedtls), BSD-3-Clause(pcre)
-SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING c-ares/COPYING libev/COPYING libsodium/COPYING mbedtls/COPYING pcre/COPYING
+SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause(libbloom), BSD-3-Clause(libcork, libipset)
+SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING libipset/LICENSE.txt
 SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
 SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
-SHADOWSOCKS_LIBEV_CONF_ENV = PCRECONFIG=$(STAGING_DIR)/usr/bin/pcre-config
-SHADOWSOCKS_LIBEV_CONF_OPTS = --disable-documentation --with-pcre=$(STAGING_DIR)/usr/bin/
+SHADOWSOCKS_LIBEV_CONF_OPTS = --disable-documentation --with-pcre=$(STAGING_DIR)/usr
 
 $(eval $(autotools-package))
-- 
2.11.0
