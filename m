From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Nov 2009 19:48:40 +0000 (UTC)
Subject: [Buildroot] [Bug 701] make install problem with unstripped binaries
In-Reply-To: <bug-701-163@https.bugs.busybox.net/>
References: <bug-701-163@https.bugs.busybox.net/>
Message-ID: <20091122194840.F33D9777D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=701


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org>  2009-11-22 19:48:39 UTC ---
(In reply to comment #0)
> Hi,
> 
> when BR2_STRIP_none=y, I get this error :

It would normally make sense to enable BR2_ENABLE_DEBUG (build packages with
debugging symbols) if you want unstripped binaries. If that is done, then
libglib2 will use the make install-exec target instead, which doesn't call
strip.

But ok, if shouldn't break anyway, so I'll fix the 'true' argument in git -
Thanks.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
