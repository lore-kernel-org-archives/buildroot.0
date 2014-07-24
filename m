From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jul 2014 15:09:30 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140724150930.E6AC99D2CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #18 from David Bachelart <david.bachelart@bbright.com> 2014-07-24 15:09:29 UTC ---
Hi,

The 900-musl-support.patch also breaks the pthread_exit() function in pure
C-code. I enclose two files :
- basic buildroot configuration, toolchain using gcc 4.8.1 / glibc 2.18 /
binutils 2.22
- basic C code creating a thread that kills itself using pthread_exit()

Using a toolchain built from master, the main process receives the SIGABRT
signal.

If I remove the 900-musl-support.patch and rebuild the whole buildroot, the
code exits normally.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
