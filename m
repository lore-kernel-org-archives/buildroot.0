From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 20:29:33 +0100
Subject: [Buildroot] [PATCH v4] More Qt5 stuff
Message-ID: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that add more Qt5 support in Buildroot. I
have built a number of different combinations, but there are some many
different possibilities, that I obviously couldn't test all of
them. Some testing will be appreciated, but for sure, only the
autobuilders will really help in getting a good build coverage of all
this.

In short:

 * Patches 1 to 8 extend the Qt5Base package with various features
   (OpenSSL, EGL, D-Bus, etc.)

 * Patch 9 creates a common variable to share the Qt5 version between
   all the Qt5 packages.

 * Patches 10 to 19 add more Qt5 libraries: Qt5Svg, Qt5Webkit,
   Qt5Script, and more.

 * Patch 20 fixes a build problem of Qt5Webkit when an OpenGLES
   backend is used (it forgets to add the right include paths).

 * Patch 21 makes Qt4 and Qt5 mutually exclusive.

Changes v3 -> v4:

 * Rebased on top of master (and therefore removed all the patches
   that have already been merged)
 * Removed the OpenSSL Qt5 specific option, and automatically enable
   OpenSSL support when the package is available. Requested by Peter
   Korsgaard.
 * Make Qt4 and Qt5 mutually exclusive. Suggested by Arnout
   Vandecappelle.

Changes v2 -> v3:

 * Drop patches that have been merged upstream.
 * Fix the xcb-util package to depend on libxcb.
 * Fix the xcb-util-wm package to depend on libxcb.
 * Bump the version of Qt5 to 5.0.1 (instead of 5.0.0)
 * Add patch from Floris Bos to fix Qt5Webkit build with an OpenGLES
   backend.
 * Fix QT5_BASE -> QT5BASE, noticed by Lionel Orry.
 * Add missing "depends on" in Qt5Quick, Qt5Multimedia and
   Qt5GraphicalEffects. They all select Qt5Declarative, which itself
   depends on the availability of an OpenGLES backend.

Changes v1 -> v2:

 * Make the package that depended on host-jpeg depend on host-libjpeg
   directly, so that we don't need to provide a virtual host-jpeg
   package.
 * Integrated patches from Floris Bos to fix issues related RPi
   OpenGLES/EGL libraries, and to get the installation of fonts done
   by the qt5base package.
 * pcre: fixed typo is -> if in commit log [Gustavo Zacarias]
 * pcre: fix help text in Config.in [Gustavo Zacarias]

The patches are also available from:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=qt5

Best regards,

Thomas
