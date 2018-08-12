From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:12 +0200
Subject: [Buildroot] [PATCH/next v2 00/23] package/vlc: bump version to 3.0.3
Message-ID: <20180812202935.12983-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the upcoming version bump to ffmpeg 4.0.2 also affects vlc which needs
to be bumped to version 3.0.3.

Patches 1-12 add some optional dependencies of vlc which are used both
in vlc 2.2.8 and 3.0.3.

Patch 13 bumps vlc to version 3.0.3.

Patches 14-23 add another round of new optional dependencies.

Regards, Bernd

v2: added patches 13-23

Bernd Kuhls (23):
  package/vlc: needs speexdsp for optional speex support
  package/vlc: sort VLC_CONF_OPTS
  package/vlc: add optional dependency to x264
  package/vlc: add optional dependency to x265
  package/vlc: add optional dependency to ncurses
  package/vlc: add optional dependency to samba4
  package/vlc: add optional dependency to pulseaudio
  package/vlc: add optional dependency to libvpx
  package/vlc: add optional dependency to libidn
  package/vlc: add optional dependency to libsamplerate
  package/vlc: add optional dependency to libdvdread
  package/vlc: add optional dependency to libdvdnav
  package/vlc: bump version to 3.0.3
  package/vlc: add optional dependency to gst1-plugins-base
  package/vlc: add optional dependency to harfbuzz
  package/vlc: add optional dependency to libarchive
  package/vlc: add optional dependency to libnfs
  package/vlc: add optional dependency to libsecret
  package/vlc: add optional dependency to libsoxr
  package/vlc: add optional dependency to libva
  package/vlc: add optional dependency to mpg123
  package/vlc: add optional dependency to wayland
  package/vlc: add optional support for skins2

 ...ding-of-statically-linked-vlc-binary.patch |  15 +-
 ...d-check-for-libgcrypt-config-program.patch |  46 ---
 package/vlc/0002-lua53_compat.patch           |  35 ++
 ...cit-function-declaration-compile-fla.patch |  32 --
 .../0004-qt-fix-build-against-Qt-5.11.patch   |  29 ++
 ...me-X11-is-available-when-Qt5-is-used.patch |  28 --
 ...r-using-uClibc-by-adding-sys-types.h.patch |  44 +++
 ...Don-t-assume-strerror_l-is-available.patch |  15 +-
 ...e-and-add-required-realtime-library-.patch |  40 ---
 package/vlc/0008-posix-clock.patch            | 179 ++++++++++
 package/vlc/0009-Changes-for-ffmpeg-3.0.patch | 309 ------------------
 ...build-support-and-fix-10bit-support.patch} |  45 ++-
 ...10-Fix-build-when-using-C99-and-C-11.patch |  30 --
 package/vlc/0010-freerdp-2.patch              | 138 ++++++++
 .../vlc/0011-compat-fix-static_assert.patch   |  36 --
 ...-Fix-build-with-libupnp-above-1.6.23.patch |  64 ----
 package/vlc/Config.in                         |   9 +-
 package/vlc/vlc.hash                          |  13 +-
 package/vlc/vlc.mk                            | 247 +++++++++++---
 19 files changed, 667 insertions(+), 687 deletions(-)
 delete mode 100644 package/vlc/0002-configure.ac-add-check-for-libgcrypt-config-program.patch
 create mode 100644 package/vlc/0002-lua53_compat.patch
 delete mode 100644 package/vlc/0004-Drop-error-implicit-function-declaration-compile-fla.patch
 create mode 100644 package/vlc/0004-qt-fix-build-against-Qt-5.11.patch
 delete mode 100644 package/vlc/0006-Don-t-assume-X11-is-available-when-Qt5-is-used.patch
 create mode 100644 package/vlc/0006-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
 delete mode 100644 package/vlc/0008-fix-fallback-code-and-add-required-realtime-library-.patch
 create mode 100644 package/vlc/0008-posix-clock.patch
 delete mode 100644 package/vlc/0009-Changes-for-ffmpeg-3.0.patch
 rename package/vlc/{0013-x264-drop-148-build-support-and-fix-10bit-support.patch => 0009-x264-drop-148-build-support-and-fix-10bit-support.patch} (84%)
 delete mode 100644 package/vlc/0010-Fix-build-when-using-C99-and-C-11.patch
 create mode 100644 package/vlc/0010-freerdp-2.patch
 delete mode 100644 package/vlc/0011-compat-fix-static_assert.patch
 delete mode 100644 package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch

-- 
2.18.0
