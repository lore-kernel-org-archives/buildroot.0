From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 11:19:36 +0100
Subject: [Buildroot] [PATCHv2] toolchain: granular choice for stack
 protector
In-Reply-To: <1451173326-3424-1-git-send-email-yann.morin.1998@free.fr>
References: <1451173326-3424-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151227111936.5283ba73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 27 Dec 2015 00:42:06 +0100, Yann E. MORIN wrote:

> -config BR2_ENABLE_SSP
> +choice
>  	bool "build code with Stack Smashing Protection"
> -	depends on BR2_TOOLCHAIN_HAS_SSP
> +	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
> +	default BR2_SSP_STRONG if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

I don't understand this part. Why would we now defalut on
BR2_SSP_STRONG if gcc >= 4.9 ?

I think we should keep the default of not having SSP enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
