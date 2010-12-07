From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Tue,  7 Dec 2010 13:36:49 -0800
Subject: [Buildroot] X-Loader support
Message-ID: <1291757810-11503-1-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The following patch adds support for the X-Loader bootloader. Using a tarball
extracted from http://gitorious.org/x-load-omap3/mainline I was able to produce
the X-Loader BIN and IFT images.

As explained in the commit message, support for the custom patch dir isn't
implemented yet. It should be very similar to what U-Boot does already using
patch-kernel.sh, but I didn't have the time to implement and test it yet so I
left it out of this first try.

Also, since this is outside of the package infrastructure, we can't use
non-wget download so only custom tarball is supported for now. I need to work
on the DOWNLOAD macro a bit more to allow for its use outside of the package
infrastructure (which is simply finding a way around the $(PKG) references).

Anyway, having support for X-Loader is a first step towards supporting the
BeagleBoard for example. Being able to source the Linux kernel from Git is
probably one of the next steps, too (relying on the improved DOWNLOAD macro).

- Maxime
