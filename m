From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 09:03:10 +0200
Subject: [Buildroot] [PATCH] package/heimdal: fix build when the host has
 some DB libs
Message-ID: <20180630070310.16596-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the host has a DB library installed, namely LMDB, host-heimdal
will detect it and try to use, resulting in a build failure due to
missing symbols.

Really disable all the DB backends, we don't need them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/heimdal/heimdal.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 79aaacbd30..5f7b6c6853 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -24,7 +24,10 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--without-libedit \
 	--without-hesiod \
 	--without-x \
+	--disable-mdb-db \
+	--disable-ndbm-db \
 	--disable-heimdal-documentation
+
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
 HEIMDAL_LICENSE = BSD-3-Clause
 HEIMDAL_LICENSE_FILES = LICENSE
-- 
2.14.1
