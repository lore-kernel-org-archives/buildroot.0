From: Paul Cercueil <paul@crapouillou.net>
Date: Fri, 20 Dec 2013 16:33:42 +0100
Subject: [Buildroot] [PATCH 0/2] Drop X11 dependency of libpthread-stubs and
	libdrm
Message-ID: <1387553624-6780-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'pthread-stubs' package was recently renamed to 'xlib_libpthread-stubs'.
This makes sense as libpthread-stubs is part of the X libraries.

However, this package does not have any real dependency, not even X11.
This is inconsistent with the current package, which can only be enabled
when BR2_PACKAGE_XORG7 is selected.

The first patch renames the 'xlib_libpthread-stubs' package into
'libpthread-stubs', and moves it to 'Libraries -> Other' in the config
menu.

The second patch applies to libdrm, and removes the dependency towards X11,
if no X11-specific driver was selected. This permits to build the Mesa3d
library without X11.
