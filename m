From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:38:53 +0200
Subject: [Buildroot] [PATCH v2 2/4] configs/imx6-sabresd_qt5: Select the
 KMSRO gallium driver
In-Reply-To: <20191009170004.3542-2-festevam@gmail.com>
References: <20191009170004.3542-1-festevam@gmail.com>
 <20191009170004.3542-2-festevam@gmail.com>
Message-ID: <20191010223853.680453ee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Oct 2019 14:00:02 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y

I don't think this is the correct fix. mesa3d itself should be fixed to
not require explicitly enabling this option. If
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y is enabled, then you want
the etnaviv driver, it should be there.

>  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y

BTW, why do you need this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
