From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 19 Aug 2007 21:02:25 +0200 (CEST)
Subject: [Buildroot] make clean in topdir tries to remove host
	/usr/bin/patch :(
Message-ID: <0708192057530.12216@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Odd...

make[1]: Entering directory `buildroot/build_i486/openntpd-3.9p1'
rm -f ntpd.o buffer.o log.o imsg.o ntp.o ntp_msg.o config.o server.o
client.o util.o y.tab.o ntpd openbsd-compat/*.o openbsd-compat/*.a \
            configure.lineno config.h.in~ ntpd.8.out ntpd.conf.5.out
make[1]: Leaving directory `buildroot/build_i486/openntpd-3.9p1'

/usr/bin/make -j1 DESTDIR=buildroot/project_build_i486/uclibc/root
CC=buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc
-C buildroot/build_i486/patch-2.5.9 uninstall
make[1]: Entering directory `buildroot/build_i486/patch-2.5.9'
rm -f /usr/bin/`echo patch | sed 's,x,x,'`
rm: cannot remove `/usr/bin/patch': Permission denied
make[1]: *** [uninstall] Error 1



Cheers,

-- 
Cristian
