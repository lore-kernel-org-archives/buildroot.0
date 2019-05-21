From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 15:39:20 +0200
Subject: [Buildroot] [PATCH v2 00/12] Fix GCC BUG 85180 per-package
Message-ID: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset aims to build packages when building with Gcc affected by
Bug 85180 instead of not bulding them at all.
Bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
is present in Gcc version < 8.x
The basic solution is to force compiling without optimization, so forcing
-O0 appending it to CFLAGS or CXXFLAGS according to programming language
used in package.

Giulio Benetti (12):
  toolchain: specify GCC_BUG_85180 is true only if GCC version < 8.x
  package/atop: fix BUG_85180 build timeout
  package/chocolate-doom: fix BUG_85180 build timeout
  package/ddrescue: fix BUG_85180 build timeout
  package/flare-engine: fix BUG_85180 build timeout
  package/glibmm: fix BUG_85180 build timeout
  package/gst-ffmpeg: re-enable package if BUG_85180 is present
  package/jasper: fix BUG_85180 build timeout
  package/kismet: fix BUG_85180 build timeout
  package/libcpprestsdk: fix BUG_85180 build timeout
  package/opus: fix BUG_85180 build timeout
  package/postgresql: fix BUG_85180 build timeout

 package/atop/atop.mk                       | 7 ++++++-
 package/chocolate-doom/chocolate-doom.mk   | 4 ++++
 package/ddrescue/ddrescue.mk               | 6 +++++-
 package/flare-engine/Config.in             | 4 ----
 package/flare-engine/flare-engine.mk       | 6 ++++++
 package/glibmm/glibmm.mk                   | 4 ++++
 package/gstreamer/gst-ffmpeg/Config.in     | 4 ----
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 5 +++++
 package/jasper/jasper.mk                   | 4 ++++
 package/kismet/kismet.mk                   | 4 ++++
 package/libcpprestsdk/libcpprestsdk.mk     | 4 ++++
 package/opus/opus.mk                       | 4 ++++
 package/postgresql/postgresql.mk           | 4 ++++
 toolchain/Config.in                        | 1 +
 14 files changed, 51 insertions(+), 10 deletions(-)

-- 
2.17.1
