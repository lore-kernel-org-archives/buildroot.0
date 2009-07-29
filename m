From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Jul 2009 15:07:31 +0000 (UTC)
Subject: [Buildroot] [Bug 497] OpenSSL RSA key generation hangs on x86_64
In-Reply-To: <bug-497-163@https.bugs.busybox.net/>
References: <bug-497-163@https.bugs.busybox.net/>
Message-ID: <20090729150731.45306777FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=497





--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-07-29 15:07:30 UTC ---
You're right.

There are two solutions to fix the issue. The first solution is to use $(ARCH),
as you suggested. ARCH is defined by project/Makefile.in. The second solution
if to change the test to be

ifeq ($(BR2_ARCH),"x86_64")

note the double quotes around x86_64.

Not sure which one is best, though.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
