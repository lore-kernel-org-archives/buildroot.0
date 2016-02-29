From: Pieter Smith <pieter@boesman.nl>
Date: Mon, 29 Feb 2016 09:01:58 +0100
Subject: [Buildroot] [v3,
 2/4] barebox: adds option to build secondary config
In-Reply-To: <56D0DF3B.1060305@mind.be>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-3-git-send-email-pieter@boesman.nl>
 <56D0DF3B.1060305@mind.be>
Message-ID: <20160229080158.GB18059@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 27, 2016 at 12:26:51AM +0100, Arnout Vandecappelle wrote:
> On 01/20/16 23:43, Pieter Smith wrote:
> > Support selection of secondary config, but version, source URL and patches are
> > shared with barebox bootloader build.

[snip]

>  So, if you remove the choice, then this config should stay and be called
> something like "build second Barebox configuration", with the help text from
> BR2_TARGET_BAREBOX_TWO_CONFIGS.
> 
>  And if the option of keeping barebox and just adding barebox-2 works out, then
> this can also go into a separate Config.in file in the barebox-2 directory,
> which is source'd from here.
> 
>  Also, it should be a menuconfig instead, since there are 5 entries.

ACK. Done. I also feel that each bootloader in the bootloader menu should be a
menuconfig item. Right now I find it hard to see the boundaries between
different bootloaders when options are used. But I won't try to solve the world
in a single patch series. ;-)

> > +
> > +if BR2_TARGET_BAREBOX_2
> > +
> > +choice
> > +	prompt "Type of configuration"
> > +	default BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
> > +
> > +config BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
> > +	bool "Using a defconfig"
> > +
> > +config BR2_TARGET_BAREBOX_2_USE_CUSTOM_CONFIG
> > +	bool "Using a custom config file"
> > +
> > +endchoice
> > +
> > +config BR2_TARGET_BAREBOX_2_BOARD_DEFCONFIG
> > +	string "Board defconfig"
> > +	depends on BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
> > +	help
> > +	  Name of the board for which Barebox should be built, without
> > +	  the _defconfig suffix.
> > +
> > +
> 
>  Spurious line here.

Oops. Thanks.

>  Regards,
>  Arnout

[snip]

- Pieter
