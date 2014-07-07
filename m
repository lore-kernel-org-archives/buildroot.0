From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jul 2014 19:18:57 +0000 (UTC)
Subject: [Buildroot] [Bug 7268] python 2.7 compilation issue
In-Reply-To: <bug-7268-163@https.bugs.busybox.net/>
References: <bug-7268-163@https.bugs.busybox.net/>
Message-ID: <20140707191857.A0DCF9D08D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7268

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-07-07 19:18:57 UTC ---
Ok, so the problem is due to the fact that for some reason in your case, Python
has added "-I/usr/include/x86_64-linux-gnu" to the CFLAGS used when building
target modules, which doesn't make sense. I don't have this flag added when
building here, which explains why it works.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
