From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 17 Jan 2015 21:21:44 +0200
Subject: [Buildroot] [PATCH 1/1] cgic: new package
In-Reply-To: <1421425415-6601-1-git-send-email-codehero@gmail.com>
References: <1421425415-6601-1-git-send-email-codehero@gmail.com>
Message-ID: <20150117192144.GA2827@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Fri, Jan 16, 2015 at 11:23:35AM -0500, David Bender wrote:
> +CGIC_ENV = AR=$(TARGET_CROSS)ar \
> +	CC=$(TARGET_CROSS)gcc \
> +	RANLIB=$(TARGET_CROSS)ranlib

TARGET_CONFIGURE_OPTS already includes all these and more.

> +
> +define CGIC_BUILD_CMDS
> +	(cd $(@D); \
> +		$(CGIC_ENV) \
> +		make libcgic.a \
> +		)
> +endef

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
