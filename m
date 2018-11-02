From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 14:45:25 +0000
Subject: [Buildroot] [Bug 11346] qt5base-5.11.1 Assertion failed: ret == 0
 after getentropy() inside fillBuffer() on arm
In-Reply-To: <bug-11346-163@https.bugs.busybox.net/>
References: <bug-11346-163@https.bugs.busybox.net/>
Message-ID: <bug-11346-163-xLIoI8OzVV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11346

--- Comment #6 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Thomas Petazzoni from comment #5)

I believe Qt is using the glibc function/wrapper [1] and is already
checking for availability of it [2] at configure time and further assumes
the running kernel supports it (no returning ENOSYS, maybe this part
could be improved on the qt side), or add the -no-feature-getentropy
to buildroot if the selected kerne does not support it?


[1] http://man7.org/linux/man-pages/man3/getentropy.3.html
[2] http://code.qt.io/cgit/qt/qtbase.git/tree/config.tests/unix/getentropy

-- 
You are receiving this mail because:
You are on the CC list for the bug.
