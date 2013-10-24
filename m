From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Oct 2013 17:18:31 +0000 (UTC)
Subject: [Buildroot] [Bug 6602] ebtables 64 bit kernel + 32 bit userland
 alignment error - fix included
In-Reply-To: <bug-6602-163@https.bugs.busybox.net/>
References: <bug-6602-163@https.bugs.busybox.net/>
Message-ID: <20131024171832.1C14F9B9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6602

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-10-24 17:18:31 UTC ---
Can you test if -DKERNEL64_USERSPACE_32 is enough?
-DEBT_MIN_ALIGN=8 is used/meant for sparc64 which doesn't handle unaligned
memory accesses.
Regards.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
