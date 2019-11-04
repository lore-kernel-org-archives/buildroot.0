From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 04 Nov 2019 21:29:03 +0000
Subject: [Buildroot] [Bug 11366] [2018.08] SysV IPC not available for
 fakeroot on WSL
In-Reply-To: <bug-11366-163@https.bugs.busybox.net/>
References: <bug-11366-163@https.bugs.busybox.net/>
Message-ID: <bug-11366-163-SMqK18SE3v@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11366

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #12 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by:
https://git.buildroot.org/buildroot/commit/?id=fd1bcce9894773d7e1c1ca5be0f04b0b32128a1d

commit fd1bcce9894773d7e1c1ca5be0f04b0b32128a1d
Author: Matt Weber <matthew.weber@rockwellcollins.com>
Date:   Mon Sep 16 22:58:14 2019 -0500

    package/fakeroot: test for SYSV IPC support

    fakeroot can be built to either use SYSV IPC or TCP for message passing.

    A bug was discovered where Microsoft Windows 10 Services for Linux
    doesn't include support for SYSV IPC MsgQ.  This patch adds support to
    detect this case and automatically build fakeroot to use the TCP
    transport instead (It is assumed a TCP transport would definitely have
    more overhead then MsgQs so the default wasn't changed to TCP).

    Fixes
    https://bugs.busybox.net/show_bug.cgi?id=11366

    Cc: Yann E. MORIN <yann.morin.1998@free.fr>
    Signed-off-by: Jean-Francois Doyon <jfdoyon@gmail.com>
    Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
    [Arnout: use a post-patch hook and AUTORECONF=YES]
    Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
