From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Jun 2010 21:15:41 +0000 (UTC)
Subject: [Buildroot] [Bug 2119] Tries to build kernel,
	although disabled in config
In-Reply-To: <bug-2119-163@https.bugs.busybox.net/>
References: <bug-2119-163@https.bugs.busybox.net/>
Message-ID: <20100625211541.409AF8191D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2119

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
It's because you have BR2_TARGET_ROOTFS_INITRAMFS enabled and that depends on
building the kernel. But, granted, there is a bug: we shouldn't allow the
selection of initramfs if Linux kernel isn't enabled. I'll cook a patch to fix
this.

Thanks for the report!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
