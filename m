From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Feb 2016 16:53:38 +0100
Subject: [Buildroot] [PATCH v6 10/13] package/speex: remove no longer needed
	hook
In-Reply-To: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1454342021-22960-11-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the LIBTOOL_FIXUP hook since RPATH are now sanitized in
target-finalize hooks.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v5->v6:
- no change

changes v4->v5:
- new patch (suggested by Baruch)
---
 package/speex/speex.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index a34bfac..24782ec 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -24,11 +24,6 @@ ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
 SPEEX_CONF_OPTS += --enable-arm5e-asm
 endif
 
-define SPEEX_LIBTOOL_FIXUP
-	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(@D)/libtool
-	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(@D)/libtool
-endef
-
 SPEEX_POST_CONFIGURE_HOOKS += SPEEX_LIBTOOL_FIXUP
 
 define SPEEX_BUILD_CMDS
-- 
2.7.0
