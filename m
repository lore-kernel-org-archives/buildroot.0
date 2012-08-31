From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Aug 2012 07:42:18 +0000 (UTC)
Subject: [Buildroot] [Bug 5486] libglib2 build fails on qsort r test
In-Reply-To: <bug-5486-163@https.bugs.busybox.net/>
References: <bug-5486-163@https.bugs.busybox.net/>
Message-ID: <20120831074218.62DB7994ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5486

--- Comment #4 from Sven Neumann <s.neumann@raumfeld.com> 2012-08-31 07:42:17 UTC ---
Shouldn't this be fixed already by the following commit ?

commit 78a5c27cc37f1d0453defa8d3f59762ca7f4c7ef
Author: Sven Neumann <s.neumann@raumfeld.com>
Date:   Wed Feb 29 07:05:49 2012 +0100

    libglib2: fix build with legacy uClibc versions

    qsort_r was only added in uClibc 0.9.33, so only enable it when we're sure
    it's available. For external/ctng toolchains we cannot easily know, so
    simply disable it there.

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
