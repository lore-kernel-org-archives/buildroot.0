From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Mar 2018 18:20:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/erlang: bump version to 20.3
Message-ID: <20180331162023.22289-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0001, not needed anymore after upstream commit
https://github.com/erlang/otp/commit/aa9054e0ea48a127f2aeafcdce1df4d1aec09574

Renumbered remaining patches, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/erlang/0001-build-fix.patch                         | 13 -------------
 ...s-ethread-instruct-libatomic_ops-we-do-require-CA.patch} |  0
 ... 0002-erts-emulator-reorder-inclued-headers-paths.patch} |  0
 ... => 0003-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch} |  0
 package/erlang/erlang.hash                                  |  5 +++--
 package/erlang/erlang.mk                                    |  4 ++--
 6 files changed, 5 insertions(+), 17 deletions(-)
 delete mode 100644 package/erlang/0001-build-fix.patch
 rename package/erlang/{0002-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch => 0001-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch} (100%)
 rename package/erlang/{0003-erts-emulator-reorder-inclued-headers-paths.patch => 0002-erts-emulator-reorder-inclued-headers-paths.patch} (100%)
 rename package/erlang/{0004-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch => 0003-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch} (100%)

diff --git a/package/erlang/0001-build-fix.patch b/package/erlang/0001-build-fix.patch
deleted file mode 100644
index ff821c9fc0..0000000000
--- a/package/erlang/0001-build-fix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-apply-patches.sh deletes this file from the source directory.
-
---- erlang-R15B01.old/lib/tools/emacs/Makefile	2012-04-04
-+++ erlang-R15B01/lib/tools/emacs/Makefile	2012-04-04 15:55:16.978957307 +0100
-@@ -51,7 +51,7 @@
-
- ELC_FILES = $(EMACS_FILES:%=%.elc)
-
--TEST_FILES = test.erl.indented test.erl.orig
-+TEST_FILES = test.erl.indented
-
- # ----------------------------------------------------
- # Targets
diff --git a/package/erlang/0002-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch b/package/erlang/0001-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch
similarity index 100%
rename from package/erlang/0002-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch
rename to package/erlang/0001-erts-ethread-instruct-libatomic_ops-we-do-require-CA.patch
diff --git a/package/erlang/0003-erts-emulator-reorder-inclued-headers-paths.patch b/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
similarity index 100%
rename from package/erlang/0003-erts-emulator-reorder-inclued-headers-paths.patch
rename to package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
diff --git a/package/erlang/0004-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch b/package/erlang/0003-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch
similarity index 100%
rename from package/erlang/0004-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch
rename to package/erlang/0003-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch
diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
index cf820cec1b..f5ff74022c 100644
--- a/package/erlang/erlang.hash
+++ b/package/erlang/erlang.hash
@@ -1,3 +1,4 @@
 # md5 from http://www.erlang.org/download/MD5, sha256 locally computed
-md5     2faed2c3519353e6bc2501ed4d8e6ae7        otp_src_20.0.tar.gz
-sha256  fe80e1e14a2772901be717694bb30ac4e9a07eee0cc7a28988724cbd21476811        otp_src_20.0.tar.gz
+md5 a683c8c0aacfe0305c4bf47b3abfde6a  otp_src_20.3.tar.gz
+sha256 4e19e6c403d5255531c0b870f19511c8b8e3b080618e4f9efcb44d905935b2a1  otp_src_20.3.tar.gz
+sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE.txt
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 5705b98d8e..b7fdb6b9ce 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # See note below when updating Erlang
-ERLANG_VERSION = 20.0
+ERLANG_VERSION = 20.3
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
@@ -19,7 +19,7 @@ ERLANG_AUTORECONF = YES
 
 # Whenever updating Erlang, this value should be updated as well, to the
 # value of EI_VSN in the file lib/erl_interface/vsn.mk
-ERLANG_EI_VSN = 3.10
+ERLANG_EI_VSN = 3.10.1
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
-- 
2.14.2
