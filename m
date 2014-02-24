From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Feb 2014 08:24:26 +0000 (UTC)
Subject: [Buildroot] [Bug 6842] Checking external toolchain for eabihf
In-Reply-To: <bug-6842-163@https.bugs.busybox.net/>
References: <bug-6842-163@https.bugs.busybox.net/>
Message-ID: <20140224082426.7162E9B97B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6842

--- Comment #7 from Stefan S?rensen <stefan.sorensen@spectralink.com> 2014-02-24 08:24:25 UTC ---
(In reply to comment #4)

> I haven't got the bottom of this problem yet, but I have indeed reproduced it,
> and I continue to believe that the fix is *not* to change the external
> toolchain check, but instead to investigate *why* the uClibc crt1.o does not
> have those flags when built with the internal toolchain backend.

The attributes are added by the compiler, not the assembler. glibc has both c
and assembler source for crt1.o while uclibc has only assembler source.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
