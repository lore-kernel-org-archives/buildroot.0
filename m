From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 Aug 2017 17:04:57 +0000
Subject: [Buildroot] [Bug 10161] unable to build u-boot.imx reliably
In-Reply-To: <bug-10161-163@https.bugs.busybox.net/>
References: <bug-10161-163@https.bugs.busybox.net/>
Message-ID: <bug-10161-163-8d0b88CX1L@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10161

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
Without any other evidence, we can only assume it's an issue with the U-Boot
build system. And something that is very hard to fix at the Buildroot level:
since we don't know which U-Boot version is being used, we can't easily patch
it.

I have done a quick review of the Makefile for imx in the U-Boot source, and it
looks good to me. But you haven't really given sufficient information to
pinpoint the problem. You should try to reproduce with V=1 so we get usable
output. And also try to reproduce outside of Buildroot - should be easy, you
basically just have to run 'make CROSS_COMPILE=... ARCH=arm ..._defconfig; make
CROSS_COMPILE=... ARCH=arm V=1 u-boot.imx'.

Or perhaps it only happens when you try to build u-boot.imx and u-boot-dtb.imx
in parallel?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
