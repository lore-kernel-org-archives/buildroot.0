From: Dennis Schulmeister-Zimolong <buildroot@windows3.de>
Date: Sun, 8 Jul 2018 15:43:50 +0200
Subject: [Buildroot] One package with more than one CMakeLists.txt (dlib)
Message-ID: <20180708154350.225b3f7f4c1c0bcdc0a52195@windows3.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm currently trying to create a buildroot package for libdlib.
(http://dlib.net/). As dlib uses CMake the package definition itself is
straight-forward. However the source tree also contains a few utility
applications as well as python bindings which each come with their own
CMakeLists.txt.

What's the best way to deal with this? Right now my Config.in looks
like this:

config BR2_PACKAGE_LIBDLIB
	bool "libdlib"
	...

if BR2_PACKAGE_LIBDLIB

config BR2_PACKAGE_LIBDLIB_TOOLS_ARCHIVED
	bool "archived tools"
	help
	  Archived tools from the tools/archive directory inside
	  the dlib source tree

config BR2_PACKAGE_LIBDLIB_TOOLS_HTMLIFY
	bool "htmlify"
	help
	  Utility program htmlify from the tools/htmlify directory
	  inside the dlib source tree

...
endif

Is this even feasible? How can I execute CMake more than once with the
cmake-package infrastructure without reinventing the wheel. Or is it
better to define separate packages for each tool although they all live
in the same source tree?

Kind regards, Dennis
