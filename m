From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Sep 2018 16:00:49 +0000
Subject: [Buildroot] [Bug 11346] qt5base-5.11.1 Assertion failed: ret == 0
 after getentropy() inside fillBuffer() on arm
In-Reply-To: <bug-11346-163@https.bugs.busybox.net/>
References: <bug-11346-163@https.bugs.busybox.net/>
Message-ID: <bug-11346-163-7Z3ou8MgWC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11346

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Philipp Richter from comment #0)

From the getentropy() man page [1] I would suspect an errno 'ENOSYS - This
kernel version does not implement the getrandom(2) system call required to
implement this function.', your could verify this through additioanl debug
statements or strace?

[1] http://man7.org/linux/man-pages/man3/getentropy.3.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
