From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 May 2017 08:22:03 +0000
Subject: [Buildroot] [Bug 9886] Build fails with "unexpected EOF while
 looking for matching `"'" if PATH contains a newline
In-Reply-To: <bug-9886-163@https.bugs.busybox.net/>
References: <bug-9886-163@https.bugs.busybox.net/>
Message-ID: <bug-9886-163-DWfuvV9DhF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9886

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
             Status|NEW                         |ASSIGNED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Ciro,

Thanks for the report.

Indeed, having a \n in PATH is a bit stupid... :-/

I've sent a patch that detects that and fails early:
    https://patchwork.ozlabs.org/patch/764947/

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
