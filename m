From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 May 2017 15:00:55 +0000
Subject: [Buildroot] [Bug 9916] qt5 does not build on
 arm-buildroot-linux-uclibcgnueabihf for ARMv8 cores
In-Reply-To: <bug-9916-163@https.bugs.busybox.net/>
References: <bug-9916-163@https.bugs.busybox.net/>
Message-ID: <bug-9916-163-pKnhJis6XR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9916

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This happens only when you select an ARMv8 core, and is caused by a bug in
binutils. We need to backport
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=27e5a270962fb92c07e7d476966ba380fa3bb68e
in our binutils package. Haven't had the time to do this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
