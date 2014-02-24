From: Charles Manning <cdhmanning@gmail.com>
Date: Mon, 24 Feb 2014 14:33:49 +1300
Subject: [Buildroot] What's the buildroot attitude to u-boot building?
In-Reply-To: <20140222001309.143e02f7@skate>
References: <CAE21AQqMQmKKL0=Q55P2zQhV8+iBdpX416xK+SgZd3+ONi8Mgg@mail.gmail.com>
 <20140222001309.143e02f7@skate>
Message-ID: <201402241433.49892.manningc2@actrix.gen.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 22 February 2014 12:13:09 Thomas Petazzoni wrote:
> Dear Charles Manning,
>
> On Fri, 21 Feb 2014 14:53:06 +1300, Charles Manning wrote:
> > I am having a look at adding some stuff to generate a signed pre-loader
> > for the SoCFPGA architecture.
>
> As you can see, some people are already working on supporting the
> SoCKit platform, which uses the SoCFPGA architecture.

Yes, I am watching that closely and I hope to be able to contribute.

>
> > There seem to be two options to doing this:
> > 1) Have it fall out of building u-boot (probably the best option once the
> > patches I'm pushing into u-vboot have settled down)
> > 2) Make an independent build like xloader (probably a better interum
> > solution), since for now the SocFPGA preloader building is still somewhat
> > haphazard and needs a magic version of u-boot.
>
> I'm not sure to understand here. A defconfig for a SoCFPGA platform was
> submitted today, and a single build of U-Boot produces both the
> pre-loader and the real U-Boot image.

That is right, it does produce an SPL image, but what is produced by 
u-boot/master is currently rubbish code that does not execute. It is only 
about 4k instead of about 45k.

These issues are being worked on.

>
> > For instance, why are there things like  BR2_TARGET_UBOOT_ETHADDR?
> > Overriding elements of the u-boot config header by patching over them
> > from a complete different config system (buildroot) seems to be asking
> > for trouble.
>
> Why is this asking for trouble?

Well when you're trying to set up a u-boot environment, it makes sense to do 
this in one place surely? If you do some settings in one place and others 
elsewhere, you need to dig deeper to find which has precedence etc.

>
> Anyway, I agree that these tuning options for U-Boot are a bit weird.
> Since in U-Boot there is no separation between the configuration and
> the definition of the hardware platform, most people should patch
> U-Boot if they want to change their configuration.
>
> Options such as BR2_TARGET_UBOOT_ETHADDR have been here for many many
> years, and we have simply kept them over time. It was added back in
> June 2007.

Why would I want to set it here and not in the u-boot config header file where 
the other stuff is configured?

>
> While I don't find it particularly pretty, I kind of fail to see what
> troubles you think it could cause. Could you give more details about
> this?

I have used buildroot in the past to generate u-boot + MLO and have just 
ignored these special options, using my u-boot config instead.

Now I am looking at adding some configs, or working with existing ones, to add 
SOCFPGA handling. so I wanted to understand why things were done as they are 
so that I could do a better job.

Since there are also some socfpga patches in the pipe, I will look at those 
and try to play along with them.

Thanks

Regards

Charles
