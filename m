From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Mar 2011 13:51:26 +0000 (UTC)
Subject: [Buildroot] [Bug 2995] -fstack-protector-all causes ssh to SIGSEGV
In-Reply-To: <bug-2995-163@https.bugs.busybox.net/>
References: <bug-2995-163@https.bugs.busybox.net/>
Message-ID: <20110302135126.5727A8D3E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2995

--- Comment #5 from Andrew Beard <abeard@wabtec.com>  ---
I seem to be having the same problem on a proprietary Geode LX board I'm
working with.  I just updated to the 2011.02 and with uclibc 0.9.31 if I enable
stack protection all ssh related executables immediately cause a segfault. 
Disabling stack protection seems to alleviate the problem.

One thing I have found is that this problem does not seem to occur with uclibc
09.32-rc2, though.  With the new release candidate I can enable or disable
stack protection without causing a problem.  At this point we're still trying
to decide if we'd rather continue with a pre-release c library or without stack
protection.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
