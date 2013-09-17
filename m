From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 20:37:26 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <522F8008.1000207@mind.be>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <522F8008.1000207@mind.be>
Message-ID: <20130917203726.5b02fe08@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 10 Sep 2013 22:24:40 +0200, Arnout Vandecappelle wrote:

> > +comment "eudev requires /dev mgmnt set to udev under System configuration"
> > +	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> > +
> > +comment "eudev not available with Systemd as init system"
> > +	depends on BR2_PACKAGE_SYSTEMD
> 
>   I think these comments are not really necessary. Actually, I would say 
> that the only reason that eudev has a user-visible Config option is for 
> the "enable all extras". And that config option is slightly redundant, 
> since the additional size of gudev is almost nothing compared to 
> libglib2, so you could just as well use an automatic dependency.

No, I disagree with this. There are some other packages (currently
udisks and network-manager) that explicitly need the udev extras. So I
believe it's useful for these packages to be able to 'select
BR2_PACKAGE_UDEV_ALL_EXTRAS'. Of course, they could 'select
BR2_PACKAGE_LIBGLIB2' and depend on udev, but this means that they have
internal knowledge of the fact that udev needs libglib2 to enable 'all
extras', an internal knowledge that could very well be broken if
tomorrow udev needs another dependency to build its 'all extras' things.

So, the BR2_PACKAGE_(E)UDEV_ALL_EXTRAS option should remain in place, I
believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
