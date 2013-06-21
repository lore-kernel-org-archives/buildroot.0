From: richard.genoud at gmail.com <richard.genoud@gmail.com>
Date: Fri, 21 Jun 2013 13:56:56 +0200
Subject: [Buildroot] [PATCH 0/6] tcl rework (was: make usb_modeswitch work
	with udev)
In-Reply-To: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <51c43f99.ebbbb40a.0abf.ffffba01@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Richard Genoud <richard.genoud@gmail.com>

At first, the goal of this patch set was to add a symlink
tclsh->tclsh8.4 to make usb_modeswitch_dispatcher happy (it has a
shebang #!/usr/bin/tclsh).

While doing that, I saw some other problems (libtcl not stripped and
not into staging). Also, Thomas suggested (and coded it actually !) that
make condition should be used.
Hence, a bigger patchset.

Changes since v1:
	- drop usb_modeswitch{,_data} version bumps patches as they are
	  already mainlined (thanks Gustavo for the heads up !)
	- use make conditions rather than shell conditions
	- drop the explicit strip
	- install the library into stating
	- make the library writable

Richard Genoud (6):
  tcl: change BR2_PACKAGE_TCL_SHLIB_ONLY option
  tcl: use make conditions
  tcl: remove strip command
  tcl: install the libtcl into staging
  tcl: add a tclsh symlink
  tcl: make the libtcl writable in order to be stripped

 package/tcl/Config.in |   11 +++++------
 package/tcl/tcl.mk    |   33 ++++++++++++++++++++++++---------
 2 files changed, 29 insertions(+), 15 deletions(-)

-- 
1.7.10.4
