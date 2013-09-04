From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 4 Sep 2013 10:22:05 +0200
Subject: [Buildroot] latest kmod is broken
Message-ID: <B02044171A0C408F90D8A034B3523859@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi 

Using current git version

It seems to try making 'host-busybox'

See at the end.


>>> kmod 15 Building
PATH="/home/brcopy/output/host/bin:/home/brcopy/output/host/usr/bin:/home/brcopy/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bi
n:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin" PERLLIB="/home/brcopy/output/host/usr/lib/perl"
/usr/bin/make -j5  -C /home/brcopy/output/build/kmod-15/
make[1]: Entering directory `/home/brcopy/output/build/kmod-15'
/usr/bin/make --no-print-directory all-recursive
Making all in .
  GEN    libkmod/libkmod.pc
  CC     libkmod/libkmod.lo
  CC     libkmod/libkmod-config.lo
  CC     libkmod/libkmod-list.lo
  CC     libkmod/libkmod-index.lo
  CC     libkmod/libkmod-module.lo
In file included from libkmod/libkmod-list.c:24:0:
libkmod/libkmod-internal.h:43:6: warning: #warning neither secure_getenv nor __secure_getenv is available [-Wcpp]
  CC     libkmod/libkmod-file.lo
In file included from libkmod/libkmod-config.c:34:0:
libkmod/libkmod-internal.h:43:6: warning: #warning neither secure_getenv nor __secure_getenv is available [-Wcpp]
In file included from libkmod/libkmod.c:36:0:
libkmod/libkmod-internal.h:43:6: warning: #warning neither secure_getenv nor __secure_getenv is available [-Wcpp]
In file included from libkmod/libkmod-index.c:30:0:
libkmod/libkmod-internal.h:43:6: warning: #warning neither secure_getenv nor __secure_getenv is available [-Wcpp]
In file included from libkmod/libkmod-file.c:32:0:
libkmod/libkmod-internal.h:43:6: warning: #warning neither secure_getenv nor __secure_getenv is available [-Wcpp]
  CC     libkmod/libkmod-elf.lo
In file included from libkmod/libkmod-module.c:46:0:
libkmod/libkmod-internal.h:43:6: warning: #warning neither secure_getenv nor __secure_getenv is available [-Wcpp]
  CC     libkmod/libkmod-signature.lo
  CC     libkmod/libkmod-hash.lo
  CC     libkmod/libkmod-array.lo
  CC     libkmod/libkmod-util.lo
  CC     tools/kmod.o
In file included from libkmod/libkmod-elf.c:28:0:
libkmod/libkmod-internal.h:43:6: warning: #warning neither secure_getenv nor __secure_getenv is available [-Wcpp]
  CC     tools/lsmod.o
In file included from libkmod/libkmod-signature.c:27:0:
libkmod/libkmod-internal.h:43:6: warning: #warning neither secure_getenv nor __secure_getenv is available [-Wcpp]
  CC     tools/rmmod.o
  CC     tools/insmod.o
  CC     tools/modinfo.o
  CC     tools/modprobe.o
  CC     tools/depmod.o
In file included from libkmod/libkmod-util.c:34:0:
libkmod/libkmod-internal.h:43:6: warning: #warning neither secure_getenv nor __secure_getenv is available [-Wcpp]
  CC     tools/log.o
  CC     tools/static-nodes.o
  CCLD   libkmod/libkmod-util.la
  CCLD   libkmod/libkmod.la
  CCLD   libkmod/libkmod-internal.la
  CCLD   tools/kmod
  GEN    tools/insmod
  GEN    tools/rmmod
  GEN    tools/modprobe
  GEN    tools/lsmod
  GEN    tools/modinfo
  GEN    tools/depmod
Making all in libkmod/docs
make[3]: Nothing to be done for `all'.
make[1]: Leaving directory `/home/brcopy/output/build/kmod-15'
>>> kmod 15 Installing to staging directory
PATH="/home/brcopy/output/host/bin:/home/brcopy/output/host/usr/bin:/home/brcopy/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bi
n:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin" PERLLIB="/home/brcopy/output/host/usr/lib/perl"
/usr/bin/make -j5 DESTDIR=/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot install -C
/home/brcopy/output/build/kmod-15/
make[1]: Entering directory `/home/brcopy/output/build/kmod-15'
Making install in .
 /bin/mkdir -p '/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib'
 /bin/mkdir -p '/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/bash-completion/completions'
 /bin/mkdir -p '/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include'
 /bin/sh ./libtool   --mode=install /usr/bin/install -c   libkmod/libkmod.la
'/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib'
 /bin/mkdir -p '/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 libkmod/libkmod.h '/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include'
 /usr/bin/install -c -m 644 libkmod/libkmod.pc
