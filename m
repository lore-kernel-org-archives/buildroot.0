From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 22:42:49 +0100
Subject: [Buildroot] [git commit] thrift: needs host-bison and host-flex
Message-ID: <20140224214311.77C9B99B79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51b387b99b4328365733f1d78ba7c978caf86d68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/d46/d46f9097780bdde68ec15f693281ee0b04667f98/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thrift/thrift.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index d61cc3a..0f6a1d0 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -9,7 +9,7 @@ THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
 THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl zlib
 THRIFT_INSTALL_STAGING = YES
 HOST_THRIFT_DEPENDENCIES = host-boost host-libevent host-openssl host-pkgconf \
-	host-zlib
+	host-zlib host-bison host-flex
 THRIFT_CONF_OPT = --with-sysroot=$(STAGING_DIR) --with-tests=no \
 	--with-boost=$(STAGING_DIR)
 HOST_THRIFT_CONF_OPT = --with-sysroot=$(HOST_DIR) --with-tests=no
