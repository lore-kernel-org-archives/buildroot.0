From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 May 2014 20:23:32 +0000 (UTC)
Subject: [Buildroot] [Bug 6230] Cannot compile gcc without threads
	(uClibc-based)
In-Reply-To: <bug-6230-163@https.bugs.busybox.net/>
References: <bug-6230-163@https.bugs.busybox.net/>
Message-ID: <20140506202332.61C999CACE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6230

--- Comment #3 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2014-05-06 20:23:31 UTC ---
ARM nommu support is broken in general, there are several toolchain component
version restrictions that are currently unaccounted for.
Not only that but the toolchain build rules aren't properly done (the tuple is
wrong for example).

The problem is that Qemu doesn't emulate any usable (uc)linux hardware to test
with, and probably the most experienced devels who can help with this lack any
real nommu hardware that's tested with uclinux as a starting point.

Also it's probably more useful to work on modern ARM nommu support (Cortex M
series) but in general from some quick investigations i've done it's mostly
stuck with an oldish and heavily tweaked 2.6.33ish kernel.

So for ARM7TDMI who knows which kernel works properly.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
