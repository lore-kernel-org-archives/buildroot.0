From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Mar 2013 21:22:42 +0100
Subject: [Buildroot] [PATCH v2] Add Qt5 packages
Message-ID: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that add Qt5 support in Buildroot. I have
built a number of different combinations, but there are some many
different possibilities, that I obviously couldn't test all of
them. Some testing will be appreciated, but for sure, only the
autobuilders will really help in getting a good build coverage of all
this.

In short:

 * Patch 1 improves our pcre package to add support for 16 bits and 32
   bits variants, need by Qt5.

 * Patches 2 to 4 bump the version or add new XCB-util packages that
   are needed to build the XCB backend of Qt5.

 * Patches 5 to 8 add virtual packages for OpenGLES, OpenVG and EGL,
   and make rpi-userland provide an implementation of those virtual
   packages, and do other related fixes to RPi OpenGLES/EGL support.

 * Patch 9 makes packages using host-jpeg use host-libjpeg instead so
   that we don't have to provide a virtual host-jpeg package.

 * Patch 10 converts the jpeg virtual package to a real package.

 * Patch 11 and 12 adds some basic infrastructure to support the Qt5
   packages.

 * Patch 13 adds the Qt5Base package.

 * Patches 14 to 23 extend the Qt5Base package with various features
   (GUI, OpenSSL, EGL, D-Bus, etc.)

 * Patch 24 creates a common variable to share the Qt5 version between
   all the Qt5 packages.

 * Patches 25 to 34 add more Qt5 libraries: Qt5Svg, Qt5Webkit,
   Qt5Script, and more.

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
