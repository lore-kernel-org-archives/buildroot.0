From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jul 2014 19:04:59 +0000 (UTC)
Subject: [Buildroot] [Bug 4021] uClibc: undefined reference to
	`__GI___errno_location'
In-Reply-To: <bug-4021-163@https.bugs.busybox.net/>
References: <bug-4021-163@https.bugs.busybox.net/>
Message-ID: <20140724190459.1DACA9D2E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4021

Bernhard Reutner-Fischer <aldot@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #8 from Bernhard Reutner-Fischer <aldot@uclibc.org> 2014-07-24 19:04:58 UTC ---
hidden weak handling is unfortunately pretty broken in recent gcc. Since (IIRC)
c++ and/or TLS handling elsewhere started to rely on this broken behaviour
chances are low that it will be fixed (as in behaviour of previous gcc
reinstated). An alternative was applied as
00f425b39b9258a78df47cebdd0d2c779753392f and the earlier
acfc107a50344b100b9ea492678928acc047c6ae

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
