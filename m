From: Michael Burghart <mb@michaelburghart.de>
Date: Tue, 22 Mar 2011 22:39:27 +0100
Subject: [Buildroot] Compiling Apache
Message-ID: <4D89170F.7080305@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I am new to this list. Nevertheless I am really happy about the
buildroot tool. Great Work!!

Unfortunately I ran into trouble which I don't understand. I produced a
working toolchain and managed to post-install things. Now I need to add
a "httpd-2.3.8" package. But it fails to  build with the following error:

make[4]: Entering directory
`/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre'
./dftables
/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/chartables.c
make[4]: ./dftables: Kommando nicht gefunden
make[4]: ***
[/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/chartables.c]
Fehler 127
make[4]: Leaving directory
`/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre'
make[3]: *** [all-recursive] Fehler 1
make[3]: Leaving directory
`/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre'
make[2]: *** [all-recursive] Fehler 1
make[2]: Leaving directory
`/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib'
make[1]: *** [all-recursive] Fehler 1
make[1]: Leaving directory
`/LFS/buildroot-2011.02/output/build/httpd-2.2.17'
make: ***
[/LFS/buildroot-2011.02/output/build/httpd-2.2.17/.stamp_built] Fehler 2

("Fehler" =>> "Error" :)))

This is my mk file for httpd

HTTPD_VERSION=2.3.8
HTTPD_SOURCE=httpd-${HTTPD_VERSION}.tar.gz
HTTPD_SITE=http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/httpd/
HTTPD_INSTALL_TARGET=YES
HTTPD_AUTORECONF=YES
HTTPD_LIBTOOL_PATCH=YES
HTTPD_AUTORECONF=YES
HTTPD_CONF_OPT=  --enable-ldap=no  --enable-ssl --with-pcre=/usr
- --with-ssl=/usr ap_cv_void_ptr_lt_long=no
HTTPD_DEPENDENCIES=pcre

Does anybody know about this problem? What am I doing wrong?


- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNiRcPAAoJEEMkp/gkis19xZYIAKxeVAiSRLwKRLo5ZLX+qYH4
XlypMma4FKHMAJvU59gm1OkvwRPEDkErqzdLjV/DApNq9Xlvo09YMtFiEogPd0DA
gOsZnJGptmzMf8dgdKF89fTf0Jwh7ENfVOqwGLWQvWuH69toE/HjTeQ14Uracn4D
5s2wFXRgt/yC4AgI7LZVEYBl+6YmHnCtFe3p30AflOwMrfOHfKsBgbXBxSG5I7sV
xVZMGkB8k6hvSiXFII3tXZZMPd5E7VjmJIGVoDFPOmkmom136ZrwpF8Eerh6I4Ux
iMdXlIR4oY2VtQu4lLOHifHkXBB73BM218TsHalULOE2FFABFBEzsT1rnyCv6m0=
=k8Vt
-----END PGP SIGNATURE-----
