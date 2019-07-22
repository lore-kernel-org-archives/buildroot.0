From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 Jul 2019 18:12:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/samba4: bump version to 4.10.6
In-Reply-To: <20190722161213.1538-1-bernd.kuhls@t-online.de>
References: <20190722161213.1538-1-bernd.kuhls@t-online.de>
Message-ID: <20190722161213.1538-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.10.6.html

Updated and rebased patch 0002, added various cross-compile patches.

Added python3 support:
https://www.samba.org/samba/history/samba-4.10.0.html
"Samba 4.10 still has support for Python 2, however, Python 3 will be
 used by default, i.e. 'configure' & 'make' will execute using python3."

Renamed json configure option:
https://github.com/samba-team/samba/commit/c98f9971922342cbcfd2f55ca076835ba2305c63

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build-tested using python2 & python3, the andes-nds32 failure is related
to libffi:

BR2_PACKAGE_SAMBA4=y
BR2_PACKAGE_PYTHON3=y

                             andes-nds32 [ 1/44]: FAILED
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: SKIPPED
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
                             br-arm-full [ 9/44]: OK
                    br-arm-full-nothread [10/44]: SKIPPED
                      br-arm-full-static [11/44]: SKIPPED
                   br-i386-pentium4-full [12/44]: OK
                br-i386-pentium-mmx-musl [13/44]: SKIPPED
                       br-m68k-5208-full [14/44]: SKIPPED
                      br-m68k-68040-full [15/44]: SKIPPED
                    br-microblazeel-full [16/44]: OK
                 br-mips32r6-el-hf-glibc [17/44]: OK
                      br-mips64-n64-full [18/44]: OK
                 br-mips64r6-el-hf-glibc [19/44]: OK
                      br-mipsel-o32-full [20/44]: OK
                          br-nios2-glibc [21/44]: SKIPPED
                      br-openrisc-uclibc [22/44]: OK
               br-powerpc-603e-basic-cpp [23/44]: SKIPPED
             br-powerpc64le-power8-glibc [24/44]: OK
               br-powerpc64-power7-glibc [25/44]: OK
                  br-powerpc-e500mc-full [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                        br-sparc64-glibc [30/44]: OK
                         br-sparc-uclibc [31/44]: SKIPPED
                    br-x86-64-core2-full [32/44]: OK
                          br-x86-64-musl [33/44]: SKIPPED
                          br-xtensa-full [34/44]: OK
                       linaro-aarch64-be [35/44]: OK
                          linaro-aarch64 [36/44]: OK
                              linaro-arm [37/44]: OK
                     sourcery-arm-armv4t [38/44]: OK
                            sourcery-arm [39/44]: OK
                     sourcery-arm-thumb2 [40/44]: OK
                         sourcery-mips64 [41/44]: OK
                           sourcery-mips [42/44]: OK
                          sourcery-nios2 [43/44]: SKIPPED
                         sourcery-x86-64 [44/44]: OK
44 builds, 13 skipped, 1 build failed, 0 legal-info failed

BR2_PACKAGE_SAMBA4=y
BR2_PACKAGE_PYTHON=y

                             andes-nds32 [ 1/44]: FAILED
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: SKIPPED
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
                             br-arm-full [ 9/44]: OK
                    br-arm-full-nothread [10/44]: SKIPPED
                      br-arm-full-static [11/44]: SKIPPED
                   br-i386-pentium4-full [12/44]: OK
                br-i386-pentium-mmx-musl [13/44]: SKIPPED
                       br-m68k-5208-full [14/44]: SKIPPED
                      br-m68k-68040-full [15/44]: SKIPPED
                    br-microblazeel-full [16/44]: OK
                 br-mips32r6-el-hf-glibc [17/44]: OK
                      br-mips64-n64-full [18/44]: OK
                 br-mips64r6-el-hf-glibc [19/44]: OK
                      br-mipsel-o32-full [20/44]: OK
                          br-nios2-glibc [21/44]: SKIPPED
                      br-openrisc-uclibc [22/44]: OK
               br-powerpc-603e-basic-cpp [23/44]: SKIPPED
             br-powerpc64le-power8-glibc [24/44]: OK
               br-powerpc64-power7-glibc [25/44]: OK
                  br-powerpc-e500mc-full [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                        br-sparc64-glibc [30/44]: OK
                         br-sparc-uclibc [31/44]: SKIPPED
                    br-x86-64-core2-full [32/44]: OK
                          br-x86-64-musl [33/44]: SKIPPED
                          br-xtensa-full [34/44]: OK
                       linaro-aarch64-be [35/44]: OK
                          linaro-aarch64 [36/44]: OK
                              linaro-arm [37/44]: OK
                     sourcery-arm-armv4t [38/44]: OK
                            sourcery-arm [39/44]: OK
                     sourcery-arm-thumb2 [40/44]: OK
                         sourcery-mips64 [41/44]: OK
                           sourcery-mips [42/44]: OK
                          sourcery-nios2 [43/44]: SKIPPED
                         sourcery-x86-64 [44/44]: OK
44 builds, 13 skipped, 1 build failed, 0 legal-info failed

 ...-on-64bit-platforms-by-including-std.patch | 80 +++++-----------
 package/samba4/0004-cross_compile-fix.patch   | 94 +++++++++++++++++++
 .../0005-disable_gnutls_build_fix.patch       | 37 ++++++++
 package/samba4/0006-fix_unistd_incl.patch     | 27 ++++++
 ...cript_build-do-not-add-host-include-.patch | 31 ++++++
 package/samba4/Config.in                      |  2 +-
 package/samba4/samba4.hash                    |  4 +-
 package/samba4/samba4.mk                      | 28 ++++--
 8 files changed, 233 insertions(+), 70 deletions(-)
 create mode 100644 package/samba4/0004-cross_compile-fix.patch
 create mode 100644 package/samba4/0005-disable_gnutls_build_fix.patch
 create mode 100644 package/samba4/0006-fix_unistd_incl.patch
 create mode 100644 package/samba4/0007-heimdal_build-wscript_build-do-not-add-host-include-.patch

diff --git a/package/samba4/0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch b/package/samba4/0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
index c1418bd885..450f8a2ce4 100644
--- a/package/samba4/0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
+++ b/package/samba4/0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
@@ -1,4 +1,4 @@
-From 5627ea3826a00c149ff3d49c40706217043a014d Mon Sep 17 00:00:00 2001
+From e3e9755989b158b2497d2c449db445cf7f93de56 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sun, 28 Jan 2018 11:57:11 +0100
 Subject: [PATCH] Fix uClibc build on 64bit platforms by including stdint.h
@@ -22,23 +22,20 @@ https://lists.samba.org/archive/samba-technical/2018-January/125306.html
 
 [updated for samba-4.8.4, v2 sent upstream
  https://lists.samba.org/archive/samba-technical/2018-August/129732.html,
- updated for samba-4.9.1]
+ updated for samba-4.9.1 & 4.10.6]
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- lib/ldb/tests/ldb_kv_ops_test.c   | 1 +
- lib/ldb/tests/ldb_mod_op_test.c   | 1 +
- lib/ldb/tests/ldb_msg.c           | 1 +
- lib/ldb/tests/ldb_tdb_test.c      | 1 +
- lib/ldb/tests/test_ldb_qsort.c    | 1 +
- lib/util/tests/test_ms_fnmatch.c  | 1 +
- libcli/auth/tests/ntlm_check.c    | 1 +
- libcli/smb/test_smb1cli_session.c | 1 +
- source3/lib/test_tldap.c          | 1 +
- 9 files changed, 9 insertions(+)
+ lib/ldb/tests/ldb_kv_ops_test.c  | 1 +
+ lib/ldb/tests/ldb_tdb_test.c     | 1 +
+ lib/ldb/tests/test_ldb_dn.c      | 1 +
+ lib/ldb/tests/test_ldb_qsort.c   | 1 +
+ lib/util/tests/test_ms_fnmatch.c | 1 +
+ source3/lib/test_tldap.c         | 1 +
+ 6 files changed, 6 insertions(+)
 
 diff --git a/lib/ldb/tests/ldb_kv_ops_test.c b/lib/ldb/tests/ldb_kv_ops_test.c
-index 30ce019fac8..3ac7763b307 100644
+index d6a4dc058e5..8b230200cba 100644
 --- a/lib/ldb/tests/ldb_kv_ops_test.c
 +++ b/lib/ldb/tests/ldb_kv_ops_test.c
 @@ -46,6 +46,7 @@
@@ -49,11 +46,11 @@ index 30ce019fac8..3ac7763b307 100644
  #include <setjmp.h>
  #include <cmocka.h>
  
-diff --git a/lib/ldb/tests/ldb_mod_op_test.c b/lib/ldb/tests/ldb_mod_op_test.c
-index 01667af3865..a1a20d38f28 100644
---- a/lib/ldb/tests/ldb_mod_op_test.c
-+++ b/lib/ldb/tests/ldb_mod_op_test.c
-@@ -13,6 +13,7 @@
+diff --git a/lib/ldb/tests/ldb_tdb_test.c b/lib/ldb/tests/ldb_tdb_test.c
+index 8418dbfd671..ef91ba54756 100644
+--- a/lib/ldb/tests/ldb_tdb_test.c
++++ b/lib/ldb/tests/ldb_tdb_test.c
+@@ -40,6 +40,7 @@
   */
  #include <stdarg.h>
  #include <stddef.h>
@@ -61,24 +58,12 @@ index 01667af3865..a1a20d38f28 100644
  #include <setjmp.h>
  #include <cmocka.h>
  
-diff --git a/lib/ldb/tests/ldb_msg.c b/lib/ldb/tests/ldb_msg.c
-index f8de418e0dc..31786a9a318 100644
---- a/lib/ldb/tests/ldb_msg.c
-+++ b/lib/ldb/tests/ldb_msg.c
-@@ -13,6 +13,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
+diff --git a/lib/ldb/tests/test_ldb_dn.c b/lib/ldb/tests/test_ldb_dn.c
+index 4965dcef575..37eeedc1d70 100644
+--- a/lib/ldb/tests/test_ldb_dn.c
++++ b/lib/ldb/tests/test_ldb_dn.c
+@@ -19,6 +19,7 @@
  
-diff --git a/lib/ldb/tests/ldb_tdb_test.c b/lib/ldb/tests/ldb_tdb_test.c
-index 686a35104ea..2e312e60a3c 100644
---- a/lib/ldb/tests/ldb_tdb_test.c
-+++ b/lib/ldb/tests/ldb_tdb_test.c
-@@ -40,6 +40,7 @@
-  */
  #include <stdarg.h>
  #include <stddef.h>
 +#include <stdint.h>
@@ -109,29 +94,6 @@ index 7fe8ed05e28..d11c7bed4be 100644
  #include <setjmp.h>
  #include <cmocka.h>
  
-diff --git a/libcli/auth/tests/ntlm_check.c b/libcli/auth/tests/ntlm_check.c
-index e87a0a276d4..65c7b086008 100644
---- a/libcli/auth/tests/ntlm_check.c
-+++ b/libcli/auth/tests/ntlm_check.c
-@@ -40,6 +40,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/libcli/smb/test_smb1cli_session.c b/libcli/smb/test_smb1cli_session.c
-index d1e21d5431e..6a526c96b61 100644
---- a/libcli/smb/test_smb1cli_session.c
-+++ b/libcli/smb/test_smb1cli_session.c
-@@ -1,5 +1,6 @@
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
 diff --git a/source3/lib/test_tldap.c b/source3/lib/test_tldap.c
 index a6c2f2117cb..659c5a7371a 100644
 --- a/source3/lib/test_tldap.c
@@ -145,5 +107,5 @@ index a6c2f2117cb..659c5a7371a 100644
  #include <cmocka.h>
  
 -- 
-2.19.0
+2.20.1
 
diff --git a/package/samba4/0004-cross_compile-fix.patch b/package/samba4/0004-cross_compile-fix.patch
new file mode 100644
index 0000000000..45655a9c4c
--- /dev/null
+++ b/package/samba4/0004-cross_compile-fix.patch
@@ -0,0 +1,94 @@
+From a197e0cafb276a9b732f914b1f679ebb487b47f1 Mon Sep 17 00:00:00 2001
+From: pinglin <pinglin@synology.com>
+Date: Tue, 19 Mar 2019 20:46:27 +0800
+Subject: [PATCH] cross_compile argument doesn't apply
+
+reproduce:
+	./configure --cross-compile --cross-answers=XXX
+
+The output log now will show correct cross-answers.
+
+Downloaded from
+https://github.com/openwrt/packages/blob/master/net/samba4/patches/003-samba-4-10-cross_compile-fix.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ third_party/waf/waflib/Context.py        | 20 ++++++++++++++++++--
+ third_party/waf/waflib/Tools/c_config.py | 11 +++++++----
+ 2 files changed, 25 insertions(+), 6 deletions(-)
+
+diff --git a/third_party/waf/waflib/Context.py b/third_party/waf/waflib/Context.py
+index 3222fb1551c..d1c87512095 100644
+--- a/third_party/waf/waflib/Context.py
++++ b/third_party/waf/waflib/Context.py
+@@ -359,8 +359,16 @@ class Context(ctx):
+ 
+ 		encoding = kw.pop('decode_as', default_encoding)
+ 
++		exec_args = kw.pop('exec_args', [])
++		if isinstance(cmd, str):
++			cmd = [cmd] + exec_args
++		elif isinstance(cmd, list):
++			cmd = cmd + exec_args
+ 		try:
+-			ret, out, err = Utils.run_process(cmd, kw, cargs)
++			if exec_args:
++				ret, out, err = Utils.run_regular_process(cmd, kw, cargs)
++			else:
++				ret, out, err = Utils.run_process(cmd, kw, cargs)
+ 		except Exception as e:
+ 			raise Errors.WafError('Execution failure: %s' % str(e), ex=e)
+ 
+@@ -438,8 +446,16 @@ class Context(ctx):
+ 
+ 		encoding = kw.pop('decode_as', default_encoding)
+ 
++		exec_args = kw.pop('exec_args', [])
++		if isinstance(cmd, str):
++			cmd = [cmd] + exec_args
++		elif isinstance(cmd, list):
++			cmd = cmd + exec_args
+ 		try:
+-			ret, out, err = Utils.run_process(cmd, kw, cargs)
++			if exec_args:
++				ret, out, err = Utils.run_regular_process(cmd, kw, cargs)
++			else:
++				ret, out, err = Utils.run_process(cmd, kw, cargs)
+ 		except Exception as e:
+ 			raise Errors.WafError('Execution failure: %s' % str(e), ex=e)
+ 
+diff --git a/third_party/waf/waflib/Tools/c_config.py b/third_party/waf/waflib/Tools/c_config.py
+index 76082152cd9..25e468b0844 100644
+--- a/third_party/waf/waflib/Tools/c_config.py
++++ b/third_party/waf/waflib/Tools/c_config.py
+@@ -660,20 +660,23 @@ class test_exec(Task.Task):
+ 	"""
+ 	color = 'PINK'
+ 	def run(self):
++		exec_args = Utils.to_list(self.generator.exec_args)
++
+ 		if getattr(self.generator, 'rpath', None):
+ 			if getattr(self.generator, 'define_ret', False):
+-				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()])
++				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], exec_args=exec_args)
+ 			else:
+-				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()])
++				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], exec_args=exec_args)
+ 		else:
+ 			env = self.env.env or {}
+ 			env.update(dict(os.environ))
+ 			for var in ('LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH', 'PATH'):
+ 				env[var] = self.inputs[0].parent.abspath() + os.path.pathsep + env.get(var, '')
++
+ 			if getattr(self.generator, 'define_ret', False):
+-				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], env=env)
++				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], env=env, exec_args=exec_args)
+ 			else:
+-				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], env=env)
++				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], env=env, exec_args=exec_args)
+ 
+ @feature('test_exec')
+ @after_method('apply_link')
+-- 
+2.17.1
+
diff --git a/package/samba4/0005-disable_gnutls_build_fix.patch b/package/samba4/0005-disable_gnutls_build_fix.patch
new file mode 100644
index 0000000000..5ea0f26124
--- /dev/null
+++ b/package/samba4/0005-disable_gnutls_build_fix.patch
@@ -0,0 +1,37 @@
+From 41eeabcb0175659aebf6d480c43fb64310f37d9c Mon Sep 17 00:00:00 2001
+From: Andrew Bartlett <abartlet@samba.org>
+Date: Wed, 20 Mar 2019 13:57:50 +1300
+Subject: [PATCH] build: Allow build when --disable-gnutls is set
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13844
+
+Signed-off-by: Andrew Bartlett <abartlet@samba.org>
+
+Downloaded from
+https://github.com/openwrt/packages/blob/master/net/samba4/patches/005-samba-4.10-disable_gnutls_build_fix.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ lib/mscat/wscript | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/mscat/wscript b/lib/mscat/wscript
+index 7ca9ef567ee..4d1f752a3c1 100644
+--- a/lib/mscat/wscript
++++ b/lib/mscat/wscript
+@@ -12,7 +12,11 @@ def configure(conf):
+         if not conf.find_program('asn1Parser', var='ASN1PARSER'):
+             Logs.warn('WARNING: ans1Parser hasn\'t been found! Please install it (e.g. libtasn1-bin)')
+ 
+-    conf.CHECK_FUNCS_IN('gnutls_pkcs7_get_embedded_data_oid', 'gnutls')
++    # GnuTLS is currently able to be disabled
++    if conf.env.enable_gnutls:
++        conf.CHECK_FUNCS_IN('gnutls_pkcs7_get_embedded_data_oid', 'gnutls')
++    else:
++        Logs.warn('WARNING: gnutls disabled so dumpmscat will not be built')
+ 
+ def build(bld):
+     if (bld.CONFIG_SET('HAVE_LIBTASN1') and
+-- 
+2.11.0
+
diff --git a/package/samba4/0006-fix_unistd_incl.patch b/package/samba4/0006-fix_unistd_incl.patch
new file mode 100644
index 0000000000..80467fadf6
--- /dev/null
+++ b/package/samba4/0006-fix_unistd_incl.patch
@@ -0,0 +1,27 @@
+Fix unistd.h include
+
+Fixes build error
+
+source4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redeclared as different kind of symbol
+ static struct et_list link = { 0, 0 };
+
+Downloaded from
+https://github.com/openwrt/packages/blob/master/net/samba4/patches/006-samba-4-10-musl_rm_unistd_incl.patch
+
+Upstream bug report: https://bugzilla.samba.org/show_bug.cgi?id=13856
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/lib/replace/replace.h
++++ b/lib/replace/replace.h
+@@ -162,10 +162,6 @@
+ #include <bsd/unistd.h>
+ #endif
+ 
+-#ifdef HAVE_UNISTD_H
+-#include <unistd.h>
+-#endif
+-
+ #ifdef HAVE_STRING_H
+ #include <string.h>
+ #endif
diff --git a/package/samba4/0007-heimdal_build-wscript_build-do-not-add-host-include-.patch b/package/samba4/0007-heimdal_build-wscript_build-do-not-add-host-include-.patch
new file mode 100644
index 0000000000..08d8382ab0
--- /dev/null
+++ b/package/samba4/0007-heimdal_build-wscript_build-do-not-add-host-include-.patch
@@ -0,0 +1,31 @@
+From 189440643157fbc872a1670b3e30b6c459dbd930 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 21 Jul 2019 15:12:03 +0200
+Subject: [PATCH] heimdal_build/wscript_build: do not add host include
+ patch
+
+Fixes cross-compile.
+
+Upstream bug report: https://bugzilla.samba.org/show_bug.cgi?id=13856
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ source4/heimdal_build/wscript_build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source4/heimdal_build/wscript_build b/source4/heimdal_build/wscript_build
+index 45938b88315..e896c3e9454 100644
+--- a/source4/heimdal_build/wscript_build
++++ b/source4/heimdal_build/wscript_build
+@@ -131,7 +131,7 @@ def HEIMDAL_ASN1(name, source,
+             samba_cflags   = CURRENT_CFLAGS(bld, name, ''),
+             depends_on     = '',
+             samba_deps     = to_list('roken replace'),
+-            samba_includes = includes + ["/usr/include/heimdal"],
++            samba_includes = includes,
+             local_include  = True)
+ 
+ 
+-- 
+2.20.1
+
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index f65cdc47b6..e89289b153 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_SAMBA4
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_ZLIB
 	help
 	  Provides secure, stable and fast file and print services
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 28cbe7d9b2..399fa28159 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.11.tar.asc
-sha256 bb736624d16f7369e395de2f15fec153b554f76f95864015b4ce1f2ae53e817b  samba-4.9.11.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.10.6.tar.asc
+sha256 9efbeb52db1203dc779b118f1c48c161e569f7a6af5101e745497ee6296eef42  samba-4.10.6.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3690dbd7c5..a6b353ad2d 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.11
+SAMBA4_VERSION = 4.10.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPL-3.0+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = \
-	host-e2fsprogs host-heimdal host-python host-nfs-utils \
-	cmocka e2fsprogs popt python zlib \
+	host-e2fsprogs host-heimdal host-nfs-utils \
+	cmocka e2fsprogs popt zlib \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
@@ -24,6 +24,18 @@ SAMBA4_CONF_ENV = \
 	LDFLAGS="$(SAMBA4_LDFLAGS)" \
 	XSLTPROC=false
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+SAMBA4_PYTHON = \
+	PYTHON="$(HOST_DIR)/bin/python3" \
+	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
+SAMBA4_DEPENDENCIES += host-python3 python3
+else
+SAMBA4_PYTHON = \
+	PYTHON="$(HOST_DIR)/bin/python2" \
+	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config"
+SAMBA4_DEPENDENCIES += host-python python
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 SAMBA4_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 SAMBA4_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
@@ -97,7 +109,7 @@ define SAMBA4_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt;
 	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
 	(cd $(@D); \
-		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config" \
+		$(SAMBA4_PYTHON) \
 		python_LDFLAGS="" \
 		python_LIBDIR="" \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -126,21 +138,21 @@ define SAMBA4_CONFIGURE_CMDS
 endef
 
 define SAMBA4_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(SAMBA4_PYTHON) $(MAKE) -C $(@D)
 endef
 
 define SAMBA4_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(SAMBA4_PYTHON) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define SAMBA4_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(SAMBA4_PYTHON) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),y)
 SAMBA4_DEPENDENCIES += jansson
 else
-SAMBA4_CONF_OPTS += --without-ad-dc --without-json-audit
+SAMBA4_CONF_OPTS += --without-ad-dc --without-json
 endif
 
 ifeq ($(BR2_PACKAGE_SAMBA4_ADS),y)
-- 
2.20.1
