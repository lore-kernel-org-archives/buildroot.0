From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:43 -0500
Subject: [Buildroot] [PATCH 00/67] libglib2 requires threads
Message-ID: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch removes support for an un-threaded version of libglib2. There were
minor cleanups and some bug fixes to various Config.in as well.

See autobuilder failures

http://autobuild.buildroot.net/results/d1fb882fe4d22a17bdd438360da515011dda2b30/build-end.log?
http://autobuild.buildroot.net/results/b66e807769ead5caa3e3b6312e9f7c35c14eafe7/build-end.log?
http://autobuild.buildroot.net/results/9c3fa0c5003a6369e70bfe6d611f7d745742a8c7/build-end.log?


Spenser Gilliland (67):
  atk: libglib2 requires threads
  bluez_utils: libglib2 requires threads
  bustle: libglib2 requires threads
  connman: libglib2 requires threads
  avahi: libglib2 requires threads
  curlftpfs: libglib2 requires threads
  dbus-glib: libglib2 requires threads
  dbus-python: libglib2 requires threads
  docker: libglib2 requires threads
  libedbus: libglib2 requires threads
  libevas-generic-loaders: libglib2 requires threads
  enchant: libglib2 requires threads
  enlightenment: libglib2 requires threads
  gamin: libglib2 requires threads
  gdk-pixbuf: libglib2 requires threads
  glib-networking: libglib2 requires threads
  glibmm: libglib2 requires threads
  gmpc: libglib2 requires threads
  gob2: libglib2 requires threads
  gvfs: libglib2 requires threads
  json-glib: libglib2 requires threads
  latencytop: libglib2 requires threads
  libgail: libglib2 requires threads
  libglade: libglib2 requires threads
  libgtk2: libglib2 requires threads
  libmms: libglib2 requires threads
  libmpd: libglib2 requires threads
  libplayer: libglib2 requires threads
  libqmi: libglib2 requires threads
  librsvg: libglib2 requires threads
  libsoup: libglib2 requires threads
  libxmlpp: libglib2 requires threads
  lttng-babeltrace: libglib2 requires threads
  midori: libglib2 requires threads
  nbd: libglib2 requires threads
  neard: libglib2 requires threads
  neardal: libglib2 requires threads
  network-manager: libglib2 requires threads
  ofono: libglib2 requires threads
  opencv: libglib2 requires threads
  openobex: libglib2 requires threads
  pango: libglib2 requires threads
  pcmanfm: libglib2 requires threads
  pkg-config: libglib2 requires threads
  polkit: libglib2 requires threads
  sconeserver: libglib2 requires threads
  shared-mime-info: libglib2 requires threads
  snowball-init: libglib2 requires threads
  sshfs: libglib2 requires threads
  sysprof: libglib2 requires threads
  udev: libglib2 requires threads
  udisks: libglib2 requires threads
  ussp-push: libglib2 requires threads
  vala: libglib2 requires threads
  webkit: libglib2 requires threads
  wireshark: libglib2 requires threads
  gst-plugin-x170: libglib2 requires threads
  gst-plugins-bad: libglib2 requires threads
  gst-plugins-base: libglib2 requires threads
  gst-plugins-good: libglib2 requires threads
  gst1-plugins-good: libglib2 requires threads
  gst1-plugins-base: libglib2 requires threads
  gst1-plugins-bad: libglib2 requires threads
  gstreamer: libglib2 requires threads
  gstreamer1: libglib2 requires threads
  mpd: libglib2 requires threads
  libglib2: needs threads

 package/atk/Config.in                              |  5 ++--
 package/avahi/Config.in                            |  6 +++--
 package/bluez_utils/Config.in                      |  4 +--
 package/bustle/Config.in                           |  5 ++--
 package/connman/Config.in                          |  4 +--
 package/curlftpfs/Config.in                        |  4 +--
 package/dbus-glib/Config.in                        |  6 +++--
 package/dbus-python/Config.in                      |  6 +++--
 package/docker/Config.in                           |  6 +++--
 package/efl/libedbus/Config.in                     |  5 ++++
 package/efl/libevas-generic-loaders/Config.in      |  5 ++--
 package/enchant/Config.in                          |  6 +++--
 package/enlightenment/Config.in                    |  1 +
 package/gamin/Config.in                            |  5 ++--
 package/gdk-pixbuf/Config.in                       |  4 +++
 package/glib-networking/Config.in                  |  5 ++--
 package/glibmm/Config.in                           |  8 +++---
 package/gmpc/Config.in                             |  6 +++--
 package/gob2/Config.in                             |  3 ++-
 package/gvfs/Config.in                             |  6 ++---
 package/json-glib/Config.in                        |  5 ++--
 package/latencytop/Config.in                       |  7 ++---
 package/libgail/Config.in                          |  6 +++++
 package/libglade/Config.in                         |  6 +++--
 package/libglib2/Config.in                         |  5 ++--
 ...ib2-0002-fix-build-when-no-thread-support.patch | 30 ----------------------
 package/libgtk2/Config.in                          | 11 +++++---
 package/libmms/Config.in                           |  5 ++--
 package/libmpd/Config.in                           |  5 ++--
 package/libplayer/Config.in                        |  3 ++-
 package/libqmi/Config.in                           |  4 +++
 package/librsvg/Config.in                          |  5 ++--
 package/libsoup/Config.in                          | 10 +++++---
 package/libxmlpp/Config.in                         |  8 +++---
 package/lttng-babeltrace/Config.in                 | 10 +++++---
 package/midori/Config.in                           |  1 +
 package/multimedia/gst-plugin-x170/Config.in       |  4 +++
 package/multimedia/gst-plugins-bad/Config.in       | 12 +++++++--
 package/multimedia/gst-plugins-base/Config.in      |  7 +++--
 package/multimedia/gst-plugins-good/Config.in      | 10 ++++++++
 package/multimedia/gst1-plugins-bad/Config.in      | 12 +++++++--
 package/multimedia/gst1-plugins-base/Config.in     |  7 +++--
 package/multimedia/gst1-plugins-good/Config.in     | 10 ++++++++
 package/multimedia/gstreamer/Config.in             |  2 +-
 package/multimedia/gstreamer1/Config.in            |  4 +--
 package/multimedia/mpd/Config.in                   |  8 +++---
 package/nbd/Config.in                              |  9 ++++---
 package/neard/Config.in                            | 11 +++++---
 package/neardal/Config.in                          |  9 ++++---
 package/network-manager/Config.in                  |  6 ++---
 package/ofono/Config.in                            |  9 +++----
 package/opencv/Config.in                           | 10 +++++---
 package/openobex/Config.in                         | 20 ++++++++-------
 package/pango/Config.in                            |  6 +++--
 package/pcmanfm/Config.in                          |  6 +++--
 package/pkg-config/Config.in                       |  5 ++--
 package/polkit/Config.in                           |  5 ++--
 package/sconeserver/Config.in                      |  2 +-
 package/shared-mime-info/Config.in                 |  5 ++--
 package/snowball-init/Config.in                    |  5 +++-
 package/sshfs/Config.in                            |  2 +-
 package/sysprof/Config.in                          | 10 +++++---
 package/udev/Config.in                             |  5 ++++
 package/udisks/Config.in                           | 13 +++++++---
 package/ussp-push/Config.in                        |  2 +-
 package/vala/Config.in                             |  5 ++--
 package/webkit/Config.in                           |  8 +++---
 package/wireshark/Config.in                        |  5 ++--
 68 files changed, 289 insertions(+), 166 deletions(-)
 delete mode 100644 package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch

-- 
1.8.1.2
