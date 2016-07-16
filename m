From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 16 Jul 2016 16:06:27 -0400
Subject: [Buildroot] [v2 3/5] package/libsemanage: add host-audit as a
	dependency.
In-Reply-To: <1468699589-14328-1-git-send-email-Aduskett@gmail.com>
References: <1468699589-14328-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1468699589-14328-3-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

refpolicy requires host-libsemanage.  host-libsemanage will fail
to compile without host-audit.  This adds host-audit as a requirement
for host-libsemanage.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes:

v1 - v2:
 - Added better reasoning as to why this patch exists.

 package/libsemanage/libsemanage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index a60d018..beb34ba 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -27,7 +27,7 @@ define LIBSEMANAGE_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
-HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-libsepol host-libselinux \
+HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libselinux \
 				host-ustr host-bzip2 host-swig
 HOST_LIBSEMANAGE_MAKE_OPTS += $(HOST_CONFIGURE_OPTS) \
 	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
-- 
2.7.4
