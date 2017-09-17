From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 19:16:17 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libyaml: bump version to 0.1.7
Message-ID: <20170917171618.31236-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch after upstream committed a similar patch:
https://github.com/yaml/libyaml/commit/946596172d140497b560e016e581accb0a92cca4#diff-35a172a9ca8faa1683fc747ca94681b3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: removed the change of _SITE to github, upstream site is back online
    (Thomas)
    For reference: upstream site was down since at least Sep 16th:
    https://sourceforge.net/p/yaml/mailman/message/36041759/

 package/libyaml/0001-fix-CVE-2014-9130.patch | 33 ----------------------------
 package/libyaml/libyaml.hash                 |  2 +-
 package/libyaml/libyaml.mk                   |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/libyaml/0001-fix-CVE-2014-9130.patch

diff --git a/package/libyaml/0001-fix-CVE-2014-9130.patch b/package/libyaml/0001-fix-CVE-2014-9130.patch
deleted file mode 100644
index a267e4084c..0000000000
--- a/package/libyaml/0001-fix-CVE-2014-9130.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e6aa721cc0e5a48f408c52355559fd36780ba32a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ingy=20d=C3=B6t=20Net?= <ingy@ingy.net>
-Date: Fri, 28 Nov 2014 09:21:49 -0800
-Subject: [PATCH] Fix for https://bitbucket.org/xi/libyaml/issue/10/
-
-https://bitbucket.org/xi/libyaml/issue/10/wrapped-strings-cause-assert-failure
-
-Commenting out the assert makes the scanner do the right thing and
-results in just a simple parse failure.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/scanner.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/scanner.c b/src/scanner.c
-index 88d4fa5..c5f3d2f 100644
---- a/src/scanner.c
-+++ b/src/scanner.c
-@@ -1110,7 +1110,9 @@ yaml_parser_save_simple_key(yaml_parser_t *parser)
-      * line.  Therefore it is always allowed.  But we add a check anyway.
-      */
- 
--    assert(parser->simple_key_allowed || !required);    /* Impossible. */
-+    /* XXX This caused:
-+     * https://bitbucket.org/xi/libyaml/issue/10/wrapped-strings-cause-assert-failure
-+    assert(parser->simple_key_allowed || !required); */    /* Impossible. */
- 
-     /*
-      * If the current position may start a simple key, save it.
--- 
-2.0.4
-
diff --git a/package/libyaml/libyaml.hash b/package/libyaml/libyaml.hash
index fd039fa6e4..44b04a3365 100644
--- a/package/libyaml/libyaml.hash
+++ b/package/libyaml/libyaml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7da6971b4bd08a986dd2a61353bc422362bd0edcc67d7ebaac68c95f74182749	yaml-0.1.6.tar.gz
+sha256 8088e457264a98ba451a90b8661fcb4f9d6f478f7265d48322a196cec2480729  yaml-0.1.7.tar.gz
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 52d475066e..bc8d6951bd 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYAML_VERSION = 0.1.6
+LIBYAML_VERSION = 0.1.7
 LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
 LIBYAML_SITE = http://pyyaml.org/download/libyaml
 LIBYAML_INSTALL_STAGING = YES
-- 
2.11.0
