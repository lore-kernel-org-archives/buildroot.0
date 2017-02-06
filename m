From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 16:04:52 +0100
Subject: [Buildroot] [PATCH v3] efl: do not force dependency on libudev
 by making eeze a config option.
In-Reply-To: <20170206133731.6639-1-romain.naour@gmail.com>
References: <20170206133731.6639-1-romain.naour@gmail.com>
Message-ID: <20170206160452.7c3d10a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 14:37:31 +0100, Romain Naour wrote:

>  config BR2_PACKAGE_EFL_DRM
>  	bool "Evas DRM Engine"
> +	depends on BR2_PACKAGE_EFL_EEZE

BR2_PACKAGE_EFL_DRM is selected by BR2_PACKAGE_EFL_WAYLAND, but you're
not propagating the dependency to BR2_PACKAGE_EFL_WAYLAND. Isn't that
missing?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
