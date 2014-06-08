From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  8 Jun 2014 14:21:43 +0000 (UTC)
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion and
 internal variables
In-Reply-To: <bug-7172-163@https.bugs.busybox.net/>
References: <bug-7172-163@https.bugs.busybox.net/>
Message-ID: <20140608142143.D858E9CF0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7172

--- Comment #3 from Mike Z <minimod@morethan.org> 2014-06-08 14:21:43 UTC ---
(In reply to comment #2)
> Not tested, but as $ORIGIN seems to be interpreted by make as ${O}RIGIN, then I
> guess using $$ORIGIN would work correctly, or if you prefer $${ORIGIN}.
> 
> This moves the responsibility of the correct escaping to the user, but as
> Samuel said there is no easy solution.
> 
> Once cleared out, we should document this in the manual though...
>

Sounds worth trying, will test and post (here) the results.

It is a rare use case, needing to get the ld.so tokens in BR_TARGET_LDFLAGS
to show up in the compiler command line as intended, but a valid one.

At the moment, the busybox package honors the setting of the 
"Target Linker Options" set in the config UI and the Lua package doesn't.
So those will be my test cases.

(and maybe fix the Lua package at the same time.)

Mike

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
