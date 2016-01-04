From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 04 Jan 2016 20:56:15 +0000
Subject: [Buildroot] [Bug 8581] pciutils.mk PCIUTILS_MAKE_OPTS typo
In-Reply-To: <bug-8581-163@https.bugs.busybox.net/>
References: <bug-8581-163@https.bugs.busybox.net/>
Message-ID: <bug-8581-163-1QTPYaYK9B@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8581

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Thanks, fixed in git by:

commit 85e2a87699f4f98d1b669576922581ae3bcac004
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Mon Jan 4 21:47:37 2016 +0100

    pciutils: correct dns disabling logic

    Fixes #8581

    Commit 2c879f95a0 (pciutils: cleanup) refactored the make arguments, but
    accidently changed the logic to disable dns based lookups to pass
    PCIUTILS_DNS=no instead of DNS=no, causing the autotection to be used.

    This autodetection looks at host includes, so it isn't safe for cross
    compilation.

    Disable it by setting the correct make variable instead.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
