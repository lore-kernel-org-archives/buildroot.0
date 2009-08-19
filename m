From: Daniel Mack <daniel@caiaq.de>
Date: Thu, 20 Aug 2009 00:13:42 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com>
	<20090819214237.534c433f@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
Message-ID: <20090819221342.GB19257@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 19, 2009 at 04:19:35PM -0400, H Hartley Sweeten wrote:
> On Wednesday, August 19, 2009 12:43 PM, Thomas Petazzoni wrote:
> >
> > Do you compile your kernel with Buildroot, or do you compile it
> > manually ? If compiled manually, is CONFIG_AEABI enabled in your kernel
> > configuration ?
> 
> The kernel and rootfs are both created with Buildroot.
> 
> For the kernel config I have:
> 
> CONFIG_AEABI=y
> CONFIG_OABI_COMPAT=y

Just a side note: for performance reasons, you shouldn't enable
OABI_COMPAT unless you really can't know which binaries the kernel will
execute.

See http://wiki.debian.org/ArmEabiPort for some more details.

Other than that, your problem could also be related to VFP emulation
issues. I had such awhile back.

Daniel
