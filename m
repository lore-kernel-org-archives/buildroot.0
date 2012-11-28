From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 28 Nov 2012 16:12:25 +0200
Subject: [Buildroot] [git commit branch/next] package: add gd package
In-Reply-To: <87lidlzunw.fsf@dell.be.48ers.dk>
References: <20121128011244.B677B8F461@busybox.osuosl.org>
 <20121128052616.GA29377@sapphire.tkos.co.il>
 <87lidlzunw.fsf@dell.be.48ers.dk>
Message-ID: <20121128141224.GA5693@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Nov 28, 2012 at 06:09:07AM -0800, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
> Hi,
> 
>  >> +GD_TOOLS_                         	+= gdlib-config
> 
>  Baruch> Shouldn't this be 'GD_TOOLS_y'?
> 
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_ANNOTATE)	+= annotate
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_BDFTOGD)	+= bdftogd
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_GD2COPYPAL)	+= gd2copypal
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_GD2TOGIF)	+= gd2togif
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_GD2TOPNG)	+= gd2topng
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_GDCMPGIF)	+= gdcmpgif
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_GDPARTTOPNG)	+= gdparttopng
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_GDTOPNG)	+= gdtopng
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_GIFTOGD2)	+= giftogd2
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_PNGTOGD)	+= pngtogd
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_PNGTOGD2)	+= pngtogd2
>  >> +GD_TOOLS_$(BR2_PACKAGE_GD_WEBPNG)	+= webpng
>  >> +
>  >> +define GD_REMOVE_TOOLS
>  >> +	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(GD_TOOLS_))
> 
>  Baruch> And here.
> 
> No - The makefile installs everything, so I need to remove all programs
> NOT enabled (and gdlib-config is never needed).

I see. I got confused by the inverted logic. Thanks for the explanation.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
