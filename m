From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 26 Dec 2010 17:16:36 +0100
Subject: [Buildroot] [PATCH 3/3] automake: install gtk-doc.m4 in host
	directory instead of staging
In-Reply-To: <1293380196-22990-1-git-send-email-llandwerlin@gmail.com>
References: <1293380196-22990-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1293380196-22990-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/automake/automake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 6ee3121..964f2fb 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -12,7 +12,7 @@ AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
 define GTK_DOC_M4_INSTALL
- $(INSTALL) -m 0644 package/automake/gtk-doc.m4 $(STAGING_DIR)/usr/share/aclocal/
+ $(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(HOST_DIR)/usr/share/aclocal/gtk-doc.m4
 endef
 
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
-- 
1.7.2.3
