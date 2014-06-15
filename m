From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Jun 2014 17:54:23 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140615175423.367039CFC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #5 from Krzysztof Wrzalik <kwrzalik@gmail.com> 2014-06-15 17:54:22 UTC ---
The difference between compiling with -static-libgcc seems to boil down to the
following function:

_Unwind_Find_FDE

When compiled with -statlic-libgcc the function invocation ends up in glibc.
When -static-libgcc is not given, then this function is located in libgcc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
