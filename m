From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Feb 2011 13:09:27 +0000 (UTC)
Subject: [Buildroot] [Bug 3259] Unable to build webkit (on arm).
In-Reply-To: <bug-3259-163@https.bugs.busybox.net/>
References: <bug-3259-163@https.bugs.busybox.net/>
Message-ID: <20110224130927.134EC8F715@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3259

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #4 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Created attachment 3019
  --> https://bugs.busybox.net/attachment.cgi?id=3019
Fixup icu-config

After trying a build on a system that completely lacks icu i've found the
issue.
icu-config checks for the library presence in exec_prefix, thus if the real
system lacks it (checks at /usr/lib, default) it fails.
So we need to tweak exec_prefix too in icu-config to point to the staging dir.

Give this patch a try, works on my ubuntu netbook (which took it's sweet time
to build).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
