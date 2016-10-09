From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 15:11:39 +0200
Subject: [Buildroot] [git commit] Revert "libglib2: add host-util-linux for
	host variant"
Message-ID: <20161009161148.DC73680E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f556ab99f51a0b90183610a7fecb9ed22ed4aa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 71c5a81c96873c056cb2c54580e3ba2db528ca8a.

The bump to libglib2 2.25.0 causes a large number of build failures due
to the redefinition of crc32() in both util-linux libblkid and
zlib. This commit is related to the bump, so it needs to get reverted as
well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f199a4a..5bc6ed5 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -105,12 +105,7 @@ LIBGLIB2_DEPENDENCIES = \
 	libffi pcre util-linux zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
 
 HOST_LIBGLIB2_DEPENDENCIES = \
-	host-gettext \
-	host-libffi \
-	host-pcre \
-	host-pkgconf \
-	host-util-linux \
-	host-zlib
+	host-gettext host-libffi host-pcre host-pkgconf host-zlib
 
 LIBGLIB2_CONF_OPTS = \
 	--with-pcre=system
