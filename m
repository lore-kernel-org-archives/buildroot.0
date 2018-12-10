From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 22:02:04 +0100
Subject: [Buildroot] [PATCH] package/waf: purge trailig '/' from WAF_SITE
In-Reply-To: <8013501a-cffd-34e3-1fdd-1db64b51e4fe@mind.be>
References: <20181210184559.13181-1-casantos@datacom.com.br>
 <20181210204528.6cd1409d@windsurf>
 <8013501a-cffd-34e3-1fdd-1db64b51e4fe@mind.be>
Message-ID: <20181210220204.32874db6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Dec 2018 21:59:37 +0100, Arnout Vandecappelle wrote:

>  Because that check is within
> 
> ifeq ($$($$($(2)_KCONFIG_VAR)),y)
> ...
> endif
> 
> and these packages are host-only packages.

Aah, indeed.

>  It has to be within that condition, since the _SITE may be set only or
> differently based on kconfig options which are only set when the package is
> selected. I tested and it fails for instance on arm-trusted-firmware if that
> package is not selected.
> 
>  We need Config.in.host :-)

Hehe, yes, we do :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
