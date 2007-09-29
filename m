From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 29 Sep 2007 19:28:36 +0300
Subject: [Buildroot] undefined reference to `bcopy' - what's changed?
Message-ID: <46FE7D34.6090703@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I started getting this error. The same config for ARM920T, just doing svn ups and rebuilding buildroot.
Day ago it wasn't there.

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -DHAVE_XORG_CONFIG_H -DXF86PM -Wall -Wpointer-arith -Wstrict-prototypes
-Wmissing-prototypes -Wmissing-declarations -Wnested-externs -fno-strict-aliasing -I../../include -I../../include -I../../Xext -I../../composite -I../../damageext -I../../xfixes -I../../Xi -I../../mi
-I../../miext/shadow -I../../miext/damage -I../../render -I../../randr -I../../fb -g -O2 -rdynamic -o Xorg xorg.o  ../../dix/.libs/libdix.a common/libinit.a loader/libloader.a ./.libs/libosandcommon.a
rac/librac.a parser/libxf86config.a dixmods/.libs/libdixmods.a ../../composite/.libs/libcomposite.a ../../mi/.libs/libmi.a ../../xfixes/.libs/libxfixes.a ../../Xext/.libs/libXextbuiltin.a
../../render/.libs/librender.a ../../randr/.libs/librandr.a ../../damageext/.libs/libdamageext.a ../../miext/damage/.libs/libdamage.a ../../miext/cw/.libs/libcw.a ../../miext/shadow/.libs/libshadow.a
../../Xi/.libs/libXi.a ../../xkb/.libs/libxkb.a ../../dix/.libs/libxpstubs.a ../../os/.libs/libos.a -ldl -L/opt/buildroot/build_arm/staging_dir/usr/lib
/opt/buildroot/build_arm/staging_dir/usr/lib/libXfont.so -L/opt/buildroot/build_arm/staging_dir/lib /opt/buildroot/build_arm/staging_dir/lib/libfreetype.so
/opt/buildroot/build_arm/staging_dir/usr/lib/libXau.so /opt/buildroot/build_arm/staging_dir/usr/lib/libfontenc.so -lz /opt/buildroot/build_arm/staging_dir/usr/lib/libXdmcp.so -lm
dixmods/.libs/libxorgxkb.a   -Wl,--rpath -Wl,/opt/buildroot/build_arm/staging_dir/usr/lib -Wl,--rpath -Wl,/opt/buildroot/build_arm/staging_dir/lib -Wl,--rpath
-Wl,/opt/buildroot/build_arm/staging_dir/usr/lib -Wl,--rpath -Wl,/opt/buildroot/build_arm/staging_dir/lib
/opt/buildroot/build_arm/staging_dir/usr/lib/libXfont.so: undefined reference to `bcopy'

BR,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
