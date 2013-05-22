From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 08:58:04 +0200
Subject: [Buildroot] [PATCH 1/2] mxs-bootlets: add support for custom
 patches
In-Reply-To: <519C60D6.5040207@mind.be>
References: <1368905110-23303-1-git-send-email-gustavo@zacarias.com.ar>
 <519C60D6.5040207@mind.be>
Message-ID: <20130522085804.5dbbbf4b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 22 May 2013 08:08:22 +0200, Arnout Vandecappelle wrote:

> > +config BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR
> > +	string "custom patch dir"
> > +	help
> > +	  If your board requires custom patches, add the path to the
> > +	  directory containing the patches here. The patches must be
> > +	  named mxs-bootlets-<something>.patch.
> > +
> > +	  Most users may leave this empty
> > +
> 
>   Now that we have BR2_GLOBAL_PATCH_DIR, I would prefer to avoid adding 
> config options like this... Admittedly, for bootloaders it is more likely 
> that custom patches are needed than for any other package. But even so, 
> the global patch dir is sufficient, it is quite useable, and it reduces 
> complexity in the buildroot core.

This means that a defconfig would have to define a value for
BR2_GLOBAL_PATCH_DIR, in this particular case. Is this something we
really want?

Also, what about the existing *_CUSTOM_PATCH_DIR config options we have
for Linux, U-Boot, Barebox and a bunch of other boot/kernel packages?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
