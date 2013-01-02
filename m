From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:55 +0100
Subject: [Buildroot] [PATCH 20/20] support/scripts: add xorg-release.py
	script
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <41c1bc2b4f8953280e305deada0b52e432974b58.1357125961.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This script generates a report on the packaging status of X.org
releases in Buildroot. It does so by downloading the list of tarballs
that are part of a given X.org release, and compare that with the
packages that are available in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
The current output of the script is:

                            Package name |      Vers in BR |   Vers in X.org | Action
---------------------------------------- | --------------- | --------------- | ------------------------------
                            applewmproto |      1.4.1      |      1.4.2      | Upgrade
                                  appres |      1.0.1      |       N/A       | Remove from Buildroot
                                bdftopcf |      1.0.3      |      1.0.3      | -
                             beforelight |      1.0.2      |       N/A       | Remove from Buildroot
                            bigreqsproto |      1.1.1      |      1.1.2      | Upgrade
                                  bitmap |      1.0.6      |       N/A       | Remove from Buildroot
                          compositeproto |      0.4.2      |      0.4.2      | -
                             damageproto |      1.2.1      |      1.2.1      | -
                                dmxproto |      2.3.1      |      2.3.1      | -
                               dri2proto |       2.3       |       2.6       | Upgrade
                                 editres |      1.0.5      |       N/A       | Remove from Buildroot
                               encodings |      1.0.4      |      1.0.4      | -
                              fixesproto |       5.0       |       5.0       | -
                       font-adobe-100dpi |      1.0.3      |      1.0.3      | -
                        font-adobe-75dpi |      1.0.3      |      1.0.3      | -
                font-adobe-utopia-100dpi |      1.0.4      |      1.0.4      | -
                 font-adobe-utopia-75dpi |      1.0.4      |      1.0.4      | -
                 font-adobe-utopia-type1 |      1.0.4      |      1.0.4      | -
                              font-alias |      1.0.3      |      1.0.3      | -
                        font-arabic-misc |      1.0.3      |      1.0.3      | -
                          font-bh-100dpi |      1.0.3      |      1.0.3      | -
                           font-bh-75dpi |      1.0.3      |      1.0.3      | -
         font-bh-lucidatypewriter-100dpi |      1.0.3      |      1.0.3      | -
          font-bh-lucidatypewriter-75dpi |      1.0.3      |      1.0.3      | -
                             font-bh-ttf |      1.0.3      |      1.0.3      | -
                           font-bh-type1 |      1.0.3      |      1.0.3      | -
                   font-bitstream-100dpi |      1.0.3      |      1.0.3      | -
                    font-bitstream-75dpi |      1.0.3      |      1.0.3      | -
                   font-bitstream-speedo |      1.0.1      |       N/A       | Remove from Buildroot
                    font-bitstream-type1 |      1.0.3      |      1.0.3      | -
                    font-cronyx-cyrillic |      1.0.3      |      1.0.3      | -
                        font-cursor-misc |      1.0.3      |      1.0.3      | -
                        font-daewoo-misc |      1.0.3      |      1.0.3      | -
                           font-dec-misc |      1.0.3      |      1.0.3      | -
                          font-ibm-type1 |      1.0.3      |      1.0.3      | -
                          font-isas-misc |      1.0.3      |      1.0.3      | -
                           font-jis-misc |      1.0.3      |      1.0.3      | -
                         font-micro-misc |      1.0.3      |      1.0.3      | -
                      font-misc-cyrillic |      1.0.3      |      1.0.3      | -
                      font-misc-ethiopic |      1.0.3      |      1.0.3      | -
                        font-misc-meltho |      1.0.3      |      1.0.3      | -
                          font-misc-misc |      1.1.2      |      1.1.2      | -
                          font-mutt-misc |      1.0.3      |      1.0.3      | -
                    font-schumacher-misc |      1.1.2      |      1.1.2      | -
                    font-screen-cyrillic |      1.0.4      |      1.0.4      | -
                          font-sony-misc |      1.0.3      |      1.0.3      | -
                           font-sun-misc |      1.0.3      |      1.0.3      | -
                               font-util |      1.2.0      |      1.3.0      | Upgrade
                  font-winitzki-cyrillic |      1.0.3      |      1.0.3      | -
                      font-xfree86-type1 |      1.0.4      |      1.0.4      | -
                          fontcacheproto |      0.1.3      |       N/A       | Remove from Buildroot
                              fontsproto |      2.1.1      |      2.1.2      | Upgrade
                              fonttosfnt |      1.0.3      |       N/A       | Remove from Buildroot
                               fslsfonts |      1.0.1      |       N/A       | Remove from Buildroot
                                 fstobdf |      1.0.2      |       N/A       | Remove from Buildroot
                                 glproto |      1.4.12     |      1.4.15     | Upgrade
                                 iceauth |      1.0.4      |      1.0.5      | Upgrade
                                     ico |      1.0.2      |       N/A       | Remove from Buildroot
                              inputproto |      2.0.1      |       2.2       | Upgrade
                                 kbproto |      1.0.5      |      1.0.6      | Upgrade
                              libAppleWM |       N/A       |      1.4.1      | Add to Buildroot
                                   libFS |      1.0.3      |      1.0.4      | Upgrade
                                  libICE |      1.0.7      |      1.0.8      | Upgrade
                                   libSM |      1.2.0      |      1.2.1      | Upgrade
                            libWindowsWM |       N/A       |      1.0.1      | Add to Buildroot
                                  libX11 |      1.4.2      |      1.5.0      | Upgrade
                           libXScrnSaver |      1.2.1      |      1.2.2      | Upgrade
                                  libXau |      1.0.6      |      1.0.7      | Upgrade
                                  libXaw |      1.0.9      |      1.0.11     | Upgrade
                           libXcomposite |      0.4.3      |      0.4.3      | -
                              libXcursor |      1.1.11     |      1.1.13     | Upgrade
                              libXdamage |      1.1.3      |      1.1.3      | -
                                libXdmcp |      1.1.0      |      1.1.1      | Upgrade
                                 libXext |      1.2.0      |      1.3.1      | Upgrade
                               libXfixes |      4.0.5      |       5.0       | Upgrade
                                libXfont |      1.4.3      |      1.4.5      | Upgrade
                           libXfontcache |      1.0.5      |       N/A       | Remove from Buildroot
                                  libXft |      2.2.0      |      2.3.1      | Upgrade
                                   libXi |      1.4.2      |      1.6.1      | Upgrade
                             libXinerama |      1.1.1      |      1.1.2      | Upgrade
                                  libXmu |      1.1.0      |      1.1.1      | Upgrade
                                   libXp |      1.0.1      |       N/A       | Remove from Buildroot
                                  libXpm |      3.5.9      |      3.5.10     | Upgrade
                        libXprintAppUtil |      1.0.1      |       N/A       | Remove from Buildroot
                           libXprintUtil |      1.0.1      |       N/A       | Remove from Buildroot
                               libXrandr |      1.3.1      |      1.3.2      | Upgrade
                              libXrender |      0.9.7      |      0.9.7      | -
                                 libXres |      1.0.5      |      1.0.6      | Upgrade
                                   libXt |      1.1.3      |      1.1.3      | -
                                 libXtst |      1.2.0      |      1.2.1      | Upgrade
                                   libXv |      1.0.6      |      1.0.7      | Upgrade
                                 libXvMC |      1.0.6      |      1.0.7      | Upgrade
                             libXxf86dga |      1.1.2      |      1.1.3      | Upgrade
                              libXxf86vm |      1.1.1      |      1.1.2      | Upgrade
                                  libdmx |      1.1.1      |      1.1.2      | Upgrade
                              libfontenc |      1.1.0      |      1.1.1      | Upgrade
                                 liboldX |      1.0.1      |       N/A       | Remove from Buildroot
                            libpciaccess |      0.12.1     |      0.13.1     | Upgrade
                        libpthread-stubs |       0.3       |       0.3       | -
                                  libxcb |       1.7       |      1.8.1      | Upgrade
                              libxkbfile |      1.0.7      |      1.0.8      | Upgrade
                                libxkbui |      1.0.2      |       N/A       | Remove from Buildroot
                                 listres |      1.0.3      |       N/A       | Remove from Buildroot
                                    luit |      1.1.0      |      1.1.1      | Upgrade
                              makedepend |      1.0.2      |      1.0.4      | Upgrade
                                  mesa3d |      7.10.1     |       N/A       | Remove from Buildroot
                               mkfontdir |      1.0.7      |      1.0.7      | -
                             mkfontscale |      1.0.8      |      1.1.0      | Upgrade
                                  oclock |      1.0.1      |       N/A       | Remove from Buildroot
                              printproto |      1.0.5      |       N/A       | Remove from Buildroot
                              randrproto |      1.3.2      |      1.3.2      | -
                             recordproto |       1.14      |      1.14.2     | Upgrade
                             renderproto |      0.11.1     |      0.11.1     | -
                           resourceproto |      1.1.1      |      1.2.0      | Upgrade
                                     rgb |      1.0.1      |       N/A       | Remove from Buildroot
                                  rstart |      1.0.2      |       N/A       | Remove from Buildroot
                                 scripts |      1.0.1      |       N/A       | Remove from Buildroot
                          scrnsaverproto |      1.2.1      |      1.2.2      | Upgrade
                                 sessreg |      1.0.6      |      1.0.7      | Upgrade
                               setxkbmap |      1.2.0      |      1.3.0      | Upgrade
                                showfont |      1.0.1      |       N/A       | Remove from Buildroot
                                 smproxy |      1.0.4      |      1.0.5      | Upgrade
                                     twm |      1.0.6      |       N/A       | Remove from Buildroot
                             util-macros |       1.17      |       1.17      | -
                              videoproto |      2.3.1      |      2.3.1      | -
                                 viewres |      1.0.3      |       N/A       | Remove from Buildroot
                          windowswmproto |      1.0.4      |      1.0.4      | -
                                 x11perf |      1.5.4      |      1.5.4      | -
                                   xauth |      1.0.5      |      1.0.7      | Upgrade
                              xbacklight |      1.1.2      |      1.1.2      | -
                                   xbiff |      1.0.3      |       N/A       | Remove from Buildroot
                                xbitmaps |       N/A       |      1.1.1      | Add to Buildroot
                                   xcalc |      1.0.2      |       N/A       | Remove from Buildroot
                               xcb-proto |       1.6       |      1.7.1      | Upgrade
                                xcb-util |      0.3.6      |       N/A       | Remove from Buildroot
                        xcb-util-keysyms |      0.3.9      |       N/A       | Remove from Buildroot
                              xclipboard |      1.1.2      |       N/A       | Remove from Buildroot
                                  xclock |      1.0.6      |       N/A       | Remove from Buildroot
                             xcmiscproto |      1.2.1      |      1.2.2      | Upgrade
                                  xcmsdb |      1.0.3      |      1.0.4      | Upgrade
                          xcursor-themes |       N/A       |      1.0.3      | Add to Buildroot
                              xcursorgen |      1.0.5      |      1.0.5      | -
                          xdata_xbitmaps |      1.1.1      |       N/A       | Remove from Buildroot
                    xdata_xcursor-themes |      1.0.3      |       N/A       | Remove from Buildroot
                               xdbedizzy |      1.0.2      |       N/A       | Remove from Buildroot
                                xditview |      1.0.2      |       N/A       | Remove from Buildroot
                                     xdm |      1.1.11     |       N/A       | Remove from Buildroot
                                xdpyinfo |      1.2.0      |      1.3.0      | Upgrade
                                xdriinfo |      1.0.4      |      1.0.4      | -
                                   xedit |      1.2.0      |       N/A       | Remove from Buildroot
                                     xev |      1.1.0      |      1.2.0      | Upgrade
                               xextproto |      7.2.0      |      7.2.1      | Upgrade
                                   xeyes |      1.0.1      |       N/A       | Remove from Buildroot
                        xf86-input-evdev |      2.5.0      |      2.7.0      | Upgrade
                     xf86-input-joystick |      1.5.0      |      1.6.1      | Upgrade
                     xf86-input-keyboard |      1.5.0      |      1.6.1      | Upgrade
                        xf86-input-mouse |      1.6.0      |      1.7.2      | Upgrade
                    xf86-input-synaptics |      1.3.0      |      1.6.1      | Upgrade
                      xf86-input-vmmouse |     12.6.10     |      12.8.0     | Upgrade
                         xf86-input-void |      1.3.1      |      1.4.0      | Upgrade
                          xf86-video-ark |      0.7.3      |      0.7.4      | Upgrade
                          xf86-video-ast |     0.91.10     |     0.93.10     | Upgrade
                          xf86-video-ati |      6.14.1     |      6.14.4     | Upgrade
                       xf86-video-cirrus |      1.3.2      |      1.4.0      | Upgrade
                        xf86-video-dummy |      0.3.4      |      0.3.5      | Upgrade
                        xf86-video-fbdev |      0.4.2      |      0.4.2      | -
                        xf86-video-geode |     2.11.10     |     2.11.13     | Upgrade
                        xf86-video-glide |      1.1.0      |      1.2.0      | Upgrade
                        xf86-video-glint |      1.2.5      |      1.2.7      | Upgrade
                         xf86-video-i128 |      1.3.4      |      1.3.5      | Upgrade
                        xf86-video-intel |      2.13.0     |      2.19.0     | Upgrade
                       xf86-video-mach64 |      6.8.2      |      6.9.1      | Upgrade
                          xf86-video-mga |      1.4.13     |      1.5.0      | Upgrade
                     xf86-video-neomagic |      1.2.5      |      1.2.6      | Upgrade
                      xf86-video-newport |      0.2.3      |      0.2.4      | Upgrade
                           xf86-video-nv |      2.1.18     |      2.1.18     | -
                   xf86-video-openchrome |     0.2.904     |     0.2.906     | Upgrade
                         xf86-video-r128 |      6.8.1      |      6.8.2      | Upgrade
                       xf86-video-savage |      2.3.1      |      2.3.4      | Upgrade
                xf86-video-siliconmotion |      1.7.4      |      1.7.6      | Upgrade
                          xf86-video-sis |      0.10.3     |      0.10.4     | Upgrade
                       xf86-video-suncg6 |      1.1.1      |      1.1.1      | -
                       xf86-video-sunffb |      1.2.1      |      1.2.1      | -
                         xf86-video-tdfx |      1.4.3      |      1.4.4      | Upgrade
                          xf86-video-tga |      1.2.1      |      1.2.1      | -
                      xf86-video-trident |      1.3.4      |      1.3.5      | Upgrade
                          xf86-video-v4l |      0.2.0      |      0.2.0      | -
                         xf86-video-vesa |      2.3.0      |      2.3.1      | Upgrade
                       xf86-video-vmware |      11.0.3     |      12.0.2     | Upgrade
                       xf86-video-voodoo |      1.2.4      |      1.2.4      | -
                         xf86-video-wsfb |      0.3.0      |      0.4.0      | Upgrade
                        xf86bigfontproto |      1.2.0      |      1.2.0      | -
                                 xf86dga |      1.0.2      |       N/A       | Remove from Buildroot
                            xf86dgaproto |       2.1       |       2.1       | -
                            xf86driproto |      2.1.1      |      2.1.1      | -
                           xf86rushproto |      1.1.2      |       N/A       | Remove from Buildroot
                        xf86vidmodeproto |      2.3.1      |      2.3.1      | -
                                     xfd |      1.1.1      |       N/A       | Remove from Buildroot
                                xfontsel |      1.0.4      |       N/A       | Remove from Buildroot
                                     xfs |      1.0.5      |       N/A       | Remove from Buildroot
                                 xfsinfo |      1.0.1      |       N/A       | Remove from Buildroot
                                  xgamma |      1.0.4      |      1.0.5      | Upgrade
                                     xgc |      1.0.3      |       N/A       | Remove from Buildroot
                                   xhost |      1.0.4      |      1.0.5      | Upgrade
                           xineramaproto |      1.2.1      |      1.2.1      | -
                                   xinit |      1.3.2      |       N/A       | Remove from Buildroot
                                  xinput |      1.5.4      |      1.6.0      | Upgrade
                       xinput-calibrator |      0.7.5      |       N/A       | Remove from Buildroot
                                 xkbcomp |      1.2.0      |      1.2.4      | Upgrade
                                  xkbevd |      1.1.2      |      1.1.3      | Upgrade
                                xkbprint |      1.0.1      |       N/A       | Remove from Buildroot
                                xkbutils |      1.0.3      |      1.0.3      | -
                        xkeyboard-config |       2.0       |       2.6       | Upgrade
                                   xkill |      1.0.3      |      1.0.3      | -
                                   xload |      1.1.1      |       N/A       | Remove from Buildroot
                                   xlogo |      1.0.4      |       N/A       | Remove from Buildroot
                                xlsatoms |      1.1.0      |      1.1.1      | Upgrade
                              xlsclients |      1.1.1      |      1.1.2      | Upgrade
                                xlsfonts |      1.0.1      |       N/A       | Remove from Buildroot
                                    xmag |      1.0.4      |       N/A       | Remove from Buildroot
                                    xman |      1.0.3      |       N/A       | Remove from Buildroot
                                xmessage |      1.0.2      |       N/A       | Remove from Buildroot
                                     xmh |      1.0.2      |       N/A       | Remove from Buildroot
                                 xmodmap |      1.0.5      |      1.0.7      | Upgrade
                                   xmore |      1.0.1      |       N/A       | Remove from Buildroot
                               xorg-docs |       N/A       |       1.7       | Add to Buildroot
                             xorg-server |      1.9.4      |      1.12.2     | Upgrade
                      xorg-sgml-doctools |       N/A       |       1.11      | Add to Buildroot
                            xplsprinters |      1.0.1      |       N/A       | Remove from Buildroot
                                     xpr |      1.0.3      |      1.0.4      | Upgrade
                     xprehashprinterlist |      1.0.1      |       N/A       | Remove from Buildroot
                                   xprop |      1.2.0      |      1.2.1      | Upgrade
                                  xproto |      7.0.21     |      7.0.23     | Upgrade
                                  xrandr |      1.3.4      |      1.3.5      | Upgrade
                                    xrdb |      1.0.7      |      1.0.9      | Upgrade
                                xrefresh |      1.0.4      |      1.0.4      | -
                                    xset |      1.2.1      |      1.2.2      | Upgrade
                                xsetmode |      1.0.0      |       N/A       | Remove from Buildroot
                             xsetpointer |      1.0.0      |       N/A       | Remove from Buildroot
                                xsetroot |      1.1.0      |      1.1.0      | -
                                     xsm |      1.0.2      |       N/A       | Remove from Buildroot
                                xstdcmap |      1.0.1      |       N/A       | Remove from Buildroot
                                  xtrans |      1.2.6      |      1.2.7      | Upgrade
                                xvidtune |      1.0.2      |       N/A       | Remove from Buildroot
                                  xvinfo |      1.1.1      |      1.1.1      | -
                                     xwd |      1.0.4      |      1.0.5      | Upgrade
                                xwininfo |      1.1.1      |      1.1.2      | Upgrade
                                    xwud |      1.0.3      |      1.0.4      | Upgrade
