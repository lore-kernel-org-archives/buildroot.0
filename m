From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 15:12:56 +0100
Subject: [Buildroot] [git commit] package/sysdig: disable all bundled
 dependencies
Message-ID: <20191208140428.73CE088910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56aef8f66b02821851e340e8122734ecbe392b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable all dependencies through -DUSE_BUNDLED_DEPS=OFF instead of
disabling them one by one

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
