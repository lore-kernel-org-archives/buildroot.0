From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Jul 2017 18:42:10 +0000
Subject: [Buildroot] [Bug 9916] qt5 does not build on
 arm-buildroot-linux-uclibcgnueabihf for ARMv8 cores
In-Reply-To: <bug-9916-163@https.bugs.busybox.net/>
References: <bug-9916-163@https.bugs.busybox.net/>
Message-ID: <bug-9916-163-vfY4UMaf0T@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9916

--- Comment #2 from Ivan <ivan.nazarenko@gmail.com> ---
Sorry if I did not get it. I am sort of a newbie.

Downloaded from git yesterday, selected the default raspberrypi3_defconfig,
QT5.8, GCC 6.4, musl, binutils 2.28. The built stopped in qt5base in the same
file above, for apparently the same reason:

tools/qhash.cpp:148:54: error: attribute(target("+crc")) is unknown
 static uint crc32(const Char *ptr, size_t len, uint h)

But the patch that you mentions "need to backport" seems already applied in the
sources in output/build/host-binutils-2.28! At least the files the patch is
supposed to change are already in the changed form.

So I did not get what is needed to solve this build issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
