From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Sep 2016 22:12:10 -0300
Subject: [Buildroot] [PATCH] gcc: bump 6.x series to 6.2.0
Message-ID: <1473124330-1745-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adjust some patches to avoid patching the ChangeLog which isn't quite
the same.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/{6.1.0 => 6.2.0}/100-uclibc-conf.patch   |  0
 .../{6.1.0 => 6.2.0}/301-missing-execinfo_h.patch    |  0
 .../{6.1.0 => 6.2.0}/810-arm-softfloat-libgcc.patch  |  0
 .../{6.1.0 => 6.2.0}/830-arm_unbreak_armv4t.patch    |  0
 package/gcc/{6.1.0 => 6.2.0}/860-cilk-wchar.patch    |  0
 .../gcc/{6.1.0 => 6.2.0}/890-fix-m68k-compile.patch  |  0
 .../gcc/{6.1.0 => 6.2.0}/891-fix-m68k-uclinux.patch  |  0
 ...libgcc-mkmap-symver-support-skip_underscore.patch | 16 +---------------
 ...nfig-bfin-use-the-generic-linker-version-in.patch | 20 +-------------------
 ...cc-fix-DWARF-compilation-with-FDPIC-targets.patch | 16 +---------------
 .../940-uclinux-enable-threads.patch                 |  0
 package/gcc/Config.in.host                           |  2 +-
 package/gcc/gcc.hash                                 |  4 ++--
 13 files changed, 6 insertions(+), 52 deletions(-)
 rename package/gcc/{6.1.0 => 6.2.0}/100-uclibc-conf.patch (100%)
 rename package/gcc/{6.1.0 => 6.2.0}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{6.1.0 => 6.2.0}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{6.1.0 => 6.2.0}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{6.1.0 => 6.2.0}/860-cilk-wchar.patch (100%)
 rename package/gcc/{6.1.0 => 6.2.0}/890-fix-m68k-compile.patch (100%)
 rename package/gcc/{6.1.0 => 6.2.0}/891-fix-m68k-uclinux.patch (100%)
 rename package/gcc/{6.1.0 => 6.2.0}/892-libgcc-mkmap-symver-support-skip_underscore.patch (83%)
 rename package/gcc/{6.1.0 => 6.2.0}/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch (98%)
 rename package/gcc/{6.1.0 => 6.2.0}/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch (82%)
 rename package/gcc/{6.1.0 => 6.2.0}/940-uclinux-enable-threads.patch (100%)

diff --git a/package/gcc/6.1.0/100-uclibc-conf.patch b/package/gcc/6.2.0/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/6.1.0/100-uclibc-conf.patch
rename to package/gcc/6.2.0/100-uclibc-conf.patch
diff --git a/package/gcc/6.1.0/301-missing-execinfo_h.patch b/package/gcc/6.2.0/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/6.1.0/301-missing-execinfo_h.patch
rename to package/gcc/6.2.0/301-missing-execinfo_h.patch
diff --git a/package/gcc/6.1.0/810-arm-softfloat-libgcc.patch b/package/gcc/6.2.0/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/6.1.0/810-arm-softfloat-libgcc.patch
rename to package/gcc/6.2.0/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/6.1.0/830-arm_unbreak_armv4t.patch b/package/gcc/6.2.0/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/6.1.0/830-arm_unbreak_armv4t.patch
rename to package/gcc/6.2.0/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/6.1.0/860-cilk-wchar.patch b/package/gcc/6.2.0/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/6.1.0/860-cilk-wchar.patch
rename to package/gcc/6.2.0/860-cilk-wchar.patch
diff --git a/package/gcc/6.1.0/890-fix-m68k-compile.patch b/package/gcc/6.2.0/890-fix-m68k-compile.patch
similarity index 100%
rename from package/gcc/6.1.0/890-fix-m68k-compile.patch
rename to package/gcc/6.2.0/890-fix-m68k-compile.patch
diff --git a/package/gcc/6.1.0/891-fix-m68k-uclinux.patch b/package/gcc/6.2.0/891-fix-m68k-uclinux.patch
similarity index 100%
rename from package/gcc/6.1.0/891-fix-m68k-uclinux.patch
rename to package/gcc/6.2.0/891-fix-m68k-uclinux.patch
diff --git a/package/gcc/6.1.0/892-libgcc-mkmap-symver-support-skip_underscore.patch b/package/gcc/6.2.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
similarity index 83%
rename from package/gcc/6.1.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
rename to package/gcc/6.2.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
index 1f779ed..73ee6c5 100644
--- a/package/gcc/6.1.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
+++ b/package/gcc/6.2.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
@@ -35,23 +35,9 @@ version information for Blackfin, instead of using a custom one.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- libgcc/ChangeLog        | 5 +++++
  libgcc/mkmap-symver.awk | 6 +++++-
- 2 files changed, 10 insertions(+), 1 deletion(-)
+ 1 file changed, 5 insertions(+), 1 deletion(-)
 
