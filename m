From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed, 16 Dec 2020 09:31:40 +0100
Subject: [Buildroot] Weird behaviour of pkgconf/pkg-config
Message-ID: <bc93457f-79f7-98b2-c1a9-3db590e07101@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have trouble with "pkgconf", which does not find "libjpeg" when
building "qt5webengine":

  $ host/bin/pkgconf --libs libjpeg
  Package libjpeg was not found in the pkg-config search path.
  Perhaps you should add the directory containing `libjpeg.pc'
  to the PKG_CONFIG_PATH environment variable
  Package 'libjpeg', required by 'virtual:world', not found

On the other hand, "pkg-config" works as expected:

  $ host/bin/pkg-config --libs libjpeg
  -Lhost/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/lib -ljpeg

At a closer look, "pkgconf" seems to search for the '*.pc" files in

  host/lib/pkgconfig/

while "pkg-config" looks into:

  host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/

Is that the indented behaviour? What am I doing wrong?

Wolfgang
