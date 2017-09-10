From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Sep 2017 17:16:15 +0200
Subject: [Buildroot] [git commit] Revert "bind: fix compilation when lmdb.h
	is present on host"
Message-ID: <20170910150924.B35277FE11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b268180c142f5e3d7d56f16e6b2025173609768
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7c0ecd4d7526dedce85a49172b031f45cde19a4b, as it is
in fact a duplicate of commit
bb95fef1e0bec4ebc0584001f337438b17c4744d.

Reported-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index c3d4872..c65568e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -30,7 +30,6 @@ BIND_CONF_OPTS = \
 	--enable-epoll \
 	--with-libtool \
 	--with-gssapi=no \
-	--with-lmdb=no \
 	--enable-filter-aaaa
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
