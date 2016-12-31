From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Dec 2016 02:08:27 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-chqqX0cYDa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #19 from bilge at scriptfusion.com ---
Peter, I think the point is that it does not matter whether `env` exists on the
host or not; it must exist on the target in order for NPM to function on the
target. Ergo, BusyBox must be built before NPM, which it is incidentally, but
this is not guaranteed since there is no dependency constraint between NPM and
BusyBox (or any other provider of `env`).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
