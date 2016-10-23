From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Oct 2016 13:39:34 +0000
Subject: [Buildroot] [Bug 9251] Shared C++ libraries for Microblaze results
 in Segmentation Fault
In-Reply-To: <bug-9251-163@https.bugs.busybox.net/>
References: <bug-9251-163@https.bugs.busybox.net/>
Message-ID: <bug-9251-163-s7t2OlzJ3S@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9251

--- Comment #3 from scotttimothye at johndeere.com ---
Changing to binutils 2.25 does not correct the problem.  I just repeated the
original steps below, altering step 2) to include selection of binutils 2.25.1
during the menuconfig.  Further, I also enabled Host Utilities > host qemu >
Enable system emulation.

I built everything from scratch against the latest Buildroot repo
(446debc47ef42db10e96973355f441da7685929a) and launched qemu (Buildroot built
v2.7.0).  Trying to run the simple ./hello program resulted in a segmentation
fault.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
