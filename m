From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 21:48:12 +0200
Subject: [Buildroot] [PATCH 3/4] arch/bfin: internal backend not
 suitable for some cores
In-Reply-To: <fd7e5dc963d17a2a1c33f575fbf73ab1140099f2.1504381100.git.yann.morin.1998@free.fr>
References: <cover.1504381100.git.yann.morin.1998@free.fr>
 <fd7e5dc963d17a2a1c33f575fbf73ab1140099f2.1504381100.git.yann.morin.1998@free.fr>
Message-ID: <20170902214812.70fc882f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Sep 2017 21:38:51 +0200, Yann E. MORIN wrote:

> diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
> index 90e4ab97b0..8c1c80ad52 100644
> --- a/arch/Config.in.bfin
> +++ b/arch/Config.in.bfin
> @@ -6,12 +6,16 @@ choice
>  	  Specify target CPU
>  config BR2_bf606
>  	bool "bf606"
> +	select BR2_ARCH_NOT_UPSTREAM_GCC

Where is this symbol introduced?

Seems like there is some issue in your patch series.

Also, as said in my review of PATCH 1/4, perhaps we should simply drop
those Blackfin variants ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
