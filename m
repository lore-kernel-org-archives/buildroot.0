From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Feb 2014 17:37:22 +0000 (UTC)
Subject: [Buildroot] [Bug 6842] Checking external toolchain for eabihf
In-Reply-To: <bug-6842-163@https.bugs.busybox.net/>
References: <bug-6842-163@https.bugs.busybox.net/>
Message-ID: <20140223173722.678DF9B92A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6842

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-02-23 17:37:22 UTC ---
(In reply to comment #3)
> Investigated it further: there are no problems when eglibc is used, only with
> uclibc.

Correct.

> 
> A grep for 'hard' or "EABI" in the uclibc-0.9.33.2 sources shows nothing
> relevant, so I assume eabihf is not supported by uclibc.

I don't think the C library needs anything to "support" eabihf. eabihf is all
about a change in the calling convention of functions taking floating point
arguments.

I haven't got the bottom of this problem yet, but I have indeed reproduced it,
and I continue to believe that the fix is *not* to change the external
toolchain check, but instead to investigate *why* the uClibc crt1.o does not
have those flags when built with the internal toolchain backend.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
