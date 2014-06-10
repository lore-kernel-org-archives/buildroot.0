From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 11:52:12 +0200
Subject: [Buildroot] How to provide one default skeleton per init system?
In-Reply-To: <20140610080123.GF9791@lukather>
References: <20140609211341.GB10459@ned>
	<20140610080123.GF9791@lukather>
Message-ID: <20140610115212.4f63938b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Ripard,

On Tue, 10 Jun 2014 10:01:23 +0200, Maxime Ripard wrote:

> > a) Move system/skeleton to system/skeleton/busybox, then add
> >    system/skeleton/systemd, and maybe system/skeleton/sysv. The menu in
> >    system/Config.in will be updated to select BR2_ROOTFS_SKELETON_BUSYBOX,
> >    or BR2_ROOTFS_SKELETON_CUSTOM.
> > b) Add a new virtual package: target-skeleton, with some providers:
> >    target-skeleton-busybox, target-skeleton-systemd and
> >    target-skeleton-custom (path to the custom skeleton would be handled in the
> >    configuration menu).
> 
> And you also have:
> 
>   c) Move the files in the skeleton at the package level. Each package
>      would be providing whatever file it needs and is not shared by
>      all the init systems.

I don't think (b) and (c) are mutually exclusive actually. We can
have a "skeleton" package that installs all the files that are common
to all situations, and then have busybox, systemd and sysvinit install
the files that they need.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
