From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 24 Jun 2013 10:40:51 +0200
Subject: [Buildroot] [PATCHv3 0/5] tcl rework (was: make usb_modeswitch work
	with udev)
In-Reply-To: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1372063256-23292-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At first, the goal of this patch set was to add a symlink
tclsh->tclsh8.4 to make usb_modeswitch_dispatcher happy (it has a
shebang #!/usr/bin/tclsh).

While doing that, I saw some other problems (libtcl not stripped and
not into staging). Also, Thomas suggested (and coded it actually !) that
make condition should be used.
Hence, a bigger patchset.

Changes since v2:
	- drop the change of BR2_PACKAGE_TCL_SHLIB_ONLY option as commit
	d3e4db4 (usb_modeswitch: bump to version 1.2.6) already fixes
	the problem.

Changes since v1:
	- drop usb_modeswitch{,_data} version bumps patches as they are
	  already mainlined (thanks Gustavo for the heads up !)
	- use make conditions rather than shell conditions
	- drop the explicit strip
	- install the library into stating
	- make the library writable


Richard Genoud (5):
  tcl: use make conditions
  tcl: remove strip command
  tcl: install the libtcl into staging
  tcl: add a tclsh symlink
  tcl: make the libtcl writable in order to be stripped

 package/tcl/tcl.mk |   33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

-- 
1.7.10.4
