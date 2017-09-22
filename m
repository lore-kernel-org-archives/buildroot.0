From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:16:13 +0200
Subject: [Buildroot] [git commit] package/libyaml: bump version to 0.1.7
Message-ID: <20170922161618.737A3807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1501e2d1f619cb9424863a8fcba9b1194b15b94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch after upstream committed a similar patch:
https://github.com/yaml/libyaml/commit/946596172d140497b560e016e581accb0a92cca4#diff-35a172a9ca8faa1683fc747ca94681b3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libyaml/0001-fix-CVE-2014-9130.patch | 33 ----------------------------
 package/libyaml/libyaml.hash                 |  2 +-
 package/libyaml/libyaml.mk                   |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/libyaml/0001-fix-CVE-2014-9130.patch b/package/libyaml/0001-fix-CVE-2014-9130.patch
deleted file mode 100644
index a267e40..0000000
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
index fd039fa..44b04a3 100644
--- a/package/libyaml/libyaml.hash
+++ b/package/libyaml/libyaml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7da6971b4bd08a986dd2a61353bc422362bd0edcc67d7ebaac68c95f74182749	yaml-0.1.6.tar.gz
+sha256 8088e457264a98ba451a90b8661fcb4f9d6f478f7265d48322a196cec2480729  yaml-0.1.7.tar.gz
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 52d4750..bc8d695 100644
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
