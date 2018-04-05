From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Apr 2018 09:36:01 +0200
Subject: [Buildroot] [git commit] postgresql: propagate BR2_USE_MMU
 dependency to Config.in comment
Message-ID: <20180405080430.D990084F90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fec3eb9131dba46cbf8474a7def05a076990079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_POSTGRESQL option depends on BR2_USE_MMU, so the
Config.in comment about the dynamic library dependency should only be
displayed if the BR2_USE_MMU requirement is met.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index e9b8f48d4a..9dda54bf9f 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -19,4 +19,5 @@ config BR2_PACKAGE_POSTGRESQL
 	  http://www.postgresql.org
 
 comment "postgresql needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
