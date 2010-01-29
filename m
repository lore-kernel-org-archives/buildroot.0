From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 29 Jan 2010 11:15:08 +0000 (UTC)
Subject: [Buildroot] [Bug 825] iperf configure error: cannot compute sizeof
	(bool)
In-Reply-To: <bug-825-163@https.bugs.busybox.net/>
References: <bug-825-163@https.bugs.busybox.net/>
Message-ID: <20100129111509.0CDBC77729@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=825


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2010-01-29 11:15:07 UTC ---
Some other package populates the config cache with the (presumably wrong) fact
that we have a bool type in C:

checking for bool... (cached) yes

If I try it (with an empty cache) I get:

checking for bool... no
checking size of bool... 0

So please provide more info about your setup (your buildroot .config)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
