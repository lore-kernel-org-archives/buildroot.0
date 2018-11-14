From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Nov 2018 08:50:05 +0100
Subject: [Buildroot] [PATCH] boot/syslinux: Fix build with glibc 2.23+
In-Reply-To: <20181114000205.9110-1-alexander.sverdlin@gmail.com>
References: <20181114000205.9110-1-alexander.sverdlin@gmail.com>
Message-ID: <20181114085005.63db5bf6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Nov 2018 01:02:05 +0100, Alexander Sverdlin wrote:
> When building with glibc 2.23+, the "major", "minor" and "makedev"

It is really since glibc 2.28 that there is a build issue related to
this. Prior to glibc 2.28, <sys/sysmacros.h> was implicitly included by
another header that was very commonly included, "hiding" the issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