---------------------------------------- | --------------- | --------------- | ------------------------------
                Total number of packages : 248
                     Packages to upgrade : 105
                         Packages to add :   6
                      Packages to remove :  64
             Packages with nothing to do :  73
---
 support/scripts/xorg-release.py |  165 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 support/scripts/xorg-release.py

diff --git a/support/scripts/xorg-release.py b/support/scripts/xorg-release.py
new file mode 100644
index 0000000..8055658
--- /dev/null
+++ b/support/scripts/xorg-release.py
@@ -0,0 +1,165 @@
+#!/usr/bin/python
+
+# This script generates a report on the packaging status of X.org
+# releases in Buildroot. It does so by downloading the list of
+# tarballs that are part of a given X.org release, and compare that
+# with the packages that are available in Buildroot.
+
+import BeautifulSoup
+import re
+import os
+import urllib
+
+# This can be customized
+XORG_VERSION = "X11R7.7"
+
+# Key names in dictionaries
+XORG_VERSION_KEY = "xorg-version"
+BR_VERSION_KEY = "br-version"
+BR_NAME_KEY = "br-name"
+
+# Get the list of tarballs of a X.org release, parse it, and return a
+# dictionary of dictionaries, of the form:
+#
+#   { <name_of_package> : { XORG_VERSION_KEY: <version_of_package> },
+#     <name_of_package2> : { XORG_VERSION_KEY: <version_of_package2> }}
+#
+def get_xorg_release_pkgs():
+    u = urllib.URLopener().open("http://www.x.org/releases/%s/src/everything/" % XORG_VERSION)
+    b = BeautifulSoup.BeautifulSoup()
+    b.feed(u.read())
+    links = b.findAll("a")
+    packages = {}
+    r = re.compile("(.*)-([0-9\.]*).tar.bz2")
+    # We now have a list of all links.
+    for link in links:
+        href = link.get("href")
+        # Skip everything but tarballs
+        if not href.endswith(".tar.bz2"):
+            continue
+        # Separate the name and the version
+        groups = r.match(href)
+        if not groups:
+            continue
+        name = groups.group(1)
+        version = groups.group(2)
+        packages[name] = { XORG_VERSION_KEY : version }
+    return packages
+
+# Files and directories in package/x11r7/ that should be ignored in
+# our processing.
+BUILDROOT_EXCEPTIONS = [
+    "mcookie", # Code is directly in package directory
+    "x11r7.mk",
+    "Config.in",
+    "xdriver_xf86-input-tslib", # From Pengutronix, not part of X.org releases
+]
+
+# Prefixes of directories in package/x11r7/ that must be stripped
+# before trying to match Buildroot package names with X.org tarball
+# names.
+BUILDROOT_PREFIXES = [
+    "xapp",
+    "xdriver",
+    "xfont",
+    "xlib",
+    "xserver",
+    "xutil",
+    "xproto",
+]
+
+# From a Buildroot package name, try to see if a prefix should be
+# stripped from it. For example, passing "xapp_xlsfonts" as argument
+# to this function will return "xlsfonts".
+def buildroot_strip_prefix(dirname):
+    for prefix in BUILDROOT_PREFIXES:
+        if dirname.startswith(prefix + "_"):
+            return dirname[len(prefix) + 1:]
+    return dirname
+
+# From a Buildroot package name, parse its .mk file to find the
+# Buildroot version of the package by looking at the <foo>_VERSION
+# line.
+def buildroot_get_version(dirname):
+    f = open(os.path.join("package", "x11r7", dirname, dirname + ".mk"))
+    r = re.compile("^([A-Z0-9_]*)_VERSION = ([0-9\.]*)$")
+    for l in f.readlines():
+        m = r.match(l)
+        if m:
+            return m.group(2)
+    return None
+
+# Augment the informations of the X.org list of packages (given as
+# argument) by details about their packaging in Buildroot. Those
+# details are found by looking at the contents of package/x11r7/.
+def get_buildroot_pkgs(packages):
+    dirs = os.listdir(os.path.join(os.getcwd(), "package", "x11r7"))
+    for d in dirs:
+        # Skip exceptions
+        if d in BUILDROOT_EXCEPTIONS:
+            continue
+        pkgname = buildroot_strip_prefix(d)
+        version = buildroot_get_version(d)
+        if packages.has_key(pkgname):
+            # There is a X.org package of the same name, so we just
+            # add informations to the existing dict entry.
+            packages[pkgname]['br-version'] = version
+            packages[pkgname]['br-name'] = d
+        else:
+            # There is no X.org package with this name, so we add a
+            # new dict entry.
+            packages[pkgname] = { BR_VERSION_KEY: version,
+                                  BR_NAME_KEY : d }
+    return packages
+
+def show_summary(packages):
+    FORMAT_STRING = "%40s | %15s | %15s | %-30s"
+    print FORMAT_STRING % ("Package name", "Vers in BR", "Vers in X.org", "Action")
+    print FORMAT_STRING % ("-" * 40, "-" * 15, "-" * 15, "-" * 30)
+    pkgs = packages.keys()
+    pkgs.sort()
+    total_pkgs = 0
+    upgrade_pkgs = 0
+    add_pkgs = 0
+    remove_pkgs = 0
+    nothing_todo_pkgs = 0
+    for pkgname in pkgs:
+        pkg = packages[pkgname]
+        total_pkgs += 1
+        if pkg.has_key(XORG_VERSION_KEY) and not pkg.has_key(BR_VERSION_KEY):
+            xorg_version = pkg[XORG_VERSION_KEY]
+            br_version = "N/A"
+            action = "Add to Buildroot"
+            add_pkgs += 1
+        elif not pkg.has_key(XORG_VERSION_KEY) and pkg.has_key(BR_VERSION_KEY):
+            br_version = pkg[BR_VERSION_KEY]
+            xorg_version = "N/A"
+            action = "Remove from Buildroot"
+            remove_pkgs += 1
+        # For now, we assume that if a package version is different,
+        # it's because an upgrade is needed.
+        elif pkg[XORG_VERSION_KEY] != pkg[BR_VERSION_KEY]:
+            br_version = pkg[BR_VERSION_KEY]
+            xorg_version = pkg[XORG_VERSION_KEY]
+            action = "Upgrade"
+            upgrade_pkgs += 1
+        else:
+            br_version = pkg[BR_VERSION_KEY]
+            xorg_version = pkg[XORG_VERSION_KEY]
+            action = "-"
+            nothing_todo_pkgs += 1
+
+        print FORMAT_STRING % (pkgname, br_version.center(15), xorg_version.center(15), action)
+    print FORMAT_STRING % ("-" * 40, "-" * 15, "-" * 15, "-" * 30)
+    STAT_FORMAT_STRING = "%40s : %3d"
+    print STAT_FORMAT_STRING % ("Total number of packages", total_pkgs)
+    print STAT_FORMAT_STRING % ("Packages to upgrade", upgrade_pkgs)
+    print STAT_FORMAT_STRING % ("Packages to add", add_pkgs)
+    print STAT_FORMAT_STRING % ("Packages to remove", remove_pkgs)
+    print STAT_FORMAT_STRING % ("Packages with nothing to do", nothing_todo_pkgs)
+
+packages = get_xorg_release_pkgs()
+packages = get_buildroot_pkgs(packages)
+# print packages
+show_summary(packages)
+
-- 
1.7.9.5
