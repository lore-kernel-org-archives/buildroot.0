From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Mar 2012 12:27:37 +0000 (UTC)
Subject: [Buildroot] [Bug 4958] Qt 4.7.4 build crashes with Linux 2.6.29
In-Reply-To: <bug-4958-163@https.bugs.busybox.net/>
References: <bug-4958-163@https.bugs.busybox.net/>
Message-ID: <20120321122737.671A395417@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4958

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-03-21 12:27:37 UTC ---
There's not much we can do about this. Qt requires this accept4 system call,
which isn't available in 2.6.29, so it doesn't build if the kernel headers of
such kernel version are used.

What would like us to do here?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
