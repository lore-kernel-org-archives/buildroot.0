From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Sep 2018 06:48:48 +0000
Subject: [Buildroot] [Bug 11366] [2018.08] SysV IPC not available for
 fakeroot on WSL
In-Reply-To: <bug-11366-163@https.bugs.busybox.net/>
References: <bug-11366-163@https.bugs.busybox.net/>
Message-ID: <bug-11366-163-uuHONRznSd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11366

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Please don't use ipcmk, as requiring to build host-util-linux is clearly not
nice.

Instead, we want a simple test program in C, that will be compiled/executed by
fakeroot configure.ac script, to decide whether SysV message queues or TCP
should be used. You can use autoconf AC_TRY_RUN() to achieve this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
