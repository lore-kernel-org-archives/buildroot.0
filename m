From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 May 2018 17:03:30 +0000
Subject: [Buildroot] [Bug 11036] C compiler cannot create executables
In-Reply-To: <bug-11036-163@https.bugs.busybox.net/>
References: <bug-11036-163@https.bugs.busybox.net/>
Message-ID: <bug-11036-163-vqZ7pyToYZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11036

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
OK. Could you try to provide a defconfig that exhibits the problem but does not
use your own private BR2_EXTERNAL tree, so that we could try to reproduce the
issue ?

Since it's the toolchain that is failing to build, normally only those options
would be needed to reproduce the problem:

BR2_arm=y
BR2_cortex_a8=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y

the other options should not affect the toolchain build, except if your patches
on gcc/binutils in $(BR2_EXTERNAL_BERNARDO_PATH)/board/bernardo/patches.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