-diff --git a/libgcc/ChangeLog b/libgcc/ChangeLog
-index 6559564..129e43f 100644
---- a/libgcc/ChangeLog
-+++ b/libgcc/ChangeLog
-@@ -1,3 +1,8 @@
-+2016-08-19  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-+
-+	PR gcc/74748
-+	* libgcc/mkmap-symver.awk: add support for skip_underscore
-+
- 2016-04-27  Release Manager
- 
- 	* GCC 6.1.0 released.
 diff --git a/libgcc/mkmap-symver.awk b/libgcc/mkmap-symver.awk
 index 266832a..30bb179 100644
 --- a/libgcc/mkmap-symver.awk
diff --git a/package/gcc/6.1.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch b/package/gcc/6.2.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
similarity index 98%
rename from package/gcc/6.1.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
rename to package/gcc/6.2.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
index 8db50b5..454295d 100644
--- a/package/gcc/6.1.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
+++ b/package/gcc/6.2.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
@@ -22,28 +22,10 @@ symbols in libgcc, and therefore all libgcc symbols were marked as
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- libgcc/ChangeLog                    |    6 +
  libgcc/config/bfin/libgcc-glibc.ver | 1894 +----------------------------------
  libgcc/config/bfin/t-linux          |    3 +-
- 3 files changed, 10 insertions(+), 1893 deletions(-)
+ 2 files changed, 4 insertions(+), 1893 deletions(-)
 
-diff --git a/libgcc/ChangeLog b/libgcc/ChangeLog
-index 129e43f..36c0194 100644
---- a/libgcc/ChangeLog
-+++ b/libgcc/ChangeLog
-@@ -1,6 +1,12 @@
- 2016-08-19  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
- 
- 	PR gcc/74748
-+	* libgcc/config/bfin/libgcc-glibc.ver, libgcc/config/bfin/t-linux:
-+	use generic linker version information on Blackfin.
-+
-+2016-08-19  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-+
-+	PR gcc/74748
- 	* libgcc/mkmap-symver.awk: add support for skip_underscore
- 
- 2016-04-27  Release Manager
 diff --git a/libgcc/config/bfin/libgcc-glibc.ver b/libgcc/config/bfin/libgcc-glibc.ver
 index b1bd2df..2af3df7 100644
 --- a/libgcc/config/bfin/libgcc-glibc.ver
diff --git a/package/gcc/6.1.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch b/package/gcc/6.2.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
similarity index 82%
rename from package/gcc/6.1.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
rename to package/gcc/6.2.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
index cf3f2b8..ce49de7 100644
--- a/package/gcc/6.1.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
+++ b/package/gcc/6.2.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
@@ -17,23 +17,9 @@ Fixes PR gcc/68468.
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- libgcc/ChangeLog            | 5 +++++
  libgcc/unwind-dw2-fde-dip.c | 8 ++++++--
- 2 files changed, 11 insertions(+), 2 deletions(-)
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
-diff --git a/libgcc/ChangeLog b/libgcc/ChangeLog
-index 36c0194..2e78d20 100644
---- a/libgcc/ChangeLog
-+++ b/libgcc/ChangeLog
-@@ -1,3 +1,8 @@
-+2016-08-19  Waldemar Brodkorb <wbx@openadk.org>
-+
-+	PR gcc/68468
-+	* libgcc/unwind-dw2-fde-dip.c: fix build on FDPIC targets.
-+
- 2016-08-19  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
- 
- 	PR gcc/74748
 diff --git a/libgcc/unwind-dw2-fde-dip.c b/libgcc/unwind-dw2-fde-dip.c
 index f7a1c3f..801bce8 100644
 --- a/libgcc/unwind-dw2-fde-dip.c
diff --git a/package/gcc/6.1.0/940-uclinux-enable-threads.patch b/package/gcc/6.2.0/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/6.1.0/940-uclinux-enable-threads.patch
rename to package/gcc/6.2.0/940-uclinux-enable-threads.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0e2c1a7..d470710 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -120,7 +120,7 @@ config BR2_GCC_VERSION
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
-	default "6.1.0" if BR2_GCC_VERSION_6_X
+	default "6.2.0"     if BR2_GCC_VERSION_6_X
 	default "arc-2016.09-eng011" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index a18d1dd..e55adf0 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,8 +8,8 @@ sha512  47fdfeca0c0a624cdec9c4ae47137d056c918d5c386d4b96985bb3c8172aba377cb66cbc
 sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683fd2ebf707d1d51c059fad2161fe42d110c330027f40214b7db0f3efe  gcc-4.9.4.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.4.0/sha512.sum
 sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d1ef16ea39def408a644ba48f97519ec7a7dd37d260c3e9423514265b  gcc-5.4.0.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.1.0/sha512.sum
-sha512  eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e  gcc-6.1.0.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.2.0/sha512.sum
+sha512  1e8b826a3d44b9d5899309894e20c03abeb352bf3d273b8ad63af814c0ee2911f1a83ce1cd4cdd2d1cb0b3e3c34e9b7ae1b2ab83dfc649ee817ab05247c76198  gcc-6.2.0.tar.bz2
 
 # Locally calculated (fetched from Github)
 sha512  5fa11058adc0fc3d33bb860151660101bc20c7147cd92bc235057cd722e7fdb923ac0bdf27b09499b8587abb0c420867229bd782bc10bee0c76116c099b5a76c  gcc-arc-2016.09-eng011.tar.gz
-- 
2.7.3
