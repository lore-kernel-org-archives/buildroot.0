From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sun, 16 Nov 2014 23:33:59 +0100
Subject: [Buildroot] [PATCH v2 00/13] Add Xorg support for imx6
In-Reply-To: <CADCpmyNT+VH8==NvuJm8wOZ3xSa4Xjm6QJaRFm_TZduihhA05g@mail.gmail.com>
References: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
 <20141116083345.GA8150@n411z>
 <CADCpmyNT+VH8==NvuJm8wOZ3xSa4Xjm6QJaRFm_TZduihhA05g@mail.gmail.com>
Message-ID: <18420074.Oyhpzo8KGq@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 16 November 2014 00:37:53 Gary Bisson wrote:
> Adding Jerome...
> 
> On Sun, Nov 16, 2014 at 12:33 AM, Gary Bisson <bisson.gary@gmail.com> wrote:
> > Jerome,
> > 
> > I've been able to build and test this set of patches on my i.MX6Q
> > SabreLite board (nitrogen6x defconfig).
> > Everything is running fine although I only tried:
> > - Starting X server
> > - Launching xterm
> > - Launching Vivante 3D examples
> > 
> > Regarding X, I've used the following configuration:
> > https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xor
> > g-xserver/xserver-xf86-config/mx6/xorg.conf
> > 
> > However I have a few questions regarding the patches:
> > - 05/13: gpu-viv-bin-mx6q: make fb/x11 choice explicit
> > 
> >   - Not sure to get the use case here. Are people interested in having
> >   fb libs on a X system?
In fact, yes I think. During development, many developers try fb and Xorg to 
know which one match best for theirs objectives. I think, it is easy to make a 
mistakes without this patch. 

In add, I think I will add wayland support in future. I found easier to select 
explicitly back-end.

> > - 06/13: gpu-viv-bin-mx6q: change output selection mecanism
> > 
> >   - s/mecanism/mechanism
> >   - Are the symbolic links changes related to the output selection? I
> >   would
> >   have seen this as part of the "04/13: gpu-viv-bin-mx6q: fix GLESv2
> >   support"
> >   patch

Patch 04 fix a bug, while patch 06 is a style change. However, I admit patch 
description is not well chosen.

> > Other than that it looks good. There's one test I haven't done yet: 
> > rebuild a system without X making sure 3D is still working.
[...]


Thanks for the test and the review.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
