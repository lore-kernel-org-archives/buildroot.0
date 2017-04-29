From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 14:25:33 +0200
Subject: [Buildroot] [git commit] package/uclibc: enable wordexp
	functionality
Message-ID: <20170429122612.0D402826C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85b8a8ab9811144f0d65df9f064235c60ea15dee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wordexp support is needed by more and more packages, recently
bluez5_utils. It adds only ~16 KB to uClibc, so let's add it by default
to keep things simple.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: rework commit message.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uClibc-ng.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 6780ad6..f0a876f 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -30,6 +30,7 @@ UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
+UCLIBC_HAS_WORDEXP=y
 UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GNU_GLOB=y
