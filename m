From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 04 Jun 2017 09:40:41 +0000
Subject: [Buildroot] [Bug 9926] systemd-resolved.service: Failed at step
 NAMESPACE (systemd 233)
In-Reply-To: <bug-9926-163@https.bugs.busybox.net/>
References: <bug-9926-163@https.bugs.busybox.net/>
Message-ID: <bug-9926-163-RylQ05ljJf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9926

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Michael, All,

> The option TMPFS_POSIX_XATTR is not exisiting in my kernel

Indeed, this is an error.

If we look at the commit that introduced this line, we can see that the
help for systemd was also updated, and that it indeed references the
correct value:

   
https://git.buildroot.org/buildroot/commit/?id=4c10eedc103ba9648f73439f1ab5d801da9d2ed7

Thanks for the report!
I'll send a fix.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
