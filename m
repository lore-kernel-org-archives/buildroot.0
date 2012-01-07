From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Jan 2012 20:51:01 +0100
Subject: [Buildroot] [git commit] Python: add external modules option
Message-ID: <20120107201230.9BE218FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d67a67efaa8fb7fd24e0ee0f5b261a8a57583d35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

all external python packages/libraries should reside in
"external python modules" section.

Move existing modules python-serial and python-mad there

Move python-mad from package/multimedia to package

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                 |    7 ++++++-
 package/multimedia/Config.in                      |    1 -
 package/{multimedia => }/python-mad/Config.in     |    0
 package/{multimedia => }/python-mad/python-mad.mk |    0
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 92b80e6..78174e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -237,6 +237,12 @@ endif
 source "package/microperl/Config.in"
 source "package/php/Config.in"
 source "package/python/Config.in"
+if BR2_PACKAGE_PYTHON
+menu "external python modules"
+source "package/python-mad/Config.in"
+source "package/python-serial/Config.in"
+endmenu
+endif
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
 endmenu
@@ -313,7 +319,6 @@ source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
-source "package/python-serial/Config.in"
 endmenu
 
 if BROKEN
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index d50e4fc..a05d1d9 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -40,7 +40,6 @@ source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
 source "package/multimedia/portaudio/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
-source "package/multimedia/python-mad/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/taglib/Config.in"
diff --git a/package/multimedia/python-mad/Config.in b/package/python-mad/Config.in
similarity index 100%
rename from package/multimedia/python-mad/Config.in
rename to package/python-mad/Config.in
diff --git a/package/multimedia/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
similarity index 100%
rename from package/multimedia/python-mad/python-mad.mk
rename to package/python-mad/python-mad.mk
