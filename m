From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 8 Jul 2014 12:07:55 +0200
Subject: [Buildroot] mpd build error
Message-ID: <65C3B8A7B8C54F1AB53C66387CFA90E3@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
 Dear all;

mpd build seems to be broken :

.....snip 
rm -f libfs.a
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ar cru libfs.a src/fs/Domain.o src/fs/Traits.o
src/fs/Config.o src/fs/Charset.o src/fs/Path.o src/fs/AllocatedPath.o src/fs/FileSystem.o 
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib libfs.a
depbase=`echo src/DatabaseRegistry.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
	/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -DHAVE_CONFIG_H -I.  -DNDEBUG -I./src
-pthread -isystem /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -isystem
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
-DSYSTEM_CONFIG_FILE_LOCATION='"/etc/mpd.conf"' -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -std=gnu++0x
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fvisibility=hidden -fno-threadsafe-statics
-fmerge-all-constants -fno-exceptions -fno-rtti -ffast-math -ftree-vectorize -ffunction-sections -fdata-sections -Wall -Wextra
-Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual -Wwrite-strings -Wsign-compare -MT src/DatabaseRegistry.o -MD -MP -MF
$depbase.Tpo -c -o src/DatabaseRegistry.o src/DatabaseRegistry.cxx &&\
	mv -f $depbase.Tpo $depbase.Po
depbase=`echo src/DatabaseHelpers.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
	/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -DHAVE_CONFIG_H -I.  -DNDEBUG -I./src
-pthread -isystem /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -isystem
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
-DSYSTEM_CONFIG_FILE_LOCATION='"/etc/mpd.conf"' -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -std=gnu++0x
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fvisibility=hidden -fno-threadsafe-statics
-fmerge-all-constants -fno-exceptions -fno-rtti -ffast-math -ftree-vectorize -ffunction-sections -fdata-sections -Wall -Wextra
-Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual -Wwrite-strings -Wsign-compare -MT src/DatabaseHelpers.o -MD -MP -MF
$depbase.Tpo -c -o src/DatabaseHelpers.o src/DatabaseHelpers.cxx &&\
	mv -f $depbase.Tpo $depbase.Po
