From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Dec 2018 10:38:31 +0000
Subject: [Buildroot] [Bug 11476] stdio2.h error invalid use of
 __builtin_va_arg_pack
In-Reply-To: <bug-11476-163@https.bugs.busybox.net/>
References: <bug-11476-163@https.bugs.busybox.net/>
Message-ID: <bug-11476-163-Mk8JPy4SqH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11476

--- Comment #9 from romain.naour at gmail.com ---
(In reply to Thomas Petazzoni from comment #8)
Hi Thomas,

The issue is fixed in Buildroot by this patch [1] that disable
BR2_FORTIFY_SOURCE_{1,2} for gcc < 6 (for internal toolchain only).
Upstream didn't answer my question if it's safe or not to backport this patch
to earlier version of gcc [2].

So, this bug is fixed for 2018.11.

[1]
https://git.buildroot.net/buildroot/commit/?id=a75ee0e8124023185f4a05e95b2fcd29fa9449d8
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?format=multiple&id=61164

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
