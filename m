From: Steve James <ste@junkomatic.net>
Date: Wed, 17 Dec 2014 12:25:59 +0000
Subject: [Buildroot] [PATCH v2] package/snappy: add dependency on
	host-pkgconf
Message-ID: <201412171225.59482.ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Snappy doesn't configure without host pkg-config, causing this totally 
unhelpful diagnostic from autoconf:

  configure.ac:42: error: possibly undefined macro: AC_DEFINE
        If this token and others are legitimate, please use m4_pattern_allow.
        See the Autoconf documentation.
  configure.ac:44: error: possibly undefined macro: AC_MSG_FAILURE

So add host-pkgconf to the package's DEPENDENCIES list.

Signed-off-by: Steve James <ste@junkomatic.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - Reorganised this commit comment only; no change to the patch itself

 package/snappy/snappy.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index fd89325..6bda7ce 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -10,6 +10,7 @@ SNAPPY_LICENSE = BSD-3c
 SNAPPY_LICENSE_FILES = COPYING
 # from git
 SNAPPY_AUTORECONF = YES
+SNAPPY_DEPENDENCIES = host-pkgconf
 SNAPPY_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.10.4
