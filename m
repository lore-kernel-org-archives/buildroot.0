From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 10:39:52 +0100
Subject: [Buildroot] [PATCH] xz: bump version to 5.2.0
In-Reply-To: <1420469870-50256-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1420469870-50256-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150107103952.315f0422@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 5 Jan 2015 14:57:50 +0000, Vicente Olivert Riera wrote:

> -XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2

[...]

> +XZ_SOURCE = xz-$(XZ_VERSION).tar.xz

I had to revert this part. On systems where xz is not installed
system-wide, we build the host-xz package. However, if the xz package
itself downloads an xz tarball, we have no way of uncompressing it.
This has caused some autobuilder failures on one machine, so I've
reverted this part, and we're now using again .bz2 tarballs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
