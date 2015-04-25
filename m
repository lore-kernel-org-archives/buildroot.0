From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:48:17 +0200
Subject: [Buildroot] [git commit] package/vlc: Fixes linking error with
	tremor due to wrong library name
Message-ID: <20150425094838.A292A80836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c8163243f87b07ff7d3bbc896a14887ab1c33ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/469/4693f5f3d362e74a55c8145dbe777606f5865ad5/
http://autobuild.buildroot.net/results/795/795744533dbf7076e88163fb35327da8c42819f1/
http://autobuild.buildroot.net/results/89d/89d9997fc76ad334ff7b7f2a28294c78c424a120/
http://autobuild.buildroot.net/results/57f/57f22c8623268d836e8b402e8c27d418b6fb7f72/
http://autobuild.buildroot.net/results/5f6/5f66a8a135c95624a14908c685f1201dd7f8ae87/

and many others

[Thomas: rename patch to respect patch numbering.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/0005-libvorbisidec.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/vlc/0005-libvorbisidec.patch b/package/vlc/0005-libvorbisidec.patch
new file mode 100644
index 0000000..155e069
--- /dev/null
+++ b/package/vlc/0005-libvorbisidec.patch
@@ -0,0 +1,18 @@
+Fixes linking error with tremor due to wrong library name
+
+Downloaded from Gentoo package
+https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-video/vlc/files/vlc-2.1.0-fix-libtremor-libs.patch?view=markup
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/modules/codec/Makefile.am
++++ b/modules/codec/Makefile.am
+@@ -215,7 +215,7 @@
+ libtremor_plugin_la_SOURCES = codec/vorbis.c
+ libtremor_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -DMODULE_NAME_IS_tremor
+ libtremor_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(codecdir)'
+-libtremor_plugin_la_LIBADD = -lvorbisdec -logg
++libtremor_plugin_la_LIBADD = $(VORBIS_LIBS) $(OGG_LIBS)
+ EXTRA_LTLIBRARIES += libtremor_plugin.la
+ codec_LTLIBRARIES += $(LTLIBtremor)
+ 
