From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 21 Jan 2013 01:29:01 +0100
Subject: [Buildroot] Build error : *** Recursive variable `DIRECTFB_INPUT'
	references itself
Message-ID: <C0BEF04D1B814409ACBF0C6A053DE12A@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
The latest git pull is broken by : *** Recursive variable `DIRECTFB_INPUT' references itself 
 
snip ...
 
Making install in simd
make[2]: Entering directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1/simd'
/usr/bin/make  install-am
make[3]: Entering directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1/simd'
make[4]: Entering directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1/simd'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1/simd'
make[3]: Leaving directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1/simd'
make[2]: Leaving directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1/simd'
make[2]: Entering directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1'
make[3]: Entering directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1'
test -z "/usr/lib" || mkdir -p -- "/home/buildroot12git/output/target/usr/lib"
test -z "/usr/share/doc" || mkdir -p -- "/home/buildroot12git/output/target/usr/share/doc"
test -z "/usr/share/doc" || mkdir -p -- "/home/buildroot12git/output/target/usr/share/doc"
test -z "/usr/include" || mkdir -p -- "/home/buildroot12git/output/target/usr/include"
 /bin/sh ./libtool --mode=install /usr/bin/install -c  'libjpeg.la' '/home/buildroot12git/output/target/usr/lib/libjpeg.la'
 /usr/bin/install -c -m 644 'README' '/home/buildroot12git/output/target/usr/share/doc/README'
 /usr/bin/install -c -m 644 'example.c' '/home/buildroot12git/output/target/usr/share/doc/example.c'
 /usr/bin/install -c -m 644 'README-turbo.txt' '/home/buildroot12git/output/target/usr/share/doc/README-turbo.txt'
test -z "/usr/man/man1" || mkdir -p -- "/home/buildroot12git/output/target/usr/man/man1"
 /usr/bin/install -c -m 644 'libjpeg.txt' '/home/buildroot12git/output/target/usr/share/doc/libjpeg.txt'
 /usr/bin/install -c -m 644 'jerror.h' '/home/buildroot12git/output/target/usr/include/jerror.h'
 /usr/bin/install -c -m 644 'structure.txt' '/home/buildroot12git/output/target/usr/share/doc/structure.txt'
 /usr/bin/install -c -m 644 'jmorecfg.h' '/home/buildroot12git/output/target/usr/include/jmorecfg.h'
 /usr/bin/install -c -m 644 'usage.txt' '/home/buildroot12git/output/target/usr/share/doc/usage.txt'
 /usr/bin/install -c -m 644 'jpeglib.h' '/home/buildroot12git/output/target/usr/include/jpeglib.h'
test -z "/usr/include" || mkdir -p -- "/home/buildroot12git/output/target/usr/include"
 /usr/bin/install -c -m 644 'turbojpeg.h' '/home/buildroot12git/output/target/usr/include/turbojpeg.h'
 /usr/bin/install -c -m 644 'wizard.txt' '/home/buildroot12git/output/target/usr/share/doc/wizard.txt'
 /usr/bin/install -c -m 644 'jconfig.h' '/home/buildroot12git/output/target/usr/include/jconfig.h'
 /usr/bin/install -c -m 644 './cjpeg.1' '/home/buildroot12git/output/target/usr/man/man1/cjpeg.1'
 /usr/bin/install -c -m 644 './djpeg.1' '/home/buildroot12git/output/target/usr/man/man1/djpeg.1'
 /usr/bin/install -c -m 644 './jpegtran.1' '/home/buildroot12git/output/target/usr/man/man1/jpegtran.1'
/usr/bin/install -c .libs/libjpeg.so.8.0.2 /home/buildroot12git/output/target/usr/lib/libjpeg.so.8.0.2
(cd /home/buildroot12git/output/target/usr/lib && rm -f libjpeg.so.8 && ln -s libjpeg.so.8.0.2 libjpeg.so.8)
 /usr/bin/install -c -m 644 './rdjpgcom.1' '/home/buildroot12git/output/target/usr/man/man1/rdjpgcom.1'
(cd /home/buildroot12git/output/target/usr/lib && rm -f libjpeg.so && ln -s libjpeg.so.8.0.2 libjpeg.so)
/usr/bin/install -c .libs/libjpeg.lai /home/buildroot12git/output/target/usr/lib/libjpeg.la
/usr/bin/install -c .libs/libjpeg.a /home/buildroot12git/output/target/usr/lib/libjpeg.a
 /usr/bin/install -c -m 644 './wrjpgcom.1' '/home/buildroot12git/output/target/usr/man/man1/wrjpgcom.1'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib
