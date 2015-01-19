From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:13 +0200
Subject: [Buildroot] [PATCH 13/16] package/tar: add support for acl and xattr
In-Reply-To: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
Message-ID: <1421684056-5266-14-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If acl or attr is going to be installed, add support for them to tar.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 package/tar/tar.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index caaa5ad..e3f538d 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -19,6 +19,16 @@ TAR_DEPENDENCIES += busybox
 HOST_TAR_DEPENDENCIES =
 endif
 
+ifeq ($(BR2_PACKAGE_ACL),y)
+TAR_DEPENDENCIES += acl
+TAR_CONF_OPTS += --with-posix-acls
+endif
+
+ifeq ($(BR2_PACKAGE_ATTR),y)
+TAR_DEPENDENCIES += attr
+TAR_CONF_OPTS += --with-xattrs
+endif
+
 $(eval $(autotools-package))
 
 # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
-- 
2.2.1
