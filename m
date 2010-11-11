From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Nov 2010 15:19:07 +0000 (UTC)
Subject: [Buildroot] [Bug 2785] mtd-utils build fails due to missing libmtd
In-Reply-To: <bug-2785-163@https.bugs.busybox.net/>
References: <bug-2785-163@https.bugs.busybox.net/>
Message-ID: <20101111151907.CDF3B8DCC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2785

Patrick Ziegler <patrick.ziegler@fh-kl.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Target Milestone|---                         |2010.11

--- Comment #2 from Patrick Ziegler <patrick.ziegler@fh-kl.de>  ---
Buildroot version: 2010.11-rc1

If only ubi tools shall be build from mtd-utils, the libmtd.a will not be build
but is in fact a dependency of some ubi tools (e.g. ubiattach).

The previous attached patch fixes this problem for me by building libmtd.a
explicit as soon as an ubi tool shall be build.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
