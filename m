From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 09:30:54 +0000 (UTC)
Subject: [Buildroot] [Bug 5480] Choose default kernel configuration
 depending on the current architecture selected.
In-Reply-To: <bug-5480-163@https.bugs.busybox.net/>
References: <bug-5480-163@https.bugs.busybox.net/>
Message-ID: <20130526093054.3F9239A576@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5480

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 09:29:44 UTC ---
I believe that the current behavior is the one that we want. The kernel
configuration is something that's highly specific to the target hardware, so we
can't just chose some arbitrary kernel configuration for each particular
architecture. I very much prefer the current behavior in which the user is
warned that he should set a kernel configuration, rather than the behavior
proposed by the patch, where Buildroot would automatically select some random
configuration, the user will not notice, try to boot the kernel on whatever
hardware, and see it not boot at all.

Also, if we would be doing that for the kernel, we would have to do that for
U-Boot and Barebox. And for bootloaders, the fact that we can't decide a good
"default" configuration for each particular architecture is well known.

The only thing we /might/ do is define the default kernel configuration to be
i386 for i386 and x86_64 for x86-64, since those two architectures have only
one single kernel defconfigs. But for the other architectures, I don't think it
makes sense.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
