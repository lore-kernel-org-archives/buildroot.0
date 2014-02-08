From: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
Date: Sat,  8 Feb 2014 15:34:21 +0100
Subject: [Buildroot] [PATCH] samba4: add cross answers for x86_64
Message-ID: <1391870061-6503-1-git-send-email-cvubrugier@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
---
 package/samba/Config.in               |  2 +-
 package/samba/samba4/x86_64-cache.txt | 65 +++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 package/samba/samba4/x86_64-cache.txt

diff --git a/package/samba/Config.in b/package/samba/Config.in
index e037dd9..42d33c5 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -31,7 +31,7 @@ choice
 	depends on BR2_USE_WCHAR # e2fsprogs
 	depends on BR2_LARGEFILE
 	# Supported architectures only limited by the cached answers
-	depends on BR2_arm || BR2_powerpc
+	depends on BR2_arm || BR2_powerpc || BR2_x86_64
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_PYTHON
diff --git a/package/samba/samba4/x86_64-cache.txt b/package/samba/samba4/x86_64-cache.txt
new file mode 100644
index 0000000..6c98cfe
--- /dev/null
+++ b/package/samba/samba4/x86_64-cache.txt
@@ -0,0 +1,65 @@
+Checking simple C program: OK
+rpath library support: OK
+-Wl,--version-script support: OK
+Checking getconf LFS_CFLAGS: NO
+Checking for large file support without additional flags: OK
+Checking for -D_LARGE_FILES: OK
+Checking correct behavior of strtoll: NO
+Checking for working strptime: OK
+Checking for C99 vsnprintf: OK
+Checking for HAVE_SHARED_MMAP: OK
+Checking for HAVE_MREMAP: OK
+Checking for HAVE_INCOHERENT_MMAP: NO
+Checking for HAVE_SECURE_MKSTEMP: OK
+Checking for HAVE_IFACE_GETIFADDRS: OK
+Checking for HAVE_LITTLE_ENDIAN - runtime: OK
+Checking for HAVE_BIG_ENDIAN - runtime: NO
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking whether blkcnt_t is 32 bit: NO
+Checking whether blkcnt_t is 64 bit: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
+Checking whether we can use Linux thread-specific credentials: OK
+Checking whether setreuid is available: OK
+Checking whether setresuid is available: OK
+Checking whether seteuid is available: OK
+Checking whether fcntl locking is available: OK
+Checking for the maximum value of the 'time_t' type: OK
+Checking whether the realpath function allows a NULL argument: OK
+Checking whether POSIX capabilities are available: OK
+Checking for ftruncate extend: OK
+getcwd takes a NULL argument: OK
+Checking uname sysname type: "Linux"
+Checking uname machine type: "x86_64"
+Checking uname release type: "3.0.0"
+Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013"
+Checking for WORDS_BIGENDIAN: NO
+Checking size of bool: "1"
+Checking size of char: "1"
+Checking size of int: "4"
+Checking size of long long: "8"
+Checking size of long: "8"
+Checking size of short: "2"
+Checking size of size_t: "8"
+Checking size of ssize_t: "8"
+Checking size of int8_t: "1"
+Checking size of uint8_t: "1"
+Checking size of int16_t: "2"
+Checking size of uint16_t: "2"
+Checking size of int32_t: "4"
+Checking size of uint32_t: "4"
+Checking size of int64_t: "8"
+Checking size of uint64_t: "8"
+Checking size of void*: "8"
+Checking size of off_t: "8"
+Checking size of dev_t: "8"
+Checking size of ino_t: "8"
+Checking size of time_t: "8"
+Checking size of ((struct utmp *)NULL)->ut_line: "32"
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
-- 
1.9.rc1
