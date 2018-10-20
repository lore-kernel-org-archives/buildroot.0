From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 18:03:33 +0200
Subject: [Buildroot] [git commit] gvfs: use explicit --enable-gudev option
Message-ID: <20181020160911.6F05F84385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87d6d05f1532e34f7623579342d51e05e2cb0eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index b62923a500..82683d7da1 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -44,6 +44,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 GVFS_DEPENDENCIES += libgudev
+GVFS_CONF_OPTS  += --enable-gudev
+else
+GVFS_CONF_OPTS += --disable-gudev
 endif
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
