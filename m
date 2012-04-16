From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Apr 2012 19:45:29 +0000 (UTC)
Subject: [Buildroot] [Bug 5006] make performs library lookup in the build
 and host library directores and not in the staging area
In-Reply-To: <bug-5006-163@https.bugs.busybox.net/>
References: <bug-5006-163@https.bugs.busybox.net/>
Message-ID: <20120416194529.EDF9096AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5006

Christoph Schulz <develop@kristov.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |

--- Comment #4 from Christoph Schulz <develop@kristov.de> 2012-04-16 19:45:29 UTC ---
(In reply to comment #3)
> The way we usually call make, this isn't needed:
> 
> $(MAKE) CC="$(TARGET_CC)" ...

Sorry, but that is plain wrong. You did not fully understand the problem I
described. The "-lcrypt" target is _not_ looked up in the staging area
_regardless_ how you specify CC. You may not have encountered this problem so
far as there are almost no Makefiles using this syntax. If some Makefile uses
"-l<lib>" as dependency, the Makefile is _not cross-compilable_ unless you
patch GNU make. The patches I attached solve the issue.


Regards,

Christoph Schulz

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
