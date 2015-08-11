From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Aug 2015 20:16:45 +0200
Subject: [Buildroot] [PATCH/next 00/10] package/freeswitch: new package
Message-ID: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series provides freeswitch as a new package along with some
codecs and libldns as new dependencies.

Please note that compiling freeswitch is currently broken with uClibc-NG

make[7]: Entering directory '/home/br/br2_next/output/build/freeswitch-7cf1238137d8876a1a34d28a54d60d328c44d895/libs/spandsp/src'
[...]
awgn.c: In function 'awgn_init_dbov':
awgn.c:110:5: error: void value not ignored as it ought to be
     s->rms = pow(10.0, level/20.0)*32768.0;

using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_FREESWITCH=y

A related gcc bug report can be found here:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=55695

The problem was discussed on the musl mailing list:
thread.gmane.org/gmane.linux.lib.musl.general/2468/

Compilation works with uClibc however...

Regards, Bernd


Bernd Kuhls (10):
  package/libldns: new package
  package/libyuv: new package
  package/libsilk: new package
  package/libbroadvoice: new package
  package/libcodec2: new package
  package/libg7221: new package
  package/libilbc: new package
  package/libopenh264: new package
  package/libsoundtouch: new package
  package/freeswitch: new package

 package/Config.in                                  |  10 ++
 package/freeswitch/0001-cross_git.patch            |  11 ++
 package/freeswitch/0002-jpeg.patch                 |  24 ++++
 package/freeswitch/Config.in                       |  58 +++++++++
 package/freeswitch/freeswitch.mk                   | 133 +++++++++++++++++++++
 package/libbroadvoice/Config.in                    |   6 +
 package/libbroadvoice/libbroadvoice.mk             |  19 +++
 package/libcodec2/0001-cross.patch                 |  44 +++++++
 package/libcodec2/0002-disable-unittest.patch      |  13 ++
 package/libcodec2/Config.in                        |   7 ++
 package/libcodec2/libcodec2.mk                     |  23 ++++
 package/libg7221/Config.in                         |   7 ++
 package/libg7221/libg7221.mk                       |  16 +++
 package/libilbc/Config.in                          |   7 ++
 package/libilbc/libilbc.mk                         |  15 +++
 ...-double-free-for-answers-bigger-than-4096.patch |  25 ++++
 ...0002-fix-whitespace-bug-in-ldns-read-zone.patch |  45 +++++++
 package/libldns/Config.in                          |   9 ++
 package/libldns/libldns.hash                       |   2 +
 package/libldns/libldns.mk                         |  26 ++++
 package/libopenh264/Config.in                      |  22 ++++
 package/libopenh264/libopenh264.mk                 |  42 +++++++
 package/libsilk/Config.in                          |   6 +
 package/libsilk/libsilk.mk                         |  16 +++
 package/libsoundtouch/Config.in                    |   8 ++
 package/libsoundtouch/libsoundtouch.mk             |  20 ++++
 package/libyuv/0001-i386-sse2.patch                |  16 +++
 package/libyuv/Config.in                           |  12 ++
 package/libyuv/libyuv.mk                           |  18 +++
 29 files changed, 660 insertions(+)
 create mode 100644 package/freeswitch/0001-cross_git.patch
 create mode 100644 package/freeswitch/0002-jpeg.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.mk
 create mode 100644 package/libbroadvoice/Config.in
 create mode 100644 package/libbroadvoice/libbroadvoice.mk
 create mode 100644 package/libcodec2/0001-cross.patch
 create mode 100644 package/libcodec2/0002-disable-unittest.patch
 create mode 100644 package/libcodec2/Config.in
 create mode 100644 package/libcodec2/libcodec2.mk
 create mode 100644 package/libg7221/Config.in
 create mode 100644 package/libg7221/libg7221.mk
 create mode 100644 package/libilbc/Config.in
 create mode 100644 package/libilbc/libilbc.mk
 create mode 100644 package/libldns/0001-fix-double-free-for-answers-bigger-than-4096.patch
 create mode 100644 package/libldns/0002-fix-whitespace-bug-in-ldns-read-zone.patch
 create mode 100644 package/libldns/Config.in
 create mode 100644 package/libldns/libldns.hash
 create mode 100644 package/libldns/libldns.mk
 create mode 100644 package/libopenh264/Config.in
 create mode 100644 package/libopenh264/libopenh264.mk
 create mode 100644 package/libsilk/Config.in
 create mode 100644 package/libsilk/libsilk.mk
 create mode 100644 package/libsoundtouch/Config.in
 create mode 100644 package/libsoundtouch/libsoundtouch.mk
 create mode 100644 package/libyuv/0001-i386-sse2.patch
 create mode 100644 package/libyuv/Config.in
 create mode 100644 package/libyuv/libyuv.mk

-- 
2.1.4
