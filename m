From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 09:39:35 +0100
Subject: [Buildroot] [PATCH 1/1] rustc: disable for ARMV7A with EABI
In-Reply-To: <87zi3uq391.fsf@dell.be.48ers.dk>
References: <20180226200421.18131-1-eric.le.bihan.dev@free.fr>
 <20180226235226.62ad68b3@windsurf.lan>
 <87zi3uq391.fsf@dell.be.48ers.dk>
Message-ID: <20180227093935.4be76eab@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Feb 2018 08:51:38 +0100, Peter Korsgaard wrote:

>  > It looks like a better fix would be:  
> 
>  > config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  >         bool
>  >         # The pre-built Rust standard library is only available for the
>  >         # following architectures/ABIs, and is built against glibc.
>  >         default y if BR2_i386
>  >         default y if BR2_x86_64
>  >         default y if BR2_aarch64
>  > -       default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
>  > +	default y if BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A  
> 
> I agree that having positive logic would be nicer. It is a bit more
> complicated than this as we also should handle ARMV8A cores in ARM mode
> similar to how ve handle ARMV7A.
> 
> Care to send an updated patch on top of master doing that?

I was hoping that Eric would handle that :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
