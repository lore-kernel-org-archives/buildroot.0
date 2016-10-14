From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Oct 2016 21:47:54 +0000
Subject: [Buildroot] [Bug 9356] gdb package
In-Reply-To: <bug-9356-163@https.bugs.busybox.net/>
References: <bug-9356-163@https.bugs.busybox.net/>
Message-ID: <bug-9356-163-FKQRlvNVhM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9356

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
I take it you refer to the recent issue installing gdb(server)? That is now
fixed in git by:

commit 8ae8d1162d92f14a0445fc497f473fde0aee6c3c
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Fri Oct 14 19:32:43 2016 +0200

    gdb: unbreak host/target install step

    Commit 12306a81f8edc (gdb: get rid of host-texinfo dependency) tried to
    append MAKEINFO=true to the host/target make install arguments, but as the
    default values for these are only added when (host-)autotools-package is
    evaluated (and only if empty), this effectively drops the default values
and
    we ended up without the 'install' target and nothing got installed.

    To fix this, specify the full install arguments.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
