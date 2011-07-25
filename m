From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Jul 2011 08:08:12 +0000 (UTC)
Subject: [Buildroot] [Bug 3781] crosstool-ng-1.11.3 fails to build
In-Reply-To: <bug-3781-163@https.bugs.busybox.net/>
References: <bug-3781-163@https.bugs.busybox.net/>
Message-ID: <20110725080812.DDCD58B4A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3781

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #6)
> Then, I use arm-linux-readelf to check whether 'libuClibc-0.9.31.so' contains
> the symbol 'usleep'. And the answer is negative.
> 
> Why 'usleep.c' was not compiled?
> 
> BTW, erverything is ok when uClibc-0.9.30.3 was used.

You need to ensure that UCLIBC_SUSV3_LEGACY=y is set in your uclibc
configuration, otherwise uClibc isn't built with usleep support.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
