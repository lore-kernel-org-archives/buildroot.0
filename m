From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 15:59:07 +0200
Subject: [Buildroot] [git commit] berkeleydb: build with C++ support if
	enabled
Message-ID: <20120425135941.991E796BBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a68921a0925bdee5f721fe97350db2bfc9bab8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/berkeleydb/berkeleydb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 396ba16..bb3fd5d 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -22,7 +22,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--with-gnu-ld \
-		--disable-cxx \
+		$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx,--disable-cxx) \
 		--disable-java \
 		--disable-tcl \
 		--disable-compat185 \
