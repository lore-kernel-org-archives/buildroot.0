From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:11:14 +0200
Subject: [Buildroot] [git commit] package/heimdal: fix build when the host
 has some DB libs
Message-ID: <20180630160800.6A6AB83713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07d4d97171a3ed293da07aa9d20bae572c4c5e1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the host has a DB library installed, namely LMDB, host-heimdal
will detect it and try to use, resulting in a build failure due to
missing symbols.

Really disable all the DB backends, we don't need them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
