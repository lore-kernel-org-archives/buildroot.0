From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 10 Mar 2018 21:58:17 +0200
Subject: [Buildroot] [PATCH v4 1/4] imx-mkimage: new package
In-Reply-To: <20180309162604.73d98870@windsurf>
References: <1520065060-20046-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520065060-20046-2-git-send-email-karl.erik.larsson@gmail.com>
 <20180303164706.0084b2ec@windsurf.home>
 <CAPP7BN3ewrHnw2nUUO3UtOYG=+zv9hjEatg+y_7JRo4tOcv8qA@mail.gmail.com>
 <20180309162604.73d98870@windsurf>
Message-ID: <20180310195817.x4ipzhx47hgeoaja@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Mar 09, 2018 at 04:26:04PM +0100, Thomas Petazzoni wrote:
> On Sat, 3 Mar 2018 19:46:34 +0100, Erik Larsson wrote:
> 
> > > I'm not a big fan of the fact that this host package not does not
> > > install any host tool, but instead post-processes images created by
> > > other packages.
> > >
> > > Would it be possible for this package to just install host tools, and
> > > then have a post-image script that uses these host tools to provide the
> > > final flash.bin image ?  
> > 
> > This first version if this patch-serie did sort of that. It build and
> > installed host tools. And then they were used in post-image.sh. But
> > after a comments/suggestion from Baruch I got encouraged do it this
> > way. This solution is much clearer when reading the code then the
> > first version, but maybe with the drawback of this host-package not
> > really being a host-package as you stated. If you compare this
> > solution with the first you will see that there is a pretty convoluted
> > solution for doing parts that are in the Makefile och imx-mkimage. The
> > main problem here may be the fact that NXP put stuff in there Makefile
> > that rally doesn't have anything with the creation of the tool.
> 
> I think I really prefer the approach where the imx-mkimage package only
> installs a host tool, and then a post-image script that uses the host
> tool installed by imx-mkimage to post-process the images, and generate
> the final bootloader.

Erik has been quick to respin the series. The result is at

  http://lists.busybox.net/pipermail/buildroot/2018-March/215611.html

(not on patchwork). Now the gen_imx8_boot() shell function in the post image 
script duplicates the logic from the imx-mkimage Makefile to generate the boot 
image. Do you find this better?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
