From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 23 Sep 2018 02:53:28 +0300
Subject: [Buildroot] [PATCH 0/5] webkitgtk: update to the latest stable and
 add a number of fixes
Message-ID: <20180922235333.85642-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

After skipping on the 2.20.x releases due to the JIT support in JavaScriptCore
being broken for many 32-bit ARM and MIPS targets, I am submitting an update
to the current stable 2.22.2 release.

On top of the version bump, I am submitting a few related changes as well
which enable features (like WOFF2 Web fonts support), making the package
available on AArch64, and enabling the JavaScriptCore JIT on MIPS (both of
which have gotten a good amount of testing at Igalia).

Last but not least, the last patch in the series fixes the compilation
failure caught by the the autobuilders a couple of times when GStreamer-GL
is disabled.

Best regards,

-Adri?n


Adrian Perez de Castro (5):
  webkitgtk: bump to version 2.22.2
  webkitgtk: add dependency on the woff2 package
  webkitgtk: enable package for aarch64
  webkitgtk: enable JIT support on 32-bit MIPS
  webkitgtk: explicitly set USE_GSTREAMER_GL build option

 package/midori/Config.in                      |  6 +--
 ...ightingNEON.cpp-fails-due-to-missing.patch | 41 +++++++++++++++++++
 package/webkitgtk/Config.in                   | 20 +++++++--
 package/webkitgtk/webkitgtk.hash              |  8 ++--
 package/webkitgtk/webkitgtk.mk                | 16 ++++++--
 5 files changed, 77 insertions(+), 14 deletions(-)
 create mode 100644 package/webkitgtk/0001-ARM-Building-FELightingNEON.cpp-fails-due-to-missing.patch

-- 
2.19.0
