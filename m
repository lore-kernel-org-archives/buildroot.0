From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Jan 2013 21:19:26 +0100
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
 *-config files
In-Reply-To: <1357847559-31530-2-git-send-email-stefan.froberg@petroprogram.com>
References: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357847559-31530-2-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20130110211926.564113ba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Thu, 10 Jan 2013 21:52:39 +0200, Stefan Fr?berg wrote:

> For example:
> 
> DIVINE_CONFIG_FIXUP = divine-config
> 
> or for multiple files:
> 
> IMAGEMAGICK_CONFIG_FIXUP = Magick-config Wand-config

I personally still believe that it is wrong to give just the filename
here and not the full path, i.e:

IMAGEMAGICK_CONFIG_FIXUP = \
	$(STAGING_DIR)/usr/bin/Magick-config \
	$(SATGING_DIR)/usr/bin/Wand-config

With just the filename, my impression is that it is just too much magic
happening behind the scene.

That said, I would not oppose to the current solution being integrated.
I'm just sharing a preference, not a strong opposition here.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
