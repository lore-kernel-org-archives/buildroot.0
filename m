From: Andreas Stahl <a.stahl@wsa-electronic.de>
Date: Wed, 5 Jan 2011 15:20:55 +0100
Subject: [Buildroot] Problem building avahi
Message-ID: <B3C53ADB207D471B8656E4BCBBDDD557@WSA.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I cannot build the avahi package on buildroot-2010.11
my steps:
- download and extract buildroot-2010.11.tar.bz2
- cd to the buildroot-2010.11 directory
- make atngw100_defconfig
- make

after some hours of heavy building i get the following error:

[...]
make[3]: Betrete Verzeichnis 
'/usr/buildroot-2010.11/output/build/avahi-0.6.27/avahi-glib'
  CC     libavahi_glib_la-glib-watch.lo
  CC     libavahi_glib_la-glib-malloc.lo
  CCLD   libavahi-glib.la
libtool: link: warning: 
`/usr/buildroot-2010.11/output/staging/usr/lib/libintl.la' seems to be moved
libtool: link: warning: library 
`/usr/buildroot-2010.11/output/staging/usr/lib/libglib-2.0.la' was moved.
/bin/grep: 
/usr/buildroot-2010.11/output/staging/usr/buildroot-2010.11/output/staging/usr/buildroot-2010.11/output/staging/usr/buildroot-2010.11/output/staging/usr/lib/libintl.la: 
No such file or directory
/bin/sed: can't read 
/usr/buildroot-2010.11/output/staging/usr/buildroot-2010.11/output/staging/usr/buildroot-2010.11/output/staging/usr/buildroot-2010.11/output/staging/usr/lib/libintl.la: 
No such file or directory
libtool: link: 
`/usr/buildroot-2010.11/output/staging/usr/buildroot-2010.11/output/staging/usr/buildroot-2010.11/output/staging/usr/buildroot-2010.11/output/staging/usr/lib/libintl.la' 
is not a valid libtool archive
make[3]: *** [libavahi-glib.la] Fehler 1
make[3]: Verlasse Verzeichnis 
'/usr/buildroot-2010.11/output/build/avahi-0.6.27/avahi-glib'
make[2]: *** [all-recursive] Fehler 1
make[2]: Verlasse Verzeichnis 
'/usr/buildroot-2010.11/output/build/avahi-0.6.27'
make[1]: *** [all] Fehler 2
make[1]: Verlasse Verzeichnis 
'/usr/buildroot-2010.11/output/build/avahi-0.6.27'
make: *** [/usr/buildroot-2010.11/output/build/avahi-0.6.27/.stamp_built] 
Fehler 2

It seems that some paths are wrong...
When I disable the avahi package in the menuconfig, the buildprocess 
succseeds and i get a nice target image.
Enabling avahi now produces the same error.

unitil now, i found these wrong paths in lib 
output/staging/usr/lib/libintl.la and libglib-2.0.la

I changed those two files an now i get other errors:

[...]
libtool: install: /usr/bin/install -c .libs/libavahi-glib.so.1.0.2T 
/usr/buildroot-2010.11/output/staging/usr/lib/libavahi-glib.so.1.0.2
libtool: install: (cd /usr/buildroot-2010.11/output/staging/usr/lib && { 
ln -s -f libavahi-glib.so.1.0.2 libavahi-glib.so.1 || { rm -f 
libavahi-glib.so.1 && ln -s libavahi-glib.so.1.0.2 libavahi-glib.so.1; }; })
libtool: install: (cd /usr/buildroot-2010.11/output/staging/usr/lib && { 
ln -s -f libavahi-glib.so.1.0.2 libavahi-glib.so || { rm -f libavahi-glib.so 
&& ln -s libavahi-glib.so.1.0.2 libavahi-glib.so; }; })
libtool: install: /usr/bin/install -c .libs/libavahi-glib.lai 
/usr/buildroot-2010.11/output/staging/usr/lib/libavahi-glib.la
/usr/bin/install: cannot stat `.libs/libavahi-glib.lai': No such file or 
directory
make[3]: *** [install-libLTLIBRARIES] Fehler 1
make[3]: Verlasse Verzeichnis 
'/usr/buildroot-2010.11/output/build/avahi-0.6.27/avahi-glib'
make[2]: *** [install-am] Fehler 2
make[2]: Verlasse Verzeichnis 
'/usr/buildroot-2010.11/output/build/avahi-0.6.27/avahi-glib'
make[1]: *** [install-recursive] Fehler 1
make[1]: Verlasse Verzeichnis 
'/usr/buildroot-2010.11/output/build/avahi-0.6.27'
make: *** 
[/usr/buildroot-2010.11/output/build/avahi-0.6.27/.stamp_staging_installed] 
Fehler 2

Any suggestions? Is this a configuration error on my system ?

Andreas Stahl
