From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2016 21:59:16 +0100
Subject: [Buildroot] [PATCH v5 00/29] package/freeswitch: new package
Message-ID: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series splits my previous patch into smaller chunks for easier
review as requested by Luca and Thomas. I also removed almost all options
from Config.in and kept only two:
- mod_isac is not available on all platforms
- zrtp may not be needed by all users
There are no technical reasons why these options exist, they can easily
be moved to freeswitch.mk if you prefer, I favoured it this way ;)

Instead of enabling or disabling modules in the upstream modules.conf I
decided to delete that file in the first patch to provide a minimal
build for easier review, please keep in mind that I never did a run-time
test with this minimal version. A lot of modules, desired as a default
set, are added with the second patch - all of them have no external
dependencies. The rest of the patch series consists of modules having
some form of dependency, added module by module for easier review.

Regards, Bernd

v5: - bumped to version 1.6.5
    - split patch into smaller chunks (Luca, Thomas)
    - removed most of the options from Config.in
    - added several new modules
    - compilation with uClibc-ng is fixed
v4: - bumped to version 1.6.2
v3: - bumped to version 1.6.0, added hash
    - to compile with uClibc-NG this patch is needed:
      http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=1.0&id=5a167e319ca2bee566d330d1c901d76dc53deea7
      http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/126450/focus=127191
    - removed python module, cross compiling to 32bit on 64bit host is
      broken:
      http://lists.busybox.net/pipermail/buildroot/2011-August/045039.html
    - added reverse dependencies from vlc
    - added comment to 0002-jpeg.patch
v2: - addressed various comments (Thomas)


Bernd Kuhls (29):
  package/freeswitch: new package
  package/freeswitch: enable optional modules
  package/freeswitch: add optional dependency to libuuid
  package/freeswitch: add optional dependency to libedit
  package/freeswitch: enable mod_enum, add optional dependency to
    libldns
  package/freeswitch: enable optional zrtp support
  package/freeswitch: add optional dependency to libpng
  package/freeswitch: add optional dependency to unixodbc
  package/freeswitch: add optional dependency to freetype
  package/freeswitch: enable mod_yaml, add optional dependency to
    libyaml
  package/freeswitch: enable mod_lua, add optional dependency to lua
  package/freeswitch: enable mod_fsv, add optional dependencies to
    libvpx & libyuv
  package/freeswitch: enable mod_av, add optional dependencies to
    ffmpeg, libvpx & libyuv
  package/freeswitch: enable mod_vpx, add optional dependency to libvpx
  package/freeswitch: enable mod_bv, add optional dependency to
    libbroadvoice
  package/freeswitch: enable mod_codec2, add optional dependency to
    libcodec2
  package/freeswitch: add optional dependency to libg7221
  package/freeswitch: enable mod_ilbc, add optional dependency to
    libilbc
  package/freeswitch: enable mod_isac
  package/freeswitch: enable mod_opus, add optional dependency to opus
  package/freeswitch: enable mod_portaudio, add optional dependency to
    portaudio
  package/freeswitch: enable mod_silk, add optional dependency to
    libsilk
  package/freeswitch: enable mod_sndfile, add optional dependency to
    libsndfile
  package/freeswitch: enable mod_alsa, add optional dependency to
    alsa-lib
  package/freeswitch: enable mod_soundtouch, add optional dependency to
    libsoundtouch
  package/freeswitch: enable mod_xml_rpc
  package/freeswitch: enable mod_imagick, add optional dependencies to
    imagemagick, libvpx & libyuv
  package/freeswitch: enable mod_memcache, add optional dependency to
    libmemcached
  package/freeswitch: add optional dependency to xz

 package/Config.in                          |   1 +
 package/freeswitch/0001-cross_git.patch    |  17 ++
 package/freeswitch/0002-jpeg.patch         |  29 ++++
 package/freeswitch/0003-aarch64_zrtp.patch |  22 +++
 package/freeswitch/Config.in               |  58 +++++++
 package/freeswitch/freeswitch.hash         |   2 +
 package/freeswitch/freeswitch.mk           | 257 +++++++++++++++++++++++++++++
 7 files changed, 386 insertions(+)
 create mode 100644 package/freeswitch/0001-cross_git.patch
 create mode 100644 package/freeswitch/0002-jpeg.patch
 create mode 100644 package/freeswitch/0003-aarch64_zrtp.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.hash
 create mode 100644 package/freeswitch/freeswitch.mk

-- 
2.6.4
