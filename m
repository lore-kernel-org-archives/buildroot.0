From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Tue, 24 Sep 2019 10:21:58 +0200
Subject: [Buildroot] [PATCH 0/5 v3] openrc: further itegration (branch
 yem/openrc)
In-Reply-To: <20190923231240.3690e2c4@windsurf>
References: <cover.1564920849.git.yann.morin.1998@free.fr>
 <20190923231240.3690e2c4@windsurf>
Message-ID: <20190924082158.tbxjx6pxvfjpuctm@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-09-23 23:12:40, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun,  4 Aug 2019 14:14:15 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Micha? ?yszczek (5):
> >       package/skeleton-init-openrc: add support for starting sysv scripts
> >       package/skeleton-init-openrc: add support to remount rootfs as rw
> >       package/openrc: add support for spawning getty
> >       package/netifrc: new package
> >       package/netifrc: add support for BR2_SYSTEM_DHCP
> 
> Thanks a lot, I've applied the series. There was an issue on PATCH 4/5
> though, so I'll reply to that.
> 
> When I test this series, with Busybox, there are a few errors at boot
> time related to loadkeys, dumpkeys and kbd_mode being missing:
> http://code.bulix.org/39k5v9-881711?raw. Can we do something about
> this? This was on a machine with no screen/keyboard, i.e console over
> serial port.

This looks like some keyboard related programs were not installed, and in
this case those keyboard scripts should not be installed I reckon, as it
seems pointless to set keyboard mapping if system does not have keyboard
installed.

I suspect bug in Kconfig, missing deps, I will look at it today.

> Also, would it be possible to add a test case for OpenRC in
> support/testing/tests/init/ ?

Sure, once openrc is fully merged (as in there is no more changes during
review) I will write those tests.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190924/5ac2093f/attachment.asc>
