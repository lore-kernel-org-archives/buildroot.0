From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Sep 2019 13:33:13 +0000
Subject: [Buildroot] [Bug 12186] Raspberry Pi Zero-W build fails on newer
 kernel versions
In-Reply-To: <bug-12186-163@https.bugs.busybox.net/>
References: <bug-12186-163@https.bugs.busybox.net/>
Message-ID: <bug-12186-163-KiW99zw45C@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12186

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Unless I'm mistaken, there is no bug. Our current RPi0w defconfig works fine,
and it's only when you change it to use a different kernel version that it no
longer builds. But this is obviously not a bug: if you tweak a part of a
defconfig, you may need to also adjust other parts of that defconfig. In this
specific example, if newer versions of the kernel have renamed the Device Tree
for the platform, obviously the list of Device Trees that Buildroot will
build/install should be updated accordingly.

Of course, let me know if I misunderstood. Don't hesitate to reopen the bug in
such a case.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
