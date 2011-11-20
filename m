From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 20 Nov 2011 08:02:11 +0000 (UTC)
Subject: [Buildroot] [Bug 4021] uClibc: undefined reference to
	`__GI___errno_location'
In-Reply-To: <bug-4021-163@https.bugs.busybox.net/>
References: <bug-4021-163@https.bugs.busybox.net/>
Message-ID: <20111120080211.9A1B98F5D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4021

Mike Frysinger <vapier@gentoo.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|CLOSED                      |REOPENED
                 CC|                            |uclibc-cvs at uclibc.org
          Component|Other                       |Other
         Resolution|FIXED                       |
         AssignedTo|unassigned at buildroot.uclibc |unassigned at uclibc.org
                   |.org                        |
            Product|buildroot                   |uClibc

--- Comment #7 from Mike Frysinger <vapier@gentoo.org> 2011-11-20 08:02:11 UTC ---
uClibc master branch is still using HIDDEN_JUMPTARGET (like it should be).  the
proposed patch is wrong imo and really shouldn't be in buildroot, but i'll let
the BR guys worry about that.

why is your libc/misc/internals/__errno_location.c not being compiled with this
symbol ?  it should look like:
$ readelf -sW libc/misc/internals/__errno_location.os  | grep FUNC
     8: 0000000000000000     8 FUNC    WEAK   HIDDEN     1
__GI___errno_location
    11: 0000000000000000     8 FUNC    WEAK   DEFAULT    1 __errno_location

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
