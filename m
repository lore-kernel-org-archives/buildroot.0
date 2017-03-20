From: sikor6 at gmail.com <sikor6@gmail.com>
Date: Tue, 21 Mar 2017 00:33:49 +0100
Subject: [Buildroot] [PATCH 3/3] xenomai: enable SMP in configuration options
In-Reply-To: <20170320233349.14057-1-sikor6@gmail.com>
References: <20170320233349.14057-1-sikor6@gmail.com>
Message-ID: <20170320233349.14057-3-sikor6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pawel Sikora <sikor6@gmail.com>

Add --enable-smp to XENOMAI_CONF_OPTS, so kernel and xenomai
userpace libs both support it.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 28875b944..37ec68526 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -21,7 +21,7 @@ XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
-XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
+XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install --enable-smp
 
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
-- 
2.12.0
