From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:52 +0200
Subject: [Buildroot] [PATCH v2 09/18] package/owfs: remove Python
 sysconfigdata fixup
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-10-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixup is done at pkg-generic level for all packages.
So, it is no more needed in owfs package.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v1 to v2:
 - Added 'Reviewed-by: Yann E. MORIN'

 package/owfs/owfs.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index ffc0b3098d..10543d3698 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -88,15 +88,6 @@ OWFS_DEPENDENCIES += python host-swig
 # override the PYSITEDIR variable in make.
 OWFS_EXTRA_MAKE_OPTS += PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define OWFS_FIXUP_PYTHON_SYSCONFIGDATA
-	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
-		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
-		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/owfs/:g"
-endef
-OWFS_PRE_CONFIGURE_HOOKS += OWFS_FIXUP_PYTHON_SYSCONFIGDATA
-endif
-
 else
 OWFS_CONF_OPTS += --disable-owpython --without-python
 endif
-- 
2.31.1
