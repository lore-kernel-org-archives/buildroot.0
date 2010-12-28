From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Dec 2010 22:59:17 +0000 (UTC)
Subject: [Buildroot] [Bug 3007] kexec doesn't build: Missing regdef.h file
In-Reply-To: <bug-3007-163@https.bugs.busybox.net/>
References: <bug-3007-163@https.bugs.busybox.net/>
Message-ID: <20101228225917.F10AC8EE38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3007

--- Comment #1 from Andy Kennedy <andy.kennedy@adtran.com>  ---
After further playing, I have found that for kexec to build properly, one needs
to bring the regdef.h file from the Linux Kernel (in the case of mips that
would be:  arch/mips/include/asm/regdef.h)  There are some interesting ifdef's
around sections of the one that is under the toolchain included files.  There
are about 3 different versions of this file -- the one in the kernel source is
the only one I can make work with kexec.

Andy

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
