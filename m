From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  8 Aug 2017 18:57:58 +0200
Subject: [Buildroot] [PATCH v1] bind: fix configure in case lmdb devel files
	are present on the host
Message-ID: <20170808165758.14788-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix configure failure in case lmdb devel files are present on the host
by adding --without-lmdb option (reported [1] and fix tested [2],[3] by
grunpferd at netscape.net).

Fixes:

  checking for lmdb library... yes
  checking for library containing mdb_env_create... no
  configure: error: found lmdb include but not library.

[1] http://lists.busybox.net/pipermail/buildroot/2017-August/199945.html
[2] http://lists.busybox.net/pipermail/buildroot/2017-August/199963.html
[3] http://lists.busybox.net/pipermail/buildroot/2017-August/199964.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 988f40e1c2..c65568e9e3 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -24,6 +24,7 @@ BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
 	BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = \
+	--without-lmdb \
 	--with-libjson=no \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
-- 
2.11.0
