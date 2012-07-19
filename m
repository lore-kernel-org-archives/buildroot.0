From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Jul 2012 07:57:07 +0000 (UTC)
Subject: [Buildroot] [Bug 5366] can't login (root or default)
In-Reply-To: <bug-5366-163@https.bugs.busybox.net/>
References: <bug-5366-163@https.bugs.busybox.net/>
Message-ID: <20120719075707.C385D96AB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5366

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-07-19 07:57:07 UTC ---
Can you try disabling BR2_PACKAGE_UTIL_LINUX_AGETTY=y and doing a full rebuild
(make clean; make) ?

We generally only use the getty program from Busybox, so if you use the getty
program from util-linux, there may be a need to adapt certain configuration
files.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
