From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:30 -0600
Subject: [Buildroot] [NEXT 15/26] gzip: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-16-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/gzip/gzip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 26fc8ec..1e40429 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -13,6 +13,7 @@ GZIP_CONF_OPTS = --exec-prefix=/
 GZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 GZIP_LICENSE = GPL-3.0+
 GZIP_LICENSE_FILES = COPYING
+GZIP_CPE_ID = gnu:$(GZIP_NAME):$(GZIP_VERSION)
 GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
 # configure substitutes $(SHELL) for the shell shebang in scripts like
 # gzexe. Unfortunately, the same $(SHELL) variable will also be used by
-- 
1.9.1
