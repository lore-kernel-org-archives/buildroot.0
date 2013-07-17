From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 17:58:38 +0200
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130717175838.2fc2831e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 17 Jul 2013 12:39:15 -0300, Gustavo Zacarias wrote:

> +config BR2_ARM_INSTRUCTIONS_THUMB
> +	bool "Thumb"
> +	depends on BR2_ARM_CPU_HAS_THUMB
> +	help
> +	  This option instructions the compiler to generate Thumb
> +	  instructions, which allows to mix 16 bits instructions and
> +	  32 bits instructions. This generally provides a much smaller
> +	  compiled binary size.

I think this is misleading: Thumb doesn't allow to mix 16 bits and 32
bits instructions like Thumb2 does. IIRC, with Thumb, a particular
function needs to be either completely Thumb (16 bits) or completely
ARM (32 bits), and there is the thumb-interworking mechanism between
the two.

Which leads me to this question: is adding Thumb support as simple as
what you're adding? Aren't there some additional thumb-interworking
complexities to handle?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
