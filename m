From: Mark Jackson <mpfj@mimc.co.uk>
Date: Tue, 06 Jan 2009 11:38:58 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <20081228160857.E48AE76D44@busybox.osuosl.org>
References: <20081228160857.E48AE76D44@busybox.osuosl.org>
Message-ID: <496342D2.3090705@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-12-28 16:08:57 +0000 (Sun, 28 Dec 2008)
> New Revision: 24578
> 
> Log:
> openssl: fix uclibc 0.9.30 build
> 
> Added:
>    trunk/buildroot/package/openssl/openssl-0.9.8g-uclibc-susv3-legacy.patch
> 
> 
> Changeset:
> Added: trunk/buildroot/package/openssl/openssl-0.9.8g-uclibc-susv3-legacy.patch
> ===================================================================
> --- trunk/buildroot/package/openssl/openssl-0.9.8g-uclibc-susv3-legacy.patch	                        (rev 0)
> +++ trunk/buildroot/package/openssl/openssl-0.9.8g-uclibc-susv3-legacy.patch	2008-12-28 16:08:57 UTC (rev 24578)
> @@ -0,0 +1,18 @@
> +sys/timeb.h / ftime are legacy, so don't enable them for uClibc 
> +---
> + apps/speed.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: openssl-0.9.8g/apps/speed.c
> +===================================================================
> +--- openssl-0.9.8g.orig/apps/speed.c
> ++++ openssl-0.9.8g/apps/speed.c
> +@@ -113,7 +113,7 @@
> + #elif !defined(OPENSSL_SYS_MSDOS) && !defined(OPENSSL_SYS_VXWORKS) && (!defined(OPENSSL_SYS_VMS) || defined(__DECC))
> + # define TIMES
> + #endif
> +-#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) /* FIXME */
> ++#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) && !defined(__UCLIBC__) /* FIXME */
> + # define TIMEB
> + #endif
> + 
> 

This patch fails when I make openssl.  Below is the make output and the 
rejects file.

What other info can I supply ?

Regards
Mark
---
$ make openssl-dirclean
$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:				Ok
CC clean:					Ok
CXX clean:					Ok
CPP clean:					Ok
CFLAGS clean:					Ok
INCLUDES clean:					Ok
CXXFLAGS clean:					Ok
which installed:				Ok
sed works:					Ok (/bin/sed)
GNU make version '3.81':			Ok
C compiler '/usr/bin/gcc'
C compiler version '4.3.2':			Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.3.2':			Ok
awk installed:					Ok
bash installed:					Ok
bison installed:				Ok
flex installed:					Ok
gettext installed:				Ok
makeinfo installed:				Ok
Build system dependencies:			Ok

rm -rf 
/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/mimc200/buildroot-config
mkdir -p /usr/local/dev/avr32/buildroot-cvs/project_build_avr32/mimc200
cp -dpRf package/config/buildroot-config 
/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/mimc200/buildroot-config
 >>> openssl 0.9.8g Downloading
 >>> openssl 0.9.8g Extracting
 >>> openssl 0.9.8g Patching libtool
 >>> openssl 0.9.8g Patching package/openssl

Applying openssl-0.9.8g-avr32-asm-optimizations.patch.avr32 using plaintext:
patching file apps/ca.c
patching file apps/Makefile
patching file apps/s_client.c
patching file apps/speed.c
patching file apps/s_server.c
patching file apps/s_time.c
patching file bench/dummy_rand.c
patching file bench/Makefile
patching file bench/speed-avr32.c
patching file Configure
patching file crypto/aes/asm/aes-avr32.S
patching file crypto/aes/Makefile
patching file crypto/asn1/t_x509.c
patching file crypto/asn1/x_info.c
patching file crypto/bio/bss_conn.c
patching file crypto/bio/Makefile
patching file crypto/bn/bn_asm.c
patching file crypto/bn/bn_div.c
patching file crypto/bn/bn_exp.c
patching file crypto/bn/bn_gcd.c
patching file crypto/bn/bn.h
patching file crypto/bn/bn_lcl.h
patching file crypto/bn/bn_lib.c
patching file crypto/conf/conf.h
patching file crypto/cryptlib.c
patching file crypto/des/asm/des-avr32.S
patching file crypto/des/asm/des_cbc.c
patching file crypto/des/des_locl.h
patching file crypto/des/Makefile
patching file crypto/des/spr.h
patching file crypto/dsa/dsa_depr.c
patching file crypto/ec/Makefile
patching file crypto/ecdh/ech_ossl.c
patching file crypto/ecdh/Makefile
patching file crypto/evp/Makefile
patching file crypto/Makefile
patching file crypto/o_dir.c
patching file crypto/opensslconf.h
patching file crypto/pem/pem.h
patching file crypto/rand/md_rand.c
patching file crypto/rand/rand_egd.c
patching file crypto/rand/rand_lib.c
patching file crypto/rand/rand_unix.c
patching file crypto/rsa/Makefile
patching file crypto/rsa/rsa_oaep.c
patching file crypto/rsa/rsa_pss.c
patching file crypto/ui/ui_openssl.c
patching file crypto/uid.c
patching file crypto/x509/x509.h
patching file crypto/x509v3/x509v3.h
patching file e_os2.h
patching file e_os.h
patching file ssl/bio_ssl.c
patching file ssl/Makefile
patching file test/Makefile

Applying openssl-0.9.8g-do-not-build-docs.patch using plaintext:
patching file Makefile.org
Hunk #1 succeeded at 473 with fuzz 2 (offset -319 lines).

Applying openssl-0.9.8g-uclibc-susv3-legacy.patch using plaintext:
patching file apps/speed.c
Hunk #1 FAILED at 113.
1 out of 1 hunk FAILED -- saving rejects to file apps/speed.c.rej
Patch failed!  Please fix openssl-0.9.8g-uclibc-susv3-legacy.patch!
make: *** 
[/usr/local/dev/avr32/buildroot-cvs/build_avr32/openssl-0.9.8g/.stamp_patched] 
Error 1
mpfj at mpfj-ubuntu:/usr/local/dev/avr32/buildroot$


Here is the rejects file:-

***************
*** 113,119 ****
   #elif !defined(OPENSSL_SYS_MSDOS) && !defined(OPENSSL_SYS_VXWORKS) && 
(!defined(OPENSSL_SYS_VMS) || defined(__DECC))
   # define TIMES
   #endif
- #if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && 
!defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && 
!defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && 
!defined(OPENSSL_SYS_VXWORKS) /* FIXME */
   # define TIMEB
   #endif

--- 113,119 ----
   #elif !defined(OPENSSL_SYS_MSDOS) && !defined(OPENSSL_SYS_VXWORKS) && 
(!defined(OPENSSL_SYS_VMS) || defined(__DECC))
   # define TIMES
   #endif
+ #if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && 
!defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && 
!defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && 
!defined(OPENSSL_SYS_VXWORKS) && !defined(__UCLIBC__) /* FIXME */
   # define TIMEB
   #endif