depbase=`echo src/db/SimpleDatabasePlugin.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
	/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -DHAVE_CONFIG_H -I.  -DNDEBUG -I./src
-pthread -isystem /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -isystem
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
-DSYSTEM_CONFIG_FILE_LOCATION='"/etc/mpd.conf"' -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -std=gnu++0x
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fvisibility=hidden -fno-threadsafe-statics
-fmerge-all-constants -fno-exceptions -fno-rtti -ffast-math -ftree-vectorize -ffunction-sections -fdata-sections -Wall -Wextra
-Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual -Wwrite-strings -Wsign-compare -MT src/db/SimpleDatabasePlugin.o -MD -MP
-MF $depbase.Tpo -c -o src/db/SimpleDatabasePlugin.o src/db/SimpleDatabasePlugin.cxx &&\
	mv -f $depbase.Tpo $depbase.Po
rm -f libdb_plugins.a
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ar cru libdb_plugins.a src/DatabaseRegistry.o
src/DatabaseHelpers.o src/db/SimpleDatabasePlugin.o  
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib libdb_plugins.a
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -DHAVE_CONFIG_H -I.  -DNDEBUG -I./src -pthread
-isystem /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -isystem
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
-DSYSTEM_CONFIG_FILE_LOCATION='"/etc/mpd.conf"'
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -std=gnu++0x -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe
-Os  -fvisibility=hidden -fno-threadsafe-statics -fmerge-all-constants -fno-exceptions -fno-rtti -ffast-math -ftree-vectorize
-ffunction-sections -fdata-sections -Wall -Wextra -Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual -Wwrite-strings
-Wsign-compare -MT src/libplaylist_plugins_a-MemorySongEnumerator.o -MD -MP -MF
src/.deps/libplaylist_plugins_a-MemorySongEnumerator.Tpo -c -o src/libplaylist_plugins_a-MemorySongEnumerator.o `test -f
'src/MemorySongEnumerator.cxx' || echo './'`src/MemorySongEnumerator.cxx
mv -f src/.deps/libplaylist_plugins_a-MemorySongEnumerator.Tpo src/.deps/libplaylist_plugins_a-MemorySongEnumerator.Po
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -DHAVE_CONFIG_H -I.  -DNDEBUG -I./src -pthread
-isystem /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -isystem
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
-DSYSTEM_CONFIG_FILE_LOCATION='"/etc/mpd.conf"'
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -std=gnu++0x -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe
-Os  -fvisibility=hidden -fno-threadsafe-statics -fmerge-all-constants -fno-exceptions -fno-rtti -ffast-math -ftree-vectorize
-ffunction-sections -fdata-sections -Wall -Wextra -Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual -Wwrite-strings
-Wsign-compare -MT src/playlist/libplaylist_plugins_a-ExtM3uPlaylistPlugin.o -MD -MP -MF
src/playlist/.deps/libplaylist_plugins_a-ExtM3uPlaylistPlugin.Tpo -c -o src/playlist/libplaylist_plugins_a-ExtM3uPlaylistPlugin.o
`test -f 'src/playlist/ExtM3uPlaylistPlugin.cxx' || echo './'`src/playlist/ExtM3uPlaylistPlugin.cxx
mv -f src/playlist/.deps/libplaylist_plugins_a-ExtM3uPlaylistPlugin.Tpo
src/playlist/.deps/libplaylist_plugins_a-ExtM3uPlaylistPlugin.Po
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -DHAVE_CONFIG_H -I.  -DNDEBUG -I./src -pthread
-isystem /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -isystem
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
-DSYSTEM_CONFIG_FILE_LOCATION='"/etc/mpd.conf"'
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -std=gnu++0x -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe
-Os  -fvisibility=hidden -fno-threadsafe-statics -fmerge-all-constants -fno-exceptions -fno-rtti -ffast-math -ftree-vectorize
-ffunction-sections -fdata-sections -Wall -Wextra -Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual -Wwrite-strings
-Wsign-compare -MT src/playlist/libplaylist_plugins_a-M3uPlaylistPlugin.o -MD -MP -MF
src/playlist/.deps/libplaylist_plugins_a-M3uPlaylistPlugin.Tpo -c -o src/playlist/libplaylist_plugins_a-M3uPlaylistPlugin.o `test -f
'src/playlist/M3uPlaylistPlugin.cxx' || echo './'`src/playlist/M3uPlaylistPlugin.cxx
mv -f src/playlist/.deps/libplaylist_plugins_a-M3uPlaylistPlugin.Tpo src/playlist/.deps/libplaylist_plugins_a-M3uPlaylistPlugin.Po
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -DHAVE_CONFIG_H -I.  -DNDEBUG -I./src -pthread
-isystem /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -isystem
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
-DSYSTEM_CONFIG_FILE_LOCATION='"/etc/mpd.conf"'
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -std=gnu++0x -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe
-Os  -fvisibility=hidden -fno-threadsafe-statics -fmerge-all-constants -fno-exceptions -fno-rtti -ffast-math -ftree-vectorize
-ffunction-sections -fdata-sections -Wall -Wextra -Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual -Wwrite-strings
-Wsign-compare -MT src/playlist/libplaylist_plugins_a-PlsPlaylistPlugin.o -MD -MP -MF
src/playlist/.deps/libplaylist_plugins_a-PlsPlaylistPlugin.Tpo -c -o src/playlist/libplaylist_plugins_a-PlsPlaylistPlugin.o `test -f
'src/playlist/PlsPlaylistPlugin.cxx' || echo './'`src/playlist/PlsPlaylistPlugin.cxx
src/playlist/PlsPlaylistPlugin.cxx: In function 'void pls_parser(GKeyFile*, std::forward_list<SongPointer>&)':
src/playlist/PlsPlaylistPlugin.cxx:64:37: error: 'sprintf' was not declared in this scope
   sprintf(key, "File%u", num_entries);
                                     ^
make[2]: *** [src/playlist/libplaylist_plugins_a-PlsPlaylistPlugin.o] Error 1
make[2]: Leaving directory `/home/buildroot12git/output/build/mpd-0.18.11'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/build/mpd-0.18.11'
make: *** [/home/buildroot12git/output/build/mpd-0.18.11/.stamp_built] Error 2

======================================================================
(def)config used
======================================================================

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_FPU_NEON=y
BR2_JLEVEL=1
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.15.3"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_BINUTILS_VERSION_2_23_2=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_ECLIPSE_REGISTER=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_ROOTFS_DEVICE_TABLE="$(TOPDIR)/system/device_table.txt"
BR2_TARGET_GENERIC_ROOT_PASSWD="1234"
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
BR2_PACKAGE_BUSYBOX_CONFIG="$(TOPDIR)/board/karo/busybox-1.22.x.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_MPD=y
BR2_PACKAGE_MPD_FLAC=y
# BR2_PACKAGE_MPD_MAD is not set
# BR2_PACKAGE_MPD_TCP is not set
BR2_PACKAGE_MPD_TREMOR=y
BR2_PACKAGE_EUDEV_RULES_GEN=y
# BR2_TARGET_ROOTFS_TAR is not set


Strange I tried one of the qemu_arm builds with mpd and that one was ok.

Kind Regards;
Sagaert Johan
