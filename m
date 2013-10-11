From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Oct 2013 10:04:39 +0200
Subject: [Buildroot] [PATCH] uboot: support -p option for mkenvimage
In-Reply-To: <CAHt8ZCNgAtSnbHZGv21Qw=OZZvBWUHRztOsFNNLAOHYfxu32Tw@mail.gmail.com>
References: <1381399545-30713-1-git-send-email-spdawson@gmail.com>
 <20131010170658.68908aae@skate>
 <CAHt8ZCNgAtSnbHZGv21Qw=OZZvBWUHRztOsFNNLAOHYfxu32Tw@mail.gmail.com>
Message-ID: <20131011100439.2f743226@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Fri, 11 Oct 2013 08:47:20 +0100, Simon Dawson wrote:

> I have been using a crappy script to generate a u-boot environment
> image, and that script was padding with 0x00 bytes instead of 0xff
> (which is the default used by the mkenvimage tool). Having looked into
> this a bit more, it appears that the 0xff padding works just fine in
> my particular use case.
> 
> So, I no longer consider this patch necessary, and cannot provide a
> justification for it.

Ok.

> I have, however, found that I need to pass the -r (redundant
> environment) flag to mkenvimage; so I propose exposing that flag in
> the Buildroot menu.

Right, -r is needed for some U-Boot configurations, so having a config
knob for it makes sense.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
