From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  5 Oct 2015 06:28:09 +0000 (UTC)
Subject: [Buildroot] [Bug 8386] build failed with external toolchain
In-Reply-To: <bug-8386-163@https.bugs.busybox.net/>
References: <bug-8386-163@https.bugs.busybox.net/>
Message-ID: <20151005062809.370C17FAA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8386

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> 2015-10-05 06:28:08 UTC ---
indeed, it is broken since yesterday. Fixed by:

commit ccdb179d24a2d99ce4f3078bfcd2ffee5af60701
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Mon Oct 5 08:25:17 2015 +0200

    toolchain-wrapper.c: unbreak BR_CROSS_PATH_ABS handling

    Fixes #8386

    We should check if BR_CROSS_PATH_ABS is defined, not if it evalutates to
    true for the pre processor.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
