From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 11:17:38 +0100
Subject: [Buildroot] [PATCH v2] lynx: new package
In-Reply-To: <20171213084341.0cc77602@windsurf.png.is.keysight.com>
References: <20171212184128.29536-1-mlang@blind.guru>
 <20171213084341.0cc77602@windsurf.png.is.keysight.com>
Message-ID: <20171218111738.17d223f2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Dec 2017 08:43:41 +0100, Thomas Petazzoni wrote:

> package/slang/Config.in:1:error: recursive dependency detected!
> package/slang/Config.in:1:	symbol BR2_PACKAGE_SLANG is selected by BR2_PACKAGE_NCURSES
> package/ncurses/Config.in:1:	symbol BR2_PACKAGE_NCURSES is selected by BR2_PACKAGE_SLANG
> configuration written to /home/thomas/projets/buildroot/.config
> 
> It's not clear from the log, but I guess it's because the mc package
> does it the other way around: select slang if !ncurses.
> 
> So, I've changed your lynx package to also do select slang if !ncurses.
> I had to propagate the BR2_USE_MMU dependency of slang to lynx as a
> consequence.

We have some build failures on lynx:

  http://autobuild.buildroot.net/?reason=lynx-2.8.9dev.16

I'm adding Matt Weber in Cc since so far the 3 failures all occurred on
his autobuilder, so it might be related to his setup.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
