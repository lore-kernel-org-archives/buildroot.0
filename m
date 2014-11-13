From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Nov 2014 10:45:43 +0000 (UTC)
Subject: [Buildroot] [Bug 7646] strftime on datetime not works on python3.
In-Reply-To: <bug-7646-163@https.bugs.busybox.net/>
References: <bug-7646-163@https.bugs.busybox.net/>
Message-ID: <20141113104543.93CBDB01CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7646

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-13 10:45:43 UTC ---
So wcsftime() is broken in uClibc. It's not a Buildroot bug, but a uClibc bug.
We can workaround it for Python 3 by telling Python explicitly to not use
wcsftime().

We would need to test if uClibc master is affected or not. If it isn't, then we
should backport the patch. It it is, then we should report the bug to upstream
uClibc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