/home/buildroot12git/output/target/usr/lib/libjpeg.a
chmod 644 /home/buildroot12git/output/target/usr/lib/libjpeg.a
libtool: install: warning: remember to run `libtool --finish /usr/lib'
 /bin/sh ./libtool --mode=install /usr/bin/install -c  'libturbojpeg.la'
'/home/buildroot12git/output/target/usr/lib/libturbojpeg.la'
/usr/bin/install -c .libs/libturbojpeg.so /home/buildroot12git/output/target/usr/lib/libturbojpeg.so
/usr/bin/install -c .libs/libturbojpeg.lai /home/buildroot12git/output/target/usr/lib/libturbojpeg.la
/usr/bin/install -c .libs/libturbojpeg.a /home/buildroot12git/output/target/usr/lib/libturbojpeg.a
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib
/home/buildroot12git/output/target/usr/lib/libturbojpeg.a
chmod 644 /home/buildroot12git/output/target/usr/lib/libturbojpeg.a
libtool: install: warning: remember to run `libtool --finish /usr/lib'
test -z "/usr/bin" || mkdir -p -- "/home/buildroot12git/output/target/usr/bin"
  /bin/sh ./libtool --mode=install /usr/bin/install -c 'cjpeg' '/home/buildroot12git/output/target/usr/bin/cjpeg'
/usr/bin/install -c cjpeg /home/buildroot12git/output/target/usr/bin/cjpeg
  /bin/sh ./libtool --mode=install /usr/bin/install -c 'djpeg' '/home/buildroot12git/output/target/usr/bin/djpeg'
/usr/bin/install -c djpeg /home/buildroot12git/output/target/usr/bin/djpeg
  /bin/sh ./libtool --mode=install /usr/bin/install -c 'jpegtran' '/home/buildroot12git/output/target/usr/bin/jpegtran'
/usr/bin/install -c jpegtran /home/buildroot12git/output/target/usr/bin/jpegtran
  /bin/sh ./libtool --mode=install /usr/bin/install -c 'rdjpgcom' '/home/buildroot12git/output/target/usr/bin/rdjpgcom'
/usr/bin/install -c rdjpgcom /home/buildroot12git/output/target/usr/bin/rdjpgcom
  /bin/sh ./libtool --mode=install /usr/bin/install -c 'wrjpgcom' '/home/buildroot12git/output/target/usr/bin/wrjpgcom'
/usr/bin/install -c wrjpgcom /home/buildroot12git/output/target/usr/bin/wrjpgcom
  /bin/sh ./libtool --mode=install /usr/bin/install -c 'tjbench' '/home/buildroot12git/output/target/usr/bin/tjbench'
/usr/bin/install -c tjbench /home/buildroot12git/output/target/usr/bin/tjbench
/usr/bin/make  install-exec-hook
make[4]: Entering directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1'
__PREFIX=`echo /usr | sed -e 's@\/*$@@'`;  \
 if [ "$__PREFIX" = "/opt/libjpeg-turbo" ]; then  \
  cd /home/buildroot12git/output/target//usr;  \
  if [ -d lib -a ! -d lib32 -a ! -h lib32 ]; then  \
   ln -s lib lib32;  \
  fi  \
 fi
make[4]: Leaving directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1'
make[3]: Leaving directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1'
make[2]: Leaving directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1'
make[1]: Leaving directory `/home/buildroot12git/output/build/jpeg-turbo-1.2.1'
rm -f /home/buildroot12git/output/target/usr/bin/cjpeg /home/buildroot12git/output/target/usr/bin/djpeg
/home/buildroot12git/output/target/usr/bin/jpegtrans /home/buildroot12git/output/target/usr/bin/rdjpgcom
/home/buildroot12git/output/target/usr/bin/tjbench /home/buildroot12git/output/target/usr/bin/wrjpgcom
package/directfb/directfb.mk:87: *** Recursive variable `DIRECTFB_INPUT' references itself (eventually).  Stop.
tar: /home/buildroot12git/output/images/rootfs.tar: Cannot open: No such file or directory
tar: Error is not recoverable: exiting now

 
snip ..
 
I think it has something to do with this commit : Buildroot] [PATCH 1/2] packages: remove all := signs 
 

Sagaert Johan

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130121/6e0f8c7d/attachment-0001.html>
