From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 13:52:18 +0000 (UTC)
Subject: [Buildroot] [Bug 4868] Buildroot compile failure for
 toolchain/gdb-7.4/intl/relocatable.c
In-Reply-To: <bug-4868-163@https.bugs.busybox.net/>
References: <bug-4868-163@https.bugs.busybox.net/>
Message-ID: <20130526135218.E27A49A579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4868

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 13:51:09 UTC ---
Since commit 7ea1e92bdd9acf6cd5b021e61a18703e27885426, we're no longer passing
-fPIC -DPIC when building on x86_64. So the particular piece of gdb code that
was causing the build failure is no longer used because it is enclosed in #if
defined PIC && defined INSTALLDIR.

Since the problem can no longer be hit when building gdb from Buildroot, I
don't believe it's really worth carrying the gdb patch.

Thanks for your bug report! Do not hesitate to reopen if you disagree with the
solution.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
