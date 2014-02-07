From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Feb 2014 14:52:49 +0000 (UTC)
Subject: [Buildroot] [Bug 6446] eglibc doesn't install ldconfig to target
In-Reply-To: <bug-6446-163@https.bugs.busybox.net/>
References: <bug-6446-163@https.bugs.busybox.net/>
Message-ID: <20140207145249.F22F29C8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6446

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-02-07 14:52:49 UTC ---
I agree that this is not a bug: there is no point in having ldconfig installed
to the target, since we don't support doing development on target. Therefore,
the ld.so.cache should be generated at build time, on the build machine.

That said, I believe there is a ldconfig problem: if none was found in the
cross-compilation toolchain, we use the one from the build machine, which is
wrong. But this is not per-se related to this bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
