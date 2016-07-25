From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Jul 2016 18:38:34 +0000
Subject: [Buildroot] [Bug 8931] segment fault when compile argp-help.c using
 aarch64-buildroot-linux-gnu-gcc
In-Reply-To: <bug-8931-163@https.bugs.busybox.net/>
References: <bug-8931-163@https.bugs.busybox.net/>
Message-ID: <bug-8931-163-hSep9XqqPV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8931

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I've just tested:

BR2_aarch64=y
BR2_GLIBC_VERSION_2_22=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

Which is a AArch64, gcc 4.9.3, glibc 2.22 defconfig, and it builds just fine
for me with the current master (9068fe0dea774fb35620b31f71b51e663b35167b).

Since the bug submitter did not provide the Buildroot .config, we're not able
to reproduce, so I'm closing this bug. Do not hesitate to reopen if the problem
still exists.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
