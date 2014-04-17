From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:07:08 +0200
Subject: [Buildroot] [PATCH 11/14] package/mesa3d: with a DRI driver,
 is a full OpenGL provider
In-Reply-To: <6c6c678af9a7ff235f32d25f3bea03670749f41d.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
 <6c6c678af9a7ff235f32d25f3bea03670749f41d.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <20140417230708.42918ee0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 17 Apr 2014 18:04:23 +0200, Yann E. MORIN wrote:

>  config BR2_PACKAGE_MESA3D_DRI_DRIVER
>  	select BR2_PACKAGE_MESA3D_DRIVER
> +	select BR2_PACKAGE_HAS_LIBGL
>  	bool
>  
> +config BR2_PACKAGE_PROVIDES_LIBGL
> +	default "mesa3d" if BR2_PACKAGE_MESA3D_DRI_DRIVER

I find this a little bit confusing. Wouldn't it make more sense to have
a BR2_PACKAGE_MESA3D_GL option, that gets automatically defined when
mesa3d provides a full OpenGL implementation? I know it appears to
technically be the same as Mesa3D having a DRI driver, but it would
look more logical.

In fact, the Mesa3D situation is so complex that a good fat comment on
top of its Config.in file may be useful to have :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
