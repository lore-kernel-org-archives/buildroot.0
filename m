From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Dec 2015 21:41:51 +0000 (UTC)
Subject: [Buildroot] [Bug 8346] wf111 package removes all kernel module
	dependencies
In-Reply-To: <bug-8346-163@https.bugs.busybox.net/>
References: <bug-8346-163@https.bugs.busybox.net/>
Message-ID: <20151201214151.A953B8028C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8346

--- Comment #1 from Martin <martin@barkynet.com> 2015-12-01 21:41:51 UTC ---
I have managed to reproduce this issue using qemu_x86_64_defconfig in the
2015.11 release.  My initial tests seem to show it's related to using uclibc.

To reproduce the npm crash do the following:

1) start with qemu_x86_64_defconfig
2) add the C++ compiler
3) enable node.js version 0.12.7
4) enable npm for the target
5) build and run in qemu as per the instructions in
board/qemu/x86_64/readme.txt
6) login and type npm -v, it will crash.

Changing the toolchain from uclibc to glibc causes npm to start working. So as
a work around use glibc.  I'll try and narrow down the issue further.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
