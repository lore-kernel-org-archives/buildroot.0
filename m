From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 3 Oct 2015 13:01:45 +0100
Subject: [Buildroot] [PATCH 1/2] libnspr: bump to version 4.10.9
In-Reply-To: <1443872329-31417-1-git-send-email-gustavo@zacarias.com.ar>
References: <1443872329-31417-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <560FC3A9.3000207@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 03/10/15 12:38, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/lib/libnspr4.so
output/target/usr/lib/libnspr4.so: ELF 32-bit MSB shared object, MIPS, 
MIPS32 rel2 version 1 (SYSV), dynamically linked, with unknown 
capability 0x41000000 = 0xf676e75, with unknown capability 0x10000 = 
0x70401, stripped

$ grep ^LIBNSPR_VERSION package/libnspr/libnspr.mk
LIBNSPR_VERSION = 4.10.9

Regards,

Vincent.

> ---
>   package/libnspr/0001-nios2.patch      | 22 +++++++++++-----------
>   package/libnspr/0002-microblaze.patch | 25 ++++++++++++++-----------
>   package/libnspr/libnspr.hash          |  4 ++--
>   package/libnspr/libnspr.mk            |  2 +-
>   4 files changed, 28 insertions(+), 25 deletions(-)
>
> diff --git a/package/libnspr/0001-nios2.patch b/package/libnspr/0001-nios2.patch
> index 4fc6551..22cacd7 100644
> --- a/package/libnspr/0001-nios2.patch
> +++ b/package/libnspr/0001-nios2.patch
> @@ -1,12 +1,12 @@
>   Add Nios-II support
>
> -[Gustavo: update for nspr 4.10.6]
> +[Gustavo: update for nspr 4.10.9]
>   Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
> -diff -Nura nspr-4.10.6.orig/nspr/pr/include/md/_linux.cfg nspr-4.10.6/nspr/pr/include/md/_linux.cfg
> ---- nspr-4.10.6.orig/nspr/pr/include/md/_linux.cfg	2014-06-18 10:26:22.447502521 -0300
> -+++ nspr-4.10.6/nspr/pr/include/md/_linux.cfg	2014-06-18 10:26:32.746850581 -0300
> -@@ -924,6 +924,51 @@
> +diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.cfg nspr-4.10.9/nspr/pr/include/md/_linux.cfg
> +--- nspr-4.10.9.orig/nspr/pr/include/md/_linux.cfg	2015-10-03 08:11:43.229387215 -0300
> ++++ nspr-4.10.9/nspr/pr/include/md/_linux.cfg	2015-10-03 08:11:55.277798841 -0300
> +@@ -1017,6 +1017,51 @@
>    #define PR_BYTES_PER_WORD_LOG2   2
>    #define PR_BYTES_PER_DWORD_LOG2  3
>
> @@ -58,13 +58,13 @@ diff -Nura nspr-4.10.6.orig/nspr/pr/include/md/_linux.cfg nspr-4.10.6/nspr/pr/in
>    #else
>
>    #error "Unknown CPU architecture"
> -diff -Nura nspr-4.10.6.orig/nspr/pr/include/md/_linux.h nspr-4.10.6/nspr/pr/include/md/_linux.h
> ---- nspr-4.10.6.orig/nspr/pr/include/md/_linux.h	2014-06-18 10:26:22.446502487 -0300
> -+++ nspr-4.10.6/nspr/pr/include/md/_linux.h	2014-06-18 10:26:32.747850615 -0300
> -@@ -55,6 +55,8 @@
> - #define _PR_SI_ARCHITECTURE "avr32"
> - #elif defined(__m32r__)
> +diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.h nspr-4.10.9/nspr/pr/include/md/_linux.h
> +--- nspr-4.10.9.orig/nspr/pr/include/md/_linux.h	2015-10-03 08:11:43.229387215 -0300
> ++++ nspr-4.10.9/nspr/pr/include/md/_linux.h	2015-10-03 08:12:22.474728003 -0300
> +@@ -57,6 +57,8 @@
>    #define _PR_SI_ARCHITECTURE "m32r"
> + #elif defined(__or1k__)
> + #define _PR_SI_ARCHITECTURE "or1k"
>   +#elif defined(nios2)
>   +#define _PR_SI_ARCHITECTURE "nios2"
>    #else
> diff --git a/package/libnspr/0002-microblaze.patch b/package/libnspr/0002-microblaze.patch
> index 30b17f3..f1416e7 100644
> --- a/package/libnspr/0002-microblaze.patch
> +++ b/package/libnspr/0002-microblaze.patch
> @@ -1,12 +1,12 @@
>   Add Microblaze support
>
> -[Gustavo: update for nspr 4.10.6]
> +[Gustavo: update for nspr 4.10.9]
>   Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
>
> -diff -Nura nspr-4.10.6.nios2/nspr/pr/include/md/_linux.cfg nspr-4.10.6/nspr/pr/include/md/_linux.cfg
> ---- nspr-4.10.6.nios2/nspr/pr/include/md/_linux.cfg	2014-06-18 10:29:15.816361425 -0300
> -+++ nspr-4.10.6/nspr/pr/include/md/_linux.cfg	2014-06-18 10:26:59.908768508 -0300
> -@@ -969,6 +969,56 @@
> +diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.cfg nspr-4.10.9/nspr/pr/include/md/_linux.cfg
> +--- nspr-4.10.9.orig/nspr/pr/include/md/_linux.cfg	2015-10-03 08:13:11.845414714 -0300
> ++++ nspr-4.10.9/nspr/pr/include/md/_linux.cfg	2015-10-03 08:13:20.435708195 -0300
> +@@ -1062,6 +1062,56 @@
>    #define PR_BYTES_PER_WORD_LOG2   2
>    #define PR_BYTES_PER_DWORD_LOG2  3
>
> @@ -63,15 +63,18 @@ diff -Nura nspr-4.10.6.nios2/nspr/pr/include/md/_linux.cfg nspr-4.10.6/nspr/pr/i
>    #else
>
>    #error "Unknown CPU architecture"
> -diff -Nura nspr-4.10.6.nios2/nspr/pr/include/md/_linux.h nspr-4.10.6/nspr/pr/include/md/_linux.h
> ---- nspr-4.10.6.nios2/nspr/pr/include/md/_linux.h	2014-06-18 10:29:15.817361459 -0300
> -+++ nspr-4.10.6/nspr/pr/include/md/_linux.h	2014-06-18 10:26:59.909768537 -0300
> -@@ -55,6 +55,8 @@
> - #define _PR_SI_ARCHITECTURE "avr32"
> - #elif defined(__m32r__)
> +diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.h nspr-4.10.9/nspr/pr/include/md/_linux.h
> +--- nspr-4.10.9.orig/nspr/pr/include/md/_linux.h	2015-10-03 08:13:11.845414714 -0300
> ++++ nspr-4.10.9/nspr/pr/include/md/_linux.h	2015-10-03 08:14:53.351882603 -0300
> +@@ -57,8 +57,11 @@
>    #define _PR_SI_ARCHITECTURE "m32r"
> + #elif defined(__or1k__)
> + #define _PR_SI_ARCHITECTURE "or1k"
>   +#elif defined(__microblaze__)
>   +#define _PR_SI_ARCHITECTURE "microblaze"
>    #elif defined(nios2)
>    #define _PR_SI_ARCHITECTURE "nios2"
> ++#elif defined(nios2)
>    #else
> + #error "Unknown CPU architecture"
> + #endif
> diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
> index 632422f..36d17ae 100644
> --- a/package/libnspr/libnspr.hash
> +++ b/package/libnspr/libnspr.hash
> @@ -1,2 +1,2 @@
> -# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.10.8/src/SHA256SUMS
> -sha256	507ea57c525c0c524dae4857a642b4ef5c9d795518754c7f83422d22fe544a15	nspr-4.10.8.tar.gz
> +# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.10.9/src/SHA256SUMS
> +sha256	4112ff6ad91d32696ca0c6c3d4abef6367b5dc0127fa172fcb3c3ab81bb2d881	nspr-4.10.9.tar.gz
> diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
> index 752af87..bf65f0a 100644
> --- a/package/libnspr/libnspr.mk
> +++ b/package/libnspr/libnspr.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -LIBNSPR_VERSION = 4.10.8
> +LIBNSPR_VERSION = 4.10.9
>   LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
>   LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
>   LIBNSPR_SUBDIR = nspr
>
