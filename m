From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Feb 2020 05:20:43 +0100
Subject: [Buildroot] [PATCH 1/4] boot/arm-trusted-firmware: Disable bin
 copy for rk3399
In-Reply-To: <CAMty3ZC-c0aazuTtKXF8U8B3w=_e8BeicG-hN=jLDCrqUxenFQ@mail.gmail.com>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
 <1581573151-18943-2-git-send-email-sunil@amarulasolutions.com>
 <20200213072350.vwly4eganmeq57mu@bars>
 <CAMty3ZC-c0aazuTtKXF8U8B3w=_e8BeicG-hN=jLDCrqUxenFQ@mail.gmail.com>
Message-ID: <20200214052043.6ab9688f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Feb 2020 13:36:53 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

> > >  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES
> > >       string "Binary boot images"
> > > -     default "*.bin"
> > > +     default "*.bin" if BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM!=rk3399
> > >       help
> > >         Names of generated image files that are installed in the
> > >         output images/ directory.  
> >
> > IIUC, it should be customized in your board defconfig.  
> 
> Not sure of it. Technically this is how rockchip SoC behaves wrt ATF
> build. If we mark BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="" to all
> supporting boards of  rockchip start with rk3399, rk3288 etc.. it
> ended up huge and meaningless change, IMHO.

Sergey is right here: I don't think we want to encode platform-specific
stuff like this in Kconfig files.

What is the problem if you leave this to the default of *.bin ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
