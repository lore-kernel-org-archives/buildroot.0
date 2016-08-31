From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Aug 2016 19:32:49 +0000
Subject: [Buildroot] [Bug 7520] CodeSourcery toolchain ARM: C++11
 std::exception_ptr is not available for Cortex-A9 if thumb2 is not
 selected.
In-Reply-To: <bug-7520-163@https.bugs.busybox.net/>
References: <bug-7520-163@https.bugs.busybox.net/>
Message-ID: <bug-7520-163-HJAbYXvPrs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7520

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I'm proposing to call this a toolchain bug.

Indeed, the Linaro ARM toolchain is also compiled for Thumb-2, but using it for
an ARM configuration works just fine, including your example code.

The toolchain used for your example is based on gcc 4.8, and I'm not sure the
C++11 support was fully mature in gcc 4.8.

In order to fix your problem, we would have to disable the toolchain for
ARMv7-ARM, ARMv6-ARM, and possibly other useful configurations. So I'd prefer
to keep things as they are, and consider this a toolchain bug.

Of course, if you don't agree, feel free to re-open this bug. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
