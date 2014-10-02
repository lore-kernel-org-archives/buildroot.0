From: Romain Naour <romain.naour@openwide.fr>
Date: Thu,  2 Oct 2014 21:55:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/xenomai: enable or disable debug
	based on BR2_ENABLE_DEBUG
Message-ID: <1412279752-5622-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/xenomai/xenomai.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index f360c2a..4bc0871 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -19,7 +19,8 @@ XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-user
 
-XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/ --disable-doc-install
+XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/ --disable-doc-install \
+	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
-- 
1.9.3
