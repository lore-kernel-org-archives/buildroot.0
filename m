From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 28 Nov 2012 07:26:17 +0200
Subject: [Buildroot] [git commit branch/next] package: add gd package
In-Reply-To: <20121128011244.B677B8F461@busybox.osuosl.org>
References: <20121128011244.B677B8F461@busybox.osuosl.org>
Message-ID: <20121128052616.GA29377@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Nov 27, 2012 at 11:21:06AM -0800, Peter Korsgaard wrote:

[...]

> +GD_TOOLS_                         	+= gdlib-config

Shouldn't this be 'GD_TOOLS_y'?

> +GD_TOOLS_$(BR2_PACKAGE_GD_ANNOTATE)	+= annotate
> +GD_TOOLS_$(BR2_PACKAGE_GD_BDFTOGD)	+= bdftogd
> +GD_TOOLS_$(BR2_PACKAGE_GD_GD2COPYPAL)	+= gd2copypal
> +GD_TOOLS_$(BR2_PACKAGE_GD_GD2TOGIF)	+= gd2togif
> +GD_TOOLS_$(BR2_PACKAGE_GD_GD2TOPNG)	+= gd2topng
> +GD_TOOLS_$(BR2_PACKAGE_GD_GDCMPGIF)	+= gdcmpgif
> +GD_TOOLS_$(BR2_PACKAGE_GD_GDPARTTOPNG)	+= gdparttopng
> +GD_TOOLS_$(BR2_PACKAGE_GD_GDTOPNG)	+= gdtopng
> +GD_TOOLS_$(BR2_PACKAGE_GD_GIFTOGD2)	+= giftogd2
> +GD_TOOLS_$(BR2_PACKAGE_GD_PNGTOGD)	+= pngtogd
> +GD_TOOLS_$(BR2_PACKAGE_GD_PNGTOGD2)	+= pngtogd2
> +GD_TOOLS_$(BR2_PACKAGE_GD_WEBPNG)	+= webpng
> +
> +define GD_REMOVE_TOOLS
> +	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(GD_TOOLS_))

And here.

> +endef

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
