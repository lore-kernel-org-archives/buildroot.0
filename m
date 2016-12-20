From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:36 +0100
Subject: [Buildroot] [PATCH v5 19/19] infra-libtool: no longer force
	sys_lib_search_path
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1482241596-31688-20-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 6246704008 forced $sys_lib_search_path_spec to be empty. Commit log said
that it was filled with native paths. However, recent tests show that
$sys_lib_search_path_spec is correctly filled with result of
`$CC -print-search-dirs' as it should.

So this patch remove this workaround.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/Makefile.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 6a341f2..ee43985 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -354,7 +354,6 @@ TARGET_CONFIGURE_ARGS = \
 	ac_cv_func_malloc_0_nonnull=yes \
 	ac_cv_func_calloc_0_nonnull=yes \
 	ac_cv_func_realloc_0_nonnull=yes \
-	lt_cv_sys_lib_search_path_spec="" \
 	lt_cv_sys_lib_dlsearch_path_spec="/lib /usr/lib $(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
 	$(BR2_AC_CV_C_BIGENDIAN) \
 	$(BR2_GT_CV_FUNC_GNUGETTEXT_LIBC)
-- 
1.9.1
