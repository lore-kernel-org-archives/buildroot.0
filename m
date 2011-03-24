From: Michael Burghart <mb@michaelburghart.de>
Date: Thu, 24 Mar 2011 07:42:09 +0100
Subject: [Buildroot] Compiling Apache
In-Reply-To: <20110323171608.GC3225@nataf.siach.name>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
	<4D88F97B.4060605@michaelburghart.de>
	<20110322195502.GA8662@tarshish>
	<4D88FFC6.1010404@michaelburghart.de>
	<20110322200337.GB8662@tarshish>
	<4D8904BF.5060503@michaelburghart.de>
	<4D898F3C.8010603@michaelburghart.de>
	<20110323171608.GC3225@nataf.siach.name>
Message-ID: <4D8AE7C1.6050805@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Baruch,

Am 23.03.2011 18:16, schrieb Baruch Siach:

> Do you have 32bit libraries on your host machine?
> 
> What is the output of 'sh -x /usr/bin/ldd dftables'?

I paste it below. Says something about 64bit. But my toolchain should
only create 32bit files...strange.


+ TEXTDOMAIN=libc
+ TEXTDOMAINDIR=/usr/share/locale
+ RTLDLIST='/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2'
+ warn=
+ bind_now=
+ verbose=
+ test 1 -gt 0
+ case "$1" in
+ break
+ add_env='LD_TRACE_LOADED_OBJECTS=1 LD_WARN= LD_BIND_NOW='
+ add_env='LD_TRACE_LOADED_OBJECTS=1 LD_WARN= LD_BIND_NOW=
LD_LIBRARY_VERSION=$verify_out'
+ add_env='LD_TRACE_LOADED_OBJECTS=1 LD_WARN= LD_BIND_NOW=
LD_LIBRARY_VERSION=$verify_out LD_VERBOSE='
+ test '' = yes
+ set -o pipefail
+ case $# in
+ single_file=t
+ result=0
+ for file in '"$@"'
+ test t = t
+ case $file in
+ :
+ test '!' -e
/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/dftables
+ test '!' -f
/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/dftables
+ test -r
/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/dftables
+ test -x
/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/dftables
+ RTLD=
+ ret=1
+ for rtld in '${RTLDLIST}'
+ test -x /lib/ld-linux.so.2
++ /lib/ld-linux.so.2 --verify
/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/dftables
+ verify_out=6
+ ret=0
+ case $ret in
+ RTLD=/lib/ld-linux.so.2
+ break
+ case $ret in
+ try_trace
/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/dftables
+ eval LD_TRACE_LOADED_OBJECTS=1 LD_WARN= LD_BIND_NOW=
'LD_LIBRARY_VERSION=$verify_out' LD_VERBOSE= '"$@"'
++ LD_TRACE_LOADED_OBJECTS=1
++ LD_WARN=
++ LD_BIND_NOW=
++ LD_LIBRARY_VERSION=6
++ LD_VERBOSE=
++ /LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/dftables
+ cat
/usr/bin/ldd: Zeile 118:
/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/dftables:
Datei oder Verzeichnis nicht gefunden
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	                     this says "File or Directory not found"
+ rc=127
+ '[' 127 = 5 ']'
+ '[' 127 = 0 ']'
+ result=1
+ exit 1


- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNiufBAAoJEEMkp/gkis19h70IAM4Yehv9vwKem0pNVJfOy+Wt
RJokwheDCBajcNrob8XShLU1RNvrZXu6rzFkvPgkZckcz3d9W8gjNXUORhkcXf1p
2hHtdOolpw7A1IAQc/qmpD9fhcHr4dvXVecg8QdC5o83Be22WSjwHYTldZhV6Rx9
VQNyzbhqVbUG9ibHeMC+Rur6a9ZrodbbDSVljaBLsT7akSglhiNvzDBV+AWobVeS
llGaP4cvZ16Npw9S5IxQUy7wD5Ko8gGidkVq+NHNdq1IAE0s3/hwWaIUp4CR4dna
0SrRRMO/Hwuie0WC47SH2CKKTJK8P7ewQ+lVzSCIv4DrDTJQBA+mK90By7cvtK0=
=Ll3f
-----END PGP SIGNATURE-----
