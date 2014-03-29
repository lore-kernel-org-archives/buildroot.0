From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Mar 2014 22:28:02 +0100
Subject: [Buildroot] make graph-build  : missing dot host dependency
In-Reply-To: <E81A3ED45B1045A891086B1F89277BAB@JohanW7>
References: <E81A3ED45B1045A891086B1F89277BAB@JohanW7>
Message-ID: <20140329212802.GM3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert, All,

On 2014-03-29 22:15 +0100, Sagaert Johan spake thusly:
> While trying one of the new graphs features :
> 
> # make graph-depends
> /bin/sh: line 2: dot: command not found
> Getting targets
> Getting dependencies for ['toolchain-buildroot', 'acl', 'attr', 'busybox', 'can-utils', 'cifs-utils', 'dbus', 'digital_io',
> 'dropbear', 'host-e2fsprogs', 'expat', 'ffmpeg', 'freetype', 'host-gdb', 'host-genext2fs', 'gettext', 'gmp', 'gnuplot', 'gnutls',
> 'gzip', 'hwdata', 'i2c-tools', 'icu', 'inotify-tools', 'input-tools', 'jquery-keyboard', 'jquery-mobile', 'jquery-sparkline',
> 'jquery-ui-themes', 'jquery-ui', 'jquery', 'json-javascript', 'kmod', 'libart', 'libcgi', 'libcurl', 'libesmtp', 'libffi',
> 'libgcrypt', 'libglib2', 'libgpg-error', 'liblockfile', 'libmbus', 'libmicrohttpd', 'libmodbus', 'libpng', 'libsoup', 'libupnp',
> 'libxml2', 'linux-firmware', 'lockfile-progs', 'lshw', 'lzo', 'mtd', 'mysql', 'ncurses', 'nettle', 'ntp', 'openssl', 'pcre', 'popt',
> 'portmap', 'python', 'readline', 'rrdtool', 'rsync', 'sdl', 'sqlite', 'strace', 'time', 'uboot-tools', 'udev', 'util-linux', 'zlib',
> 'linux', 'toolchain-eclipse-register', 'rootfs-tar']
> Error getting dependencies ['toolchain-buildroot', 'acl', 'attr', 'busybox', 'can-utils', 'cifs-utils', 'dbus', 'digital_io',
> 'dropbear', 'host-e2fsprogs', 'expat', 'ffmpeg', 'freetype', 'host-gdb', 'host-genext2fs', 'gettext', 'gmp', 'gnuplot', 'gnutls',
> 'gzip', 'hwdata', 'i2c-tools', 'icu', 'inotify-tools', 'input-tools', 'jquery-keyboard', 'jquery-mobile', 'jquery-sparkline',
> 'jquery-ui-themes', 'jquery-ui', 'jquery', 'json-javascript', 'kmod', 'libart', 'libcgi', 'libcurl', 'libesmtp', 'libffi',
> 'libgcrypt', 'libglib2', 'libgpg-error', 'liblockfile', 'libmbus', 'libmicrohttpd', 'libmodbus', 'libpng', 'libsoup', 'libupnp',
> 'libxml2', 'linux-firmware', 'lockfile-progs', 'lshw', 'lzo', 'mtd', 'mysql', 'ncurses', 'nettle', 'ntp', 'openssl', 'pcre', 'popt',
> 'portmap', 'python', 'readline', 'rrdtool', 'rsync', 'sdl', 'sqlite', 'strace', 'time', 'uboot-tools', 'udev', 'util-linux', 'zlib',
> 'linux', 'toolchain-eclipse-register', 'rootfs-tar']
> make: *** [graph-depends] Error 127
> root at debian605:/home/buildroot12git# make graph-build
> ./support/scripts/graph-build-time --type=histogram --order=name --input=output/build/build-time.log
> --output=output/graphs/build.hist-name.pdf 
> Traceback (most recent call last):
>   File "./support/scripts/graph-build-time", line 52, in <module>
>     import matplotlib
> ImportError: No module named matplotlib
> make: *** [graph-build] Error 1
> 
> There seem to be some host tools and libs missing for this feature to work.

Yes, you need to have installed on your host system (Debian packages
names):
  - for graph-depends:
    - graphviz (for dot)
  - for graph-build:
    - python-matplotlib or python3-matplotlib
    - python-numpy or python3-numpy
    - argparse if python < 2.7

We could add a check that these tools are present, before running the
graph stuffs. Care to look into that?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
