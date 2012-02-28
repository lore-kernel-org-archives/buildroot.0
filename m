From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Feb 2012 22:57:32 +0000 (UTC)
Subject: [Buildroot] [Bug 4808] ccache may build against wrong zlib
In-Reply-To: <bug-4808-163@https.bugs.busybox.net/>
References: <bug-4808-163@https.bugs.busybox.net/>
Message-ID: <20120228225732.C451590BB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4808

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-02-28 22:57:32 UTC ---
Unfortunately, I don't think the patch works properly: host-zlib will try to
use ccache before it has been built. If you want to do this, you have to ensure
that host-zlib is built with HOSTCC_NOCCACHE instead of HOSTCC, just like
ccache itself.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
