From: Richard Rondu <rondu.richard@gmail.com>
Date: Fri, 21 Aug 2009 11:01:31 +0200
Subject: [Buildroot] rebuild problem, fakeroot complaining.
Message-ID: <35d32c5c0908210201p60633a21k4762f67e0d98762e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been using buildroot-2009.05 to create the toolchain and minimal
environment for my arm9 development board sky2440-v2.
It works well, but only the first time. Once i try to rebuild an image
with the modification i just made in
project_build_arm/uclibc/root/etc/inittab the build fail with the
following error message:

<lainwir3d@d830:~/development/sky2440-v2/buildroot-2009.05>
zsh/2 2018 % make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
LD_LIBRARY_PATH sane:                           Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/lib64/ccache/gcc'
C compiler version '4.3.2':                     Ok
C++ compiler '/usr/lib64/ccache/g++'
C++ compiler version '4.3.2':                   Ok
awk installed:                                  Ok
bash installed:                                 Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/buildroot-config
mkdir -p /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc
cp -dpRf package/config/buildroot-config
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/buildroot-config
mkdir -p /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/share/man/man1
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/share/man/man3
mkdir -p /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/share/man/man3
rm -f /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/liblockfile.so
/usr/bin/make -j3 -C
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/liblockfile-1.06.1
ROOT=/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir
install
make[1]: Entering directory
`/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/liblockfile-1.06.1'
install -m 644 lockfile.h maillock.h
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/include
install -m 2755 dotlockfile
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/bin;\
                install -m 644 *.1
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/share/man/man1
install -m 644 *.3
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/share/man/man3
install -m 755 liblockfile.so \

/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/liblockfile.so.1.0
ln -s liblockfile.so.1.0
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/liblockfile.so
if test "/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir"
= ""; then /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/bin/ldconfig;
fi
make[1]: Leaving directory
`/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/liblockfile-1.06.1'
ln -sf liblockfile.so.1.0
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/liblockfile.so.1
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/liblockfile-1.06.1/liblockfile.a
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib
mkdir -p /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib
cp -a /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/liblockfile.so*
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded \

/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/liblockfile.so.1.0
mkdir -p /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/fonts
touch /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/fonts/fontdir
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/fonts/helvetica*.qpf
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/fonts
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/fonts/fixed*.qpf
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/fonts
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/fonts/micro*.qpf
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/fonts
# Install image plugins if they are built
if [ -d /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/plugins/imageformats
]; then mkdir -p
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins;
cp -dpfr /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/plugins/imageformats
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins/;
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins/imageformats/*;
fi
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/libQtGui.so.*
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/
if [ -d /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/plugins/sqldrivers
]; then mkdir -p
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins;
cp -dpfr /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/plugins/sqldrivers
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins/;
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins/sqldrivers/*;
fi
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/libQtSql.so.*
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/
if [ -d /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/plugins/phonon_backend
]; then mkdir -p
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins;
cp -dpfr /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/plugins/phonon_backend
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins/;
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins/phonon_backend/*;
fi
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/libphonon.so.*
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/
if [ -d /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/plugins/iconengines
]; then mkdir -p
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins;
cp -dpfr /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/plugins/iconengines
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins/;
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/plugins/iconengines/*;
fi
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/libQtSvg.so.*
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/libQtNetwork.so.*
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/libQtXml.so.*
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/libQtScript.so.*
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/
# Strip all installed libs
cp -dpf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/lib/libQtCore.so.*
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/libQt*.so.*
rm -rf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/include
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib/pkgconfig
find /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/lib
\( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
find /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/lib
\( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
rm -rf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/man
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/share/man
rm -rf /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/info
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root/usr/share/info
find /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root
-type f -perm +111 | xargs
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
--remove-section=.comment --remove-section=.note 2>/dev/null || true
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ldconfig
-r /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root
2>/dev/null
# Use fakeroot to pretend all target binaries are owned by root
rm -f /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/_fakeroot."rootfs".arm.cramfs
touch /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/.fakeroot.00000
cat /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/.fakeroot*
> /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/_fakeroot."rootfs".arm.cramfs
echo "chown -R 0:0
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root"
>> /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/_fakeroot."rootfs".arm.cramfs
# Use fakeroot to pretend to create all needed device nodes
echo "/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/host_dir/usr/bin/makedevs
-d target/generic/mini_device_table.txt
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root"
\
                >>
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/_fakeroot."rootfs".arm.cramfs
# Use fakeroot so mkcramfs believes the previous fakery
echo "/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/cramfs-1.1/mkcramfs
-q -l -D target/generic/mini_device_table.txt " \

"/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/root
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/binaries/uclibc/"rootfs".arm.cramfs"
>> /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/_fakeroot."rootfs".arm.cramfs
chmod a+x /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/_fakeroot."rootfs".arm.cramfs
/home/lainwir3d/development/sky2440-v2/buildroot-2009.05/build_arm/host_dir/usr/bin/fakeroot
-- /home/lainwir3d/development/sky2440-v2/buildroot-2009.05/project_build_arm/uclibc/_fakeroot."rootfs".arm.cramfs
fakeroot, while creating message channels: Invalid argument
This may be due to a lack of SYSV IPC support.
fakeroot: error while starting the `faked' daemon.
kill: usage: kill [-s sigspec | -n signum | -sigspec] pid | jobspec
... or kill -l [sigspec]
make: *** [cramfsroot] Error 1

If i reboot then i can build again one time but the next fails.
Rebooting every build is kind of annoying.

Can someone help me please or point me in the right direction?

Thanks for the help,

Richard Rondu
