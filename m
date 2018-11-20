From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 17:18:06 +0100
Subject: [Buildroot] [PATCH next v4 6/6] core: implement per-package SDK
 and target
In-Reply-To: <20181120112900.747747c8@windsurf>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-7-thomas.petazzoni@bootlin.com>
 <de9da9af-71f4-cfe2-f691-5aae17e3ca0a@andin.de>
 <20181116144735.19585727@windsurf>
 <CAAXf6LWM0dcCJSVTSerox320PWKkpPcOXORF2cTaWfHitgRguQ@mail.gmail.com>
 <20181116195741.GV10271@scaer>
 <10c54101-3264-eefb-58d0-4770ef723717@mind.be>
 <20181119114806.4fb9d98b@windsurf.home>
 <20181119194905.GC2601@scaer>
 <7f195412-448e-400f-0ba6-d710246c7656@mind.be>
 <20181120112900.747747c8@windsurf>
Message-ID: <20181120171806.7e90d9f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Nov 2018 11:29:00 +0100, Thomas Petazzoni wrote:

> >  Perhaps, though, we should have a more general strategy of a per-infra
> > definition of what the steps are, instead of having a fixed sequence of steps.
> > I.e., have a pattern that should be followed by an infra-specific step to make
> > sure things are done correctly. So, for the kconfig case we would have an extra
> > kconfig_fixup step (we already have the stamp file, but it's not a real step
> > with hooks and the KCONFIG_DEPENDENCIES were strapped on as an afterthought),
> > and for the autoreconf case we would have an extra autoreconf step (instead of a
> > hook).  
> 
> And so those "injected" steps should take care of preparing the
> per-package folder with whatever dependencies they need ?
> 
> This is probably something that can be done to fix the pkg-kconfig
> stuff without having to create a new "prepare" step in the generic
> infrastructure.

Just tried that and it works. It will be part of my v5, which I hope
to send either later today, worst case tomorrow. With this, I can run
"make linux-menuconfig" from a clean tree, and the KCONFIG_DEPENDENCIES
are properly copied to the linux per-package folder.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
