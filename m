From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:16 +0200
Subject: [Buildroot] [PATCH 00/18] package/mplayer: add optional dependencies
Message-ID: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mplayer supports a lot of third-party libraries, to have reproducable builds
add them to the package. Some packages need the explicit mention of -llibfoo
in --extra-libs=

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/mplayer | grep NEEDED | sort
 0x00000001 (NEEDED)                     Shared library: [libasound.so.2]
 0x00000001 (NEEDED)                     Shared library: [libass.so.5]
 0x00000001 (NEEDED)                     Shared library: [libbluray.so.1]
 0x00000001 (NEEDED)                     Shared library: [libbz2.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: [libdvdnavmini.so.4]
 0x00000001 (NEEDED)                     Shared library: [libdvdread.so.4]
 0x00000001 (NEEDED)                     Shared library: [libenca.so.0]
 0x00000001 (NEEDED)                     Shared library: [libfaad.so.2]
 0x00000001 (NEEDED)                     Shared library: [libfontconfig.so.1]
 0x00000001 (NEEDED)                     Shared library: [libfreetype.so.6]
 0x00000001 (NEEDED)                     Shared library: [libfribidi.so.0]
 0x00000001 (NEEDED)                     Shared library: [libgif.so.7]
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
 0x00000001 (NEEDED)                     Shared library: [libjpeg.so.9]
 0x00000001 (NEEDED)                     Shared library: [liblzo2.so.2]
 0x00000001 (NEEDED)                     Shared library: [libmad.so.0]
 0x00000001 (NEEDED)                     Shared library: [libmpeg2.so.0]
 0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
 0x00000001 (NEEDED)                     Shared library: [libogg.so.0]
 0x00000001 (NEEDED)                     Shared library: [libpng16.so.16]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [librtmp.so.1]
 0x00000001 (NEEDED)                     Shared library: [libsmbclient.so.0]
 0x00000001 (NEEDED)                     Shared library: [libspeex.so.1]
 0x00000001 (NEEDED)                     Shared library: [libvorbisidec.so.1]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]

Bernd Kuhls (18):
  package/mplayer: needs host-pkgconf
  package/mplayer: add optional giflib support
  package/mplayer: add optional ncurses support
  package/mplayer: add optional samba support
  package/mplayer: add optional libbluray support
  package/mplayer: add optional fontconfig support
  package/mplayer: add optional libfribidi support
  package/mplayer: add optional libass support
  package/mplayer: add optional libenca support
  package/mplayer: add optional lzo support
  package/mplayer: add optional faad2 support
  package/mplayer: add optional rtmpdump support
  package/mplayer: add optional speex support
  package/mplayer: add optional libiconv support
  package/mplayer: disable optional libcdio support
  package/mplayer: add optional bzip2 support
  package/mplayer: add optional lame support
  package/mplayer: add optional libmpeg2 support

-- 
1.7.10.4
