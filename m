From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 22 Apr 2016 22:50:18 +0200
Subject: [Buildroot] [PATCH v9 06/11] package/speex: remove no longer needed
	hook
In-Reply-To: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1461358223-18312-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the LIBTOOL_FIXUP hook since RPATH are now sanitized in
target-finalize hooks.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v8->v9:
- remove hook addition (ThomasP)

changes v7->v8:
- none

changes v6->v7:
- none

changes v5->v6:
- none

changes v4->v5:
- new patch (suggested by Baruch)
---
 package/speex/speex.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index a34bfac..86c5cef 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -24,13 +24,6 @@ ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
 SPEEX_CONF_OPTS += --enable-arm5e-asm
 endif
 
-define SPEEX_LIBTOOL_FIXUP
-	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(@D)/libtool
-	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(@D)/libtool
-endef
-
-SPEEX_POST_CONFIGURE_HOOKS += SPEEX_LIBTOOL_FIXUP
-
 define SPEEX_BUILD_CMDS
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPTS) -C $(@D)/$($(PKG)_SUBDIR)
 endef
-- 
2.8.0
