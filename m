From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:16:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/gcc: add support for D language
In-Reply-To: <663f4e52-ac32-1375-c135-0f7c3fa12803@mind.be>
References: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
 <20190929165601.20269-3-eric.le.bihan.dev@free.fr>
 <20190930230422.7a7d1173@windsurf.home>
 <20191001055614.GA31145@ned>
 <20191001085605.501edf8e@windsurf.home> <20191006151228.GA5258@ned>
 <20191007091021.216e00b5@windsurf.home>
 <663f4e52-ac32-1375-c135-0f7c3fa12803@mind.be>
Message-ID: <20191007231630.6f5f0744@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 7 Oct 2019 23:09:28 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > config BR2_TOOLCHAIN_CAN_SUPPORT_DLANG
> > 	bool
> > 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
> > 	depends on BR2_TOLCHAIN_USES_GLIBC
> > 	default y if BR2_arm
> > 	default y if BR2_x86_64
> > 	default y if ...
> > 
> > and then re-use that for both the internal and external toolchain cases.  
> 
>  Nack that. An external toolchain may use a gcc branch that does support
> additional architectures or a different libc or a gcc version < 9. So for the
> external toolchain, there should just be a BR2_TOOLCHAIN_EXTERNAL_CUSTOM_DLANG
> that is user-settable (and verified with a compiler test).

That's true. I thought about that when writing my reply, but didn't see
a good solution to handle that.

>  Also, there should be a hidden BR2_TOOLCHAIN_HAS_DLANG option that gets
> selected by BR2_TOOLCHAIN_BUILDROOT_DLANG and
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_DLANG (and possibly by other external toolchains
> in the future).

This is exactly what I suggested in my initial reply to Eric's patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
