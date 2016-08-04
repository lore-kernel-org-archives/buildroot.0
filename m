From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 00:10:46 +0200
Subject: [Buildroot] [PATCH v2] package/oprofile: disable for m68k
In-Reply-To: <1470347885-13186-1-git-send-email-romain.naour@gmail.com>
References: <1470347885-13186-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160805001046.3b89b0f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Aug 2016 23:58:05 +0200, Romain Naour wrote:

>  	# no memory barrier functions
> -	depends on !BR2_xtensa && !BR2_microblaze
> +	depends on !BR2_xtensa && !BR2_microblaze && !BR2_m68k

I was also looking at this, and I think we need to invert the logic.
There's a file in oprofile sources that defines rmb() for a number of
architectures. We should have a BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS that
is set to 'y' only for the architectures that are explicitly supported
by oprofile.

Could you look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
