From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 22 Nov 2013 15:15:13 +0000
Subject: [Buildroot] [PATCH 2/2] beecrypt: append -lgomp to LIBADD
In-Reply-To: <1385133313-27399-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1385133313-27399-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1385133313-27399-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

   http://autobuild.buildroot.net/results/bcf/bcff4b81bfbb1191f97317b0945c74d948c9774b/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../beecrypt-0003-append-lgomp-to-LIBADD.patch     |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 package/beecrypt/beecrypt-0003-append-lgomp-to-LIBADD.patch

diff --git a/package/beecrypt/beecrypt-0003-append-lgomp-to-LIBADD.patch b/package/beecrypt/beecrypt-0003-append-lgomp-to-LIBADD.patch
new file mode 100644
index 0000000..9925c48
--- /dev/null
+++ b/package/beecrypt/beecrypt-0003-append-lgomp-to-LIBADD.patch
@@ -0,0 +1,11 @@
+--- beecrypt-4.2.1/Makefile.am.orig	2013-11-22 12:19:30.071409075 +0000
++++ beecrypt-4.2.1/Makefile.am	2013-11-22 12:20:14.358103445 +0000
+@@ -64,7 +64,7 @@ lib_LTLIBRARIES = libbeecrypt.la
+ 
+ libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhies.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha224.c hmacsha256.c md4.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c ripemd128.c ripemd160.c ripemd256.c ripemd320.c rsa.c rsakp.c rsapk.c sha1.c sha224.c sha256.c sha384.c sha512.c sha2k32.c sha2k64.c timestamp.c cppglue.cxx
+ libbeecrypt_la_DEPENDENCIES = $(BEECRYPT_OBJECTS)
+-libbeecrypt_la_LIBADD = blowfishopt.lo mpopt.lo sha1opt.lo $(OPENMP_LIBS)
++libbeecrypt_la_LIBADD = blowfishopt.lo mpopt.lo sha1opt.lo -lgomp
+ libbeecrypt_la_LDFLAGS = -no-undefined -version-info $(LIBBEECRYPT_LT_CURRENT):$(LIBBEECRYPT_LT_REVISION):$(LIBBEECRYPT_LT_AGE)
+ 
+ EXTRA_DIST = BENCHMARKS BUGS CONTRIBUTORS README.WIN32 autogen.sh
-- 
1.7.1
