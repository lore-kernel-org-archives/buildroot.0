From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Aug 2014 20:08:44 +0000 (UTC)
Subject: [Buildroot] [Bug 6950] Full unicode support in ncurses
In-Reply-To: <bug-6950-163@https.bugs.busybox.net/>
References: <bug-6950-163@https.bugs.busybox.net/>
Message-ID: <20140812200844.0A4919D41E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6950

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
   Target Milestone|2014.08                     |2014.11

--- Comment #5 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2014-08-12 20:08:43 UTC ---
Jeremy's patch http://patchwork.ozlabs.org/patch/360317/ is mostly ok but it
doesn't consider the static lib scenario as mentioned in the thread.

I've run an allyespackageconfig with ncursesw enabled and fixed some packages,
however nano needs a patch http://patchwork.ozlabs.org/patch/367145/ that
depends on the config option being present (hence not committed yet).

I can respin Jeremy's patch if he doesn't do or just add a fix patch after his
one is committed for the static libs (+nano ncursesw).

This is all pretty safe according to my tests, however the usual policy is no
feature patches in release candidate (frozen) state, so i'm defering this to
the 2014.11 milestone.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
