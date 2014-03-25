From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 Mar 2014 07:31:16 +0000 (UTC)
Subject: [Buildroot] [Bug 6986] Make legal-info fails on uboot versions
	before 2014.01
In-Reply-To: <bug-6986-163@https.bugs.busybox.net/>
References: <bug-6986-163@https.bugs.busybox.net/>
Message-ID: <20140325073116.748AF9C384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6986

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> 2014-03-25 07:31:15 UTC ---
Like I mentioned above, this is currently not possible with the legal info
infrastructure. Some packages have multiple license files, so it's difficult to
come up with a simple syntax for optional filenames.

Instead I have fixed it for u-boot by simply copying the license file from the
old location to the new after extracting it:

commit 2e628372d34d9e77727185aaf47c82a439a22244
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Tue Mar 25 07:18:15 2014 +0100

    uboot: unbreak legal info for legacy versions

    Fixes #6986

    Prior to u-boot 2013.10, the GPL license text was stored in COPYING and not
    Licenses/gpl-2.0.txt, breaking legal-info.

    Work around it by simply copying the file from the old location to the new
    if present.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

That commit should apply cleanly to 2014.02. Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
