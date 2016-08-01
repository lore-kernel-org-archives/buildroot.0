From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 01 Aug 2016 08:36:16 +0000
Subject: [Buildroot] [Bug 9121] gst1-imx for i.MX6 compile failed,
 cannot find PXP, IPU and other errors
In-Reply-To: <bug-9121-163@https.bugs.busybox.net/>
References: <bug-9121-163@https.bugs.busybox.net/>
Message-ID: <bug-9121-163-NuQcdg7nmu@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9121

--- Comment #3 from Gary Bisson <gary.bisson@boundarydevices.com> ---
Hi,

Can you share you defconfig? It looks like the issue is that the kernel used
isn't a NXP kernel which is why the PXP/IPU headers are missing.

But the fact that the PXP/IPU headers are missing isn't really a problem, it
should just not compile the plugins for it. The issue is that the
imxv4l2videosrc plugin also relies on some V4L2 IOCTL that are only found on
NXP kernels.

An update to the gst1-imx package will be made soon in order to select each
plugin individually, we can then make v4l2src plugin depend on kernel too with
a comment that says it requires a NXP-specific kernel.

Regards,
Gary

-- 
You are receiving this mail because:
You are on the CC list for the bug.
