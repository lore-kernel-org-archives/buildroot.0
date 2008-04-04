From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 3 Apr 2008 17:47:57 -0700 (PDT)
Subject: [Buildroot]  Invalid prefix,
 libdir location set for many (package)-config in staging_dir\usr\bin
Message-ID: <16476230.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

i am using 03042008 buildroot snapshot to build toolchain for amr926ejs.

I had enabled few package to build and after completing the make all, i
observed that below mentioned packages have their (package)-config files
point to incorrect directory names.


arm-linux-directfb-config:
exec_prefix=/usr
moduledir=/lib/directfb-1.0-0

fltk-config:
prefix=/usr
exec_prefix=/usr

freetype-config:
prefix=/usr
exec_prefix=/usr
exec_prefix_set=no
includedir=/usr/include
libdir=/usr/lib

xft-config:
prefix="/usr"
exec_prefix="/usr"

xml2-config:
prefix=/usr
exec_prefix=/usr
includedir=/usr/include


I also tried to correct them but found that these packages (except directfb
& sdl) use recent Makefile.autotools.in method to build

Kindly let me know how to correct the same. Can someone point me on how to
edit the (package).mk file to change these settings to affect
Makefile.autotools.in

Thanks in advance

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/Invalid-prefix%2Clibdir-location-set-for-many-%28package%29-config-in-staging_dir%5Cusr%5Cbin-tp16476230p16476230.html
Sent from the BuildRoot mailing list archive at Nabble.com.
