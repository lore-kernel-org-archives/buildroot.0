From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Oct 2018 23:24:17 +0200
Subject: [Buildroot] [PATCH 2/2] libsepol: remove library host symlink
In-Reply-To: <20181010212417.23047-1-fontaine.fabrice@gmail.com>
References: <20181010212417.23047-1-fontaine.fabrice@gmail.com>
Message-ID: <20181010212417.23047-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since bump to version 2.7 and addition of
0003-revert-ln-relative.patch, the creation of a symlink through
ln -sf libsepol.so.1 $(HOST_DIR)/lib/libsepol.so
is not needed anymore so remove it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsepol/libsepol.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 5932ca1464..a9a9c652ea 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -41,7 +41,6 @@ endef
 
 define HOST_LIBSEPOL_INSTALL_CMDS
 	$(HOST_LIBSEPOL_MAKE_ENV) $(MAKE) -C $(@D) install $(HOST_CONFIGURE_OPTS)
-	ln -sf libsepol.so.1 $(HOST_DIR)/lib/libsepol.so
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
