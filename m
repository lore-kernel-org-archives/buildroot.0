From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 Jun 2018 22:33:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/erlang: bump version to 21.0
Message-ID: <20180620203343.15647-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: http://www.erlang.org/news/123

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-emulator-reorder-inclued-headers-paths.patch | 16 +++++-----------
 package/erlang/erlang.hash                       |  4 ++--
 package/erlang/erlang.mk                         |  4 ++--
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch b/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
index c17eefc2a1..2c976f539e 100644
--- a/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
+++ b/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
@@ -16,6 +16,8 @@ Move INCLUDES before CFLAGS to use pcre.h from erlang.
 http://autobuild.buildroot.net/results/cbd/cbd8b54eef535f19d7d400fd269af1b3571d6143/build-end.log
 
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+[Bernd: rebased for erlang-21.0]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  erts/emulator/Makefile.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -24,20 +26,12 @@ diff --git a/erts/emulator/Makefile.in b/erts/emulator/Makefile.in
 index 7145824..d079487 100644
 --- a/erts/emulator/Makefile.in
 +++ b/erts/emulator/Makefile.in
-@@ -678,11 +678,11 @@ else
+@@ -712,7 +712,7 @@
  # Usually the same as the default rule, but certain platforms (e.g. win32) mix
  # different compilers
  $(OBJDIR)/beam_emu.o: beam/beam_emu.c
 -	$(V_EMU_CC) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) $(INCLUDES) -c $< -o $@
 +	$(V_EMU_CC) $(INCLUDES) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) -c $< -o $@
- endif
  
- $(OBJDIR)/%.o: beam/%.c
--	$(V_CC) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) $(INCLUDES) -c $< -o $@
-+	$(V_CC) $(INCLUDES) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) -c $< -o $@
- 
- $(OBJDIR)/%.o: $(TARGET)/%.c
- 	$(V_CC) $(CFLAGS) $(INCLUDES) -Idrivers/common -c $< -o $@
--- 
-1.9.3
-
+ $(OBJDIR)/beam_emu.S: beam/beam_emu.c
+ 	$(V_EMU_CC) -S -fverbose-asm $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) $(INCLUDES) -c $< -o $@
diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
index f5ff74022c..616c85e9ae 100644
--- a/package/erlang/erlang.hash
+++ b/package/erlang/erlang.hash
@@ -1,4 +1,4 @@
 # md5 from http://www.erlang.org/download/MD5, sha256 locally computed
-md5 a683c8c0aacfe0305c4bf47b3abfde6a  otp_src_20.3.tar.gz
-sha256 4e19e6c403d5255531c0b870f19511c8b8e3b080618e4f9efcb44d905935b2a1  otp_src_20.3.tar.gz
+md5 350988f024f88e9839c3715b35e7e27a  otp_src_21.0.tar.gz
+sha256 c7d247c0cad2d2e718eaca2e2dff051136a1347a92097abf19ebf65ea2870131  otp_src_21.0.tar.gz
 sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE.txt
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index b7fdb6b9ce..786641e4bd 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # See note below when updating Erlang
-ERLANG_VERSION = 20.3
+ERLANG_VERSION = 21.0
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
@@ -19,7 +19,7 @@ ERLANG_AUTORECONF = YES
 
 # Whenever updating Erlang, this value should be updated as well, to the
 # value of EI_VSN in the file lib/erl_interface/vsn.mk
-ERLANG_EI_VSN = 3.10.1
+ERLANG_EI_VSN = 3.10.3
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
-- 
2.17.1
