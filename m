From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Sep 2018 15:28:30 +0000
Subject: [Buildroot] [Bug 11366] [2018.08] SysV IPC not available for
 fakeroot on WSL
In-Reply-To: <bug-11366-163@https.bugs.busybox.net/>
References: <bug-11366-163@https.bugs.busybox.net/>
Message-ID: <bug-11366-163-3qKa1AFHZx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11366

--- Comment #8 from J.F. <jfdoyon@gmail.com> ---
See recently attached files.

This will need to be tested on a normally functioning linux host with SysV IPC
Message Q's running. Notably, use ipcs to make sure the message Q is cleaned up
properly after the test. The code is there and quite simple, but I can't test
it.

Also, the autoreconf setup is a little out of the ordinary, due to some
out-of-the ordinary libtool requirements by fakeroot it seems.

This now works cleanly on current Ubuntu for WSL.

Let me know if you have more suggestions for improvements?

Cheers,
J.F.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
