From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:14:38 +0200
Subject: [Buildroot] [PATCH 00/23] package/harfbuzz: needs gcc >= 4.8
Message-ID: <20190803191501.5412-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

bumping harfbuzz to 2.5.2
https://git.buildroot.net/buildroot/commit/package/harfbuzz?id=c04e5cb16e3de688dfee585f47f22db4232acb3e

added a dependency on gcc >= 4.8:

https://github.com/harfbuzz/harfbuzz/blob/master/NEWS#L34
https://github.com/harfbuzz/harfbuzz/blob/master/NEWS#L14

This series adds this dependency to harfbuzz, host-harfbuzz and
(hopefully) to all reverse dependencies.

Regards, Bernd


Bernd Kuhls (23):
  package/cwiid: wmgui needs gcc >= 4.8
  package/xscreensaver: needs gcc >= 4.8
  package/rrdtool: rrd_graph support needs gcc >= 4.8
  package/qt5/qt5base: harfbuzz support needs gcc >= 4.8
  package/pinentry: pinentry-gtk2 needs gcc >= 4.8
  package/pcmanfm: needs gcc >= 4.8
  package/libfm: needs gcc >= 4.8
  package/opencv: gtk support needs gcc >= 4.8
  package/openbox: needs gcc >= 4.8
  package/gstreamer/gst-plugins-bad: rsvg plugin needs gcc >= 4.8
  package/gstreamer/gst-plugins-base: pango plugin needs gcc >= 4.8
  package/gstreamer1/gst1-plugins-bad: rsvg plugin needs gcc >= 4.8
  package/gstreamer1/gst1-plugins-base: pango plugin needs gcc >= 4.8
  package/efl: SVG loader needs gcc >= 4.8
  package/enlightenment: needs gcc >= 4.8
  package/imagemagick: host svg support needs host gcc >= 4.8
  package/vte: needs host gcc >= 4.8
  package/librsvg: needs gcc >= 4.8
  package/gtkmm3: needs host gcc >= 4.8
  package/pango: needs gcc >= 4.8
  package/libgtk2: needs gcc >= 4.8
  package/libgtk3: needs gcc & host gcc >= 4.8
  package/harfbuzz: needs gcc >= 4.8

 package/cwiid/Config.in                        | 3 ++-
 package/efl/Config.in                          | 1 +
 package/enlightenment/Config.in                | 4 +++-
 package/gstreamer/gst-plugins-bad/Config.in    | 6 ++++--
 package/gstreamer/gst-plugins-base/Config.in   | 6 ++++--
 package/gstreamer1/gst1-plugins-bad/Config.in  | 6 ++++--
 package/gstreamer1/gst1-plugins-base/Config.in | 6 ++++--
 package/gtkmm3/Config.in                       | 4 +++-
 package/harfbuzz/Config.in                     | 6 ++++--
 package/imagemagick/Config.in.host             | 4 ++++
 package/libfm/Config.in                        | 4 +++-
 package/libgtk2/Config.in                      | 4 +++-
 package/libgtk3/Config.in                      | 7 ++++++-
 package/librsvg/Config.in                      | 7 +++++--
 package/openbox/Config.in                      | 4 +++-
 package/opencv/Config.in                       | 1 +
 package/pango/Config.in                        | 4 +++-
 package/pcmanfm/Config.in                      | 4 +++-
 package/pinentry/Config.in                     | 4 +++-
 package/qt5/qt5base/Config.in                  | 4 +++-
 package/rrdtool/Config.in                      | 7 +++++--
 package/vte/Config.in                          | 4 +++-
 package/xscreensaver/Config.in                 | 4 +++-
 23 files changed, 77 insertions(+), 27 deletions(-)

-- 
2.20.1