'/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 shell-completion/bash/kmod
'/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/bash-completion/completions'
libtool: install: /usr/bin/install -c libkmod/.libs/libkmod.so.2.2.5
/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libkmod.so.2.2.5
libtool: install: (cd /home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib && { ln -s -f libkmod.so.2.2.5
libkmod.so.2 || { rm -f libkmod.so.2 && ln -s libkmod.so.2.2.5 libkmod.so.2; }; })
libtool: install: (cd /home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib && { ln -s -f libkmod.so.2.2.5
libkmod.so || { rm -f libkmod.so && ln -s libkmod.so.2.2.5 libkmod.so; }; })
libtool: install: /usr/bin/install -c libkmod/.libs/libkmod.lai
/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libkmod.la
libtool: install: warning: remember to run `libtool --finish /usr/lib'
 /bin/mkdir -p '/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin'
  /bin/sh ./libtool   --mode=install /usr/bin/install -c tools/kmod
'/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin'
libtool: install: /usr/bin/install -c tools/kmod /home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/kmod
/usr/bin/make --no-print-directory install-exec-hook
if test "/usr/lib" != "/usr/lib"; then \
  /bin/mkdir -p /home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib && \
  so_img_name=$(readlink /home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libkmod.so) && \
  so_img_rel_target_prefix=$(echo /usr/lib | sed 's,\(^/\|\)[^/][^/]*,..,g') && \
  ln -sf $so_img_rel_target_prefix/usr/lib/$so_img_name
/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libkmod.so && \
  mv /home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libkmod.so.*
/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib; \
 fi
Making install in libkmod/docs
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[1]: Leaving directory `/home/brcopy/output/build/kmod-15'
for i in $(find /home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib* -name "*.la"); do cp -f $i $i~;
/bin/sed -i -e "s:\(['= ]\)/usr:\\1/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr:g" $i; done
>>> kmod 15 Installing to target
PATH="/home/brcopy/output/host/bin:/home/brcopy/output/host/usr/bin:/home/brcopy/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bi
n:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin" PERLLIB="/home/brcopy/output/host/usr/lib/perl"
/usr/bin/make -j5 DESTDIR=/home/brcopy/output/target  install -C /home/brcopy/output/build/kmod-15/
make[1]: Entering directory `/home/brcopy/output/build/kmod-15'
Making install in .
 /bin/mkdir -p '/home/brcopy/output/target/usr/lib'
 /bin/mkdir -p '/home/brcopy/output/target/usr/share/bash-completion/completions'
 /bin/mkdir -p '/home/brcopy/output/target/usr/include'
 /bin/sh ./libtool   --mode=install /usr/bin/install -c   libkmod/libkmod.la '/home/brcopy/output/target/usr/lib'
 /bin/mkdir -p '/home/brcopy/output/target/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 libkmod/libkmod.h '/home/brcopy/output/target/usr/include'
 /usr/bin/install -c -m 644 libkmod/libkmod.pc '/home/brcopy/output/target/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 shell-completion/bash/kmod '/home/brcopy/output/target/usr/share/bash-completion/completions'
libtool: install: /usr/bin/install -c libkmod/.libs/libkmod.so.2.2.5 /home/brcopy/output/target/usr/lib/libkmod.so.2.2.5
libtool: install: (cd /home/brcopy/output/target/usr/lib && { ln -s -f libkmod.so.2.2.5 libkmod.so.2 || { rm -f libkmod.so.2 && ln
-s libkmod.so.2.2.5 libkmod.so.2; }; })
libtool: install: (cd /home/brcopy/output/target/usr/lib && { ln -s -f libkmod.so.2.2.5 libkmod.so || { rm -f libkmod.so && ln -s
libkmod.so.2.2.5 libkmod.so; }; })
libtool: install: /usr/bin/install -c libkmod/.libs/libkmod.lai /home/brcopy/output/target/usr/lib/libkmod.la
libtool: install: warning: remember to run `libtool --finish /usr/lib'
 /bin/mkdir -p '/home/brcopy/output/target/usr/bin'
  /bin/sh ./libtool   --mode=install /usr/bin/install -c tools/kmod '/home/brcopy/output/target/usr/bin'
libtool: install: /usr/bin/install -c tools/kmod /home/brcopy/output/target/usr/bin/kmod
/usr/bin/make --no-print-directory install-exec-hook
if test "/usr/lib" != "/usr/lib"; then \
  /bin/mkdir -p /home/brcopy/output/target/usr/lib && \
  so_img_name=$(readlink /home/brcopy/output/target/usr/lib/libkmod.so) && \
  so_img_rel_target_prefix=$(echo /usr/lib | sed 's,\(^/\|\)[^/][^/]*,..,g') && \
  ln -sf $so_img_rel_target_prefix/usr/lib/$so_img_name /home/brcopy/output/target/usr/lib/libkmod.so && \
  mv /home/brcopy/output/target/usr/lib/libkmod.so.* /home/brcopy/output/target/usr/lib; \
 fi
Making install in libkmod/docs
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[1]: Leaving directory `/home/brcopy/output/build/kmod-15'
for i in depmod insmod lsmod modinfo modprobe rmmod; do ln -sf ../usr/bin/kmod /home/brcopy/output/target/sbin/$i; done
>>> host-kmod 15 Extracting
xzcat /home/johan/dl/kmod-15.tar.xz | tar --strip-components=1 -C /home/brcopy/output/build/host-kmod-15  -xf -
>>> host-kmod 15 Patching package//kmod
 
Applying kmod-0001-Add-configure-check-for-_Static_assert.patch using patch: 
patching file configure.ac
patching file libkmod/macro.h
>>> host-kmod 15 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find /home/brcopy/output/build/host-kmod-15 -name $file); do cp
support/gnuconfig/$file $i; done; done
>>> host-kmod 15 Patching libtool
make: *** No rule to make target `host-busybox', needed by `host-kmod-depends'.  Stop.
 



Sagaert Johan

cto at apexsyst.com

www.apexsyst.com <http://www.apexsyst.com/> 
