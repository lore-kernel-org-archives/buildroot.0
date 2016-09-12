From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Sep 2016 15:07:44 +0000
Subject: [Buildroot] [Bug 8901] gcc failes to build if fortran is enabled
In-Reply-To: <bug-8901-163@https.bugs.busybox.net/>
References: <bug-8901-163@https.bugs.busybox.net/>
Message-ID: <bug-8901-163-yXObjjcLBK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8901

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
The original patches from Samuel indeed did not fix the build issue on ARM
indeed. But in fact the patches from Samuel have not been committed upstream
as-is, but were improved to take into account the fact that libquadmath only
exists on i386 and x86_64. libquadmath is only copied if
BR2_TOOLCHAIN_HAS_LIBQUADMATH and BR2_TOOLCHAIN_HAS_LIBQUADMATH is only "y" on
i386 and x86_64.

I just tested qemu_arm_versatile_defconfig + Fortran supported enabled, and it
builds fine.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
