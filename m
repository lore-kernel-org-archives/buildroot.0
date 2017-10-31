From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Oct 2017 16:44:16 +0000
Subject: [Buildroot] [Bug 10471] Building a mipsel kernel format vmlinuz (+
 gzip + initrd) generates non-compressed, non-bootable image
In-Reply-To: <bug-10471-163@https.bugs.busybox.net/>
References: <bug-10471-163@https.bugs.busybox.net/>
Message-ID: <bug-10471-163-7m1A9CzJL6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10471

--- Comment #5 from Alexander Enchevich <a.enchevich@gmail.com> ---
The git repo for Broadcom's stblinux 3.3 is
https://github.com/Broadcom/stblinux-3.3.git. However it can not be used as a
git URL directly because the kernel is not at the top level but dir down. The
version I used is latest at time of filing this bug (tag: stblinux-3.3-4.2).

To make this kernel compile with the standard buildroot gcc compiler and
binutils I made a patch, because there was a problem with binutils > v.2.24.51
not being able to mix hard- and softfloat FPU mode/instructions.

Also the the gzip compression option was ignored, for which there is also
patch.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
