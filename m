From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Jul 2020 02:49:18 +0000
Subject: [Buildroot] [Bug 13081] host-e2fsprogs attempts to create udev
 rules.d on build host if not exists
In-Reply-To: <bug-13081-163@https.bugs.busybox.net/>
References: <bug-13081-163@https.bugs.busybox.net/>
Message-ID: <bug-13081-163-VgwjFVY0f0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13081

--- Comment #1 from Christian Stewart <christian@paral.in> ---
Seems like the /usr/lib/systemd/system path also leaks:

making install in scrub
        MKDIR_P /usr/lib/udev/rules.d
       iMKDIR_P /usr/lib/systemd/system
/bin/mkdir: cannot create directory '/usr/lib/systemd/system': Permission
denied

-- 
You are receiving this mail because:
You are on the CC list for the bug.
