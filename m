From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Oct 2014 11:52:00 +0200
Subject: [Buildroot] [PATCH v2 3/3] imx-usb-loader: new package
In-Reply-To: <542D1130.1050508@lucaceresoli.net>
References: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
 <1412175826-9010-4-git-send-email-luca@lucaceresoli.net>
 <20141001181626.64e6ef08@free-electrons.com>
 <542D1130.1050508@lucaceresoli.net>
Message-ID: <20141002115200.2b6486d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Thu, 02 Oct 2014 10:47:44 +0200, Luca Ceresoli wrote:

> Yes. The only indication in getopt.[hc] is:
> 
>    License: LGPL
> 
> and nothing else. This means LGPL (ant version), it is the list of
> licenses documented on the BR manual.
> 
> BTW, the LGPL license is declared in BR for pppd and tslib as well.

Ok.

> > Also: what about having this package enabled by default in the sabresd
> > defconfigs, if it makes sense to have this host tool enabled for those
> > configurations?
> 
> My plan is slightly more ambitious indeed. What I have in mind is to:
>   1. enable imx-usb-loader for both SABRESD boards;
>   2. prepare the configuration files that imx_usb_loader needs to boot
>      the device;
>   3. document how to boot using imx_usb_loader + the config files.

Sounds like a good plan.

> 
> Step 1 is trivial.
> 
> For step 2 I'll have generate two files: imx_usb.conf (the top-level
> config file for imx_usb) and mx6_usb_work.conf (different for the two
> SoC variants). The former can be taken as is from the imx_usb_loader
> sources, the latter must be edited as described in Vincent's tutorial
> [1], at section "Prepare your payload and configuration".
> 
> I think the best way is to use a post-image script to create these
> files in output/images, except they are not images. Does this sound
> fine?

Yes, it sounds fine. From my point of view output/images is not
necessarily strictly limited to binary images. It can also contain
other files that are useful to run/flash the system on the target.

Though do you really need to generate those files? They look like
pretty much static configuration files, that could be put in
board/freescale/<foo>/, no?

> If step 2 is well done, the actions to boot the device would be as
> simple as:
> 
>    ./output/host/usr/bin/imx_usb -c output/images

Cool!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
