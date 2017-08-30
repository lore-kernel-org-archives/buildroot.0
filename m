From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Aug 2017 01:50:09 +0000
Subject: [Buildroot] [Bug 10261] Grub2 fails to build for x86_64
In-Reply-To: <bug-10261-163@https.bugs.busybox.net/>
References: <bug-10261-163@https.bugs.busybox.net/>
Message-ID: <bug-10261-163-SDFFBKFJ3X@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10261

Erico Nunes <nunes.erico@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|unassigned at buildroot.uclibc |nunes.erico at gmail.com
                   |.org                        |

--- Comment #6 from Erico Nunes <nunes.erico@gmail.com> ---
It turns out that grub2 fails to build with BR2_SSP_ALL=y.
The following defconfig is enough to reproduce the issue:

BR2_x86_64=y
BR2_SSP_ALL=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_X86_64_EFI=y

We already had Bug 8946 in the past with a very similar issue and from which we
can borrow a solution. So I sent the following patch as an attempt to address
this issue before 2017.08 is cut out:
https://patchwork.ozlabs.org/patch/807377/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
