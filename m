From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Dec 2015 23:09:40 +0000
Subject: [Buildroot] [Bug 8501] gunzip fails to uncompress files
In-Reply-To: <bug-8501-163@https.bugs.busybox.net/>
References: <bug-8501-163@https.bugs.busybox.net/>
Message-ID: <bug-8501-163-FLGSH7rMqn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8501

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git and will be part of 2015.11.1, thanks.

commit 63fdab6b4fcc860abd8dbc8342c7b01643a37e1a
Author: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date:   Tue Dec 1 21:30:29 2015 +0100

    busybox: add another upstream patch to fix (g)unzip

    0002-unzip.patch was added in 69516e0 to fix a segmentation fault in the
    gunzip applet.  However, it introduced a new issue that made the unzipping
    of some files fail.

    Add an upstream patch that fixes this new issue.

    Fixes #8501.

    Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Cc: Jason Rush <rush0033@hotmail.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
