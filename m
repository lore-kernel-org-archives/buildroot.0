From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Feb 2011 21:00:09 +0000 (UTC)
Subject: [Buildroot] [Bug 3265] After enabling IPv6 support in the master
 configuration, uClibc has IPv6 disabled
In-Reply-To: <bug-3265-163@https.bugs.busybox.net/>
References: <bug-3265-163@https.bugs.busybox.net/>
Message-ID: <20110217210009.CBA318F5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3265

--- Comment #2 from faber at faberman.de  ---
I used uClibc 0.9.31.x, any more recent version fails to build with 

In file included from libc/stdlib/__cxa_finalize.c:8:
libc/stdlib/_atexit.c: In function '__cxa_finalize':
libc/stdlib/_atexit.c:203: error: '__result' undeclared (first use in this
function)
libc/stdlib/_atexit.c:203: error: (Each undeclared identifier is reported only
once
libc/stdlib/_atexit.c:203: error: for each function it appears in.)
libc/stdlib/_atexit.c:203: error: invalid lvalue in asm output 0
make[1]: *** [libc/stdlib/__cxa_finalize.os] Error 1

(even when disabling atexit)

But this is another issue, not related to this bug..


If it works on current snapshot version, then we can close this one.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
