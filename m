From: Jean-Claude Gervais <jc.gervais@videotron.ca>
Date: Thu, 15 Nov 2007 17:26:45 -0500
Subject: [Buildroot] Error because of mix of two different revisions of
	kernel?
Message-ID: <1195165605.28674.10.camel@mercury.sprymusic>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

	I'm getting an error building a system:

	After configuring and running make, the kernel gets compiled
successfully but the procedure terminates with an error.

	What I don't understand is this - I selected a specific kernel revision
- 2.6.23.1, but the error mentions the folder

project_build_arm/uclibc/root/lib/modules/2.6.22.10

	I may have selected that revision previously but changed to 2.6.23.1 so
some old data might be persisting and causing the problem, is the
solution to do a complete clean? That takes quite a while.

Thanks for the help.

Here is the output of the make:


[...]
  INSTALL net/unix/unix.ko
if [ -r System.map -a
-x /home/jgervais/Desktop/sandboxes/buildroot/build_arm/staging_dir/bin/arm-linux-depmod26 ]; then /home/jgervais/Desktop/sandboxes/buildroot/build_arm/staging_dir/bin/arm-linux-depmod26 -ae -F System.map -b /home/jgervais/Desktop/sandboxes/buildroot/project_build_arm/uclibc/root -r 2.6.23.1; fi
make[1]: Leaving directory
`/home/jgervais/Desktop/sandboxes/buildroot/project_build_arm/uclibc/linux-2.6.23.1'
rm
-f /home/jgervais/Desktop/sandboxes/buildroot/project_build_arm/uclibc/root/lib/modules/2.6.23.1/build
rm
-f /home/jgervais/Desktop/sandboxes/buildroot/project_build_arm/uclibc/root/lib/modules/2.6.23.1/source
/home/jgervais/Desktop/sandboxes/buildroot/build_arm/staging_dir/bin/arm-linux-depmod26 -b /home/jgervais/Desktop/sandboxes/buildroot/project_build_arm/uclibc/root 2.6.22.10
WARNING: Couldn't open
directory /home/jgervais/Desktop/sandboxes/buildroot/project_build_arm/uclibc/root/lib/modules/2.6.22.10: No such file or directory
FATAL: Could not
open /home/jgervais/Desktop/sandboxes/buildroot/project_build_arm/uclibc/root/lib/modules/2.6.22.10/modules.dep.temp for writing: No such file or directory
make: ***
[/home/jgervais/Desktop/sandboxes/buildroot/project_build_arm/uclibc/root/lib/modules/2.6.23.1/modules.dep] Error 1
