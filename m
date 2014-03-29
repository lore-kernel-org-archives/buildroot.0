From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 29 Mar 2014 22:15:36 +0100
Subject: [Buildroot] make graph-build  : missing dot host dependency
Message-ID: <E81A3ED45B1045A891086B1F89277BAB@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

While trying one of the new graphs features :

# make graph-depends
/bin/sh: line 2: dot: command not found
Getting targets
Getting dependencies for ['toolchain-buildroot', 'acl', 'attr', 'busybox', 'can-utils', 'cifs-utils', 'dbus', 'digital_io',
'dropbear', 'host-e2fsprogs', 'expat', 'ffmpeg', 'freetype', 'host-gdb', 'host-genext2fs', 'gettext', 'gmp', 'gnuplot', 'gnutls',
'gzip', 'hwdata', 'i2c-tools', 'icu', 'inotify-tools', 'input-tools', 'jquery-keyboard', 'jquery-mobile', 'jquery-sparkline',
'jquery-ui-themes', 'jquery-ui', 'jquery', 'json-javascript', 'kmod', 'libart', 'libcgi', 'libcurl', 'libesmtp', 'libffi',
'libgcrypt', 'libglib2', 'libgpg-error', 'liblockfile', 'libmbus', 'libmicrohttpd', 'libmodbus', 'libpng', 'libsoup', 'libupnp',
'libxml2', 'linux-firmware', 'lockfile-progs', 'lshw', 'lzo', 'mtd', 'mysql', 'ncurses', 'nettle', 'ntp', 'openssl', 'pcre', 'popt',
'portmap', 'python', 'readline', 'rrdtool', 'rsync', 'sdl', 'sqlite', 'strace', 'time', 'uboot-tools', 'udev', 'util-linux', 'zlib',
'linux', 'toolchain-eclipse-register', 'rootfs-tar']
Error getting dependencies ['toolchain-buildroot', 'acl', 'attr', 'busybox', 'can-utils', 'cifs-utils', 'dbus', 'digital_io',
'dropbear', 'host-e2fsprogs', 'expat', 'ffmpeg', 'freetype', 'host-gdb', 'host-genext2fs', 'gettext', 'gmp', 'gnuplot', 'gnutls',
'gzip', 'hwdata', 'i2c-tools', 'icu', 'inotify-tools', 'input-tools', 'jquery-keyboard', 'jquery-mobile', 'jquery-sparkline',
'jquery-ui-themes', 'jquery-ui', 'jquery', 'json-javascript', 'kmod', 'libart', 'libcgi', 'libcurl', 'libesmtp', 'libffi',
'libgcrypt', 'libglib2', 'libgpg-error', 'liblockfile', 'libmbus', 'libmicrohttpd', 'libmodbus', 'libpng', 'libsoup', 'libupnp',
'libxml2', 'linux-firmware', 'lockfile-progs', 'lshw', 'lzo', 'mtd', 'mysql', 'ncurses', 'nettle', 'ntp', 'openssl', 'pcre', 'popt',
'portmap', 'python', 'readline', 'rrdtool', 'rsync', 'sdl', 'sqlite', 'strace', 'time', 'uboot-tools', 'udev', 'util-linux', 'zlib',
'linux', 'toolchain-eclipse-register', 'rootfs-tar']
make: *** [graph-depends] Error 127
root at debian605:/home/buildroot12git# make graph-build
./support/scripts/graph-build-time --type=histogram --order=name --input=output/build/build-time.log
--output=output/graphs/build.hist-name.pdf 
Traceback (most recent call last):
  File "./support/scripts/graph-build-time", line 52, in <module>
    import matplotlib
ImportError: No module named matplotlib
make: *** [graph-build] Error 1

There seem to be some host tools and libs missing for this feature to work.

Sagaert Johan
