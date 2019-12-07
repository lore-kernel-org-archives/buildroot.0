From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Dec 2019 20:17:03 +0100
Subject: [Buildroot] [PATCH 2/3] package/sysdig: disable all bundled
 dependencies
In-Reply-To: <20191207191704.647337-1-fontaine.fabrice@gmail.com>
References: <20191207191704.647337-1-fontaine.fabrice@gmail.com>
Message-ID: <20191207191704.647337-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable all dependencies through -DUSE_BUNDLED_DEPS=OFF instead of
disabling them one by one

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysdig/sysdig.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 9ac990e3e2..c604032cf4 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -8,10 +8,7 @@ SYSDIG_VERSION = 0.23.1
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
-SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
-	-DUSE_BUNDLED_JSONCPP=OFF -DENABLE_DKMS=OFF -DUSE_BUNDLED_CURL=OFF \
-	-DUSE_BUNDLED_NCURSES=OFF -DUSE_BUNDLED_OPENSSL=OFF \
-	-DUSE_BUNDLED_JQ=OFF -DUSE_BUNDLED_B64=OFF
+SYSDIG_CONF_OPTS = -DENABLE_DKMS=OFF -DUSE_BUNDLED_DEPS=OFF
 SYSDIG_DEPENDENCIES = zlib luajit jsoncpp libcurl ncurses openssl jq libb64 elfutils
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
-- 
2.24.0
