From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Apr 2016 12:42:46 +0200
Subject: [Buildroot] [git commit] elf2flt: use new upstream site and bump
	version
Message-ID: <20160416104442.C4CC0802FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97354fd229aa62a4174b0a93f28951edde6cc0f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The uClinux developers now have a Github with elf2flt code, with an
upstream that is again active. Let's switch to this upstream, which
has built-in support for ARM noMMU, contributed by Waldemar.

Since we're now fetching from github, a hash file is added as well.

Finally, we disable -Werror to avoid build issues caused by warnings.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elf2flt/elf2flt.hash | 2 ++
 package/elf2flt/elf2flt.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
new file mode 100644
index 0000000..be7c776
--- /dev/null
+++ b/package/elf2flt/elf2flt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 64ede6936aa88028378e08192039c29791b9e32714cc861762214b8e106e7145 elf2flt-8a3e74446fe7d866f0517ee089a37f4bdf4bc9f7.tar.gz
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index bec270b..6c16c30 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = f859213b18a67fcfc09961267e0a1122d35186f4
-ELF2FLT_SITE = http://cgit.openadk.org/cgi/cgit/elf2flt.git
-ELF2FLT_SITE_METHOD = git
+ELF2FLT_VERSION = 8a3e74446fe7d866f0517ee089a37f4bdf4bc9f7
+ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPLv2+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
 
@@ -19,7 +18,8 @@ HOST_ELF2FLT_CONF_OPTS = \
 	--with-binutils-include-dir=$(HOST_BINUTILS_DIR)/include/ \
 	--with-libbfd=$(HOST_BINUTILS_DIR)/bfd/libbfd.a \
 	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
-	--target=$(GNU_TARGET_NAME)
+	--target=$(GNU_TARGET_NAME) \
+	--disable-werror
 
 HOST_ELF2FLT_LIBS = -lz
 
