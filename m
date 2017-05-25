From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 May 2017 13:16:22 +0000
Subject: [Buildroot] [Bug 9876] aarch64 support with gcc 4.8 toolchain
In-Reply-To: <bug-9876-163@https.bugs.busybox.net/>
References: <bug-9876-163@https.bugs.busybox.net/>
Message-ID: <bug-9876-163-ox8zrs5kZf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9876

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
For custom external toolchains, we simply let the user specify which gcc
version the toolchain uses, and check that at the beginning of the build. We
don't try to prevent the user from using an unsupported gcc version depending
on the selected architecture, and I don't think we want to go down this route.
Especially since custom external toolchain quite often use vendor-specific gcc
versions that are patched to support additional features/processors, and
unnecessarily restricting the set of gcc versions to use would not be very
nice. For example, a patched gcc 4.8 could very well support lp64.

So I don't think we'll try to solve this problem.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
