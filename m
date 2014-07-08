From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  8 Jul 2014 11:51:25 +0000 (UTC)
Subject: [Buildroot] [Bug 7268] python 2.7 compilation issue
In-Reply-To: <bug-7268-163@https.bugs.busybox.net/>
References: <bug-7268-163@https.bugs.busybox.net/>
Message-ID: <20140708115125.194569D1CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7268

--- Comment #9 from David <buildroot-2014@inbox.com> 2014-07-08 11:51:23 UTC ---
Hi,

A few more details about this issue...

A git bisect identifies 7e960dc9 as the first "bad" commit : I manage to
compile python using revision 577e52ac, but I do not using revision 7e960dc9.

7e960dc9da56d4a484b5480746aaf617ca491274 is the first bad commit
commit 7e960dc9da56d4a484b5480746aaf617ca491274
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Thu Feb 13 21:48:53 2014 +0100

    python: bump to 2.7.6

    Even though jumping from 2.7.3 to 2.7.6 looks like a minor version
    bump, it is in fact a fairly significant one, because a good number of
    changes to help cross-compilation have been merged into Python
    upstream. Therefore, most of our patches are affected by this change.

    In detail, this commit:

     * Renames all the patches to follow the naming convention of patches
       in Buildroot: the patch file names should not have any version
       number.

     * The patches numbered above 100, that add configuration options to
       disable certain modules of the Python standard library, are only
       renamed and slightly adapted, they didn't change that much.

     * The patches numbered below 100 are almost entirely rewritten: many
       of the cross-compilation problems that used to exist in Python
       2.7.3 no longer exist, and the number of remaining problems is
       smaller, and can be fixed with smaller patches.

    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

:040000 040000 8618414254d7998096c5c87b7774cbd50217cb08
ddcec6a08dbe50e52973f7659789200593fe6861 M    package

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
