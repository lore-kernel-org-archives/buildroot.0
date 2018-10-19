From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Oct 2018 22:13:11 +0200
Subject: [Buildroot] [PATCH 2/6] gvfs: use --enable-gudev option
In-Reply-To: <20181019201315.15922-1-fontaine.fabrice@gmail.com>
References: <20181019201315.15922-1-fontaine.fabrice@gmail.com>
Message-ID: <20181019201315.15922-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.17.1
