From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 08:53:27 +0100
Subject: [Buildroot] [PATCH v2] rauc: bump to version 0.2
In-Reply-To: <20171122041747.11363-1-yurovsky@gmail.com>
References: <20171114043141.8245-1-ayurovsky@impinj.com>
 <20171122041747.11363-1-yurovsky@gmail.com>
Message-ID: <20171122085327.084ef828@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Nov 2017 20:17:47 -0800, Andrey Yurovsky wrote:

> diff --git a/package/rauc/Config.in.host b/package/rauc/Config.in.host
> index a58685a..1bd9a79 100644
> --- a/package/rauc/Config.in.host
> +++ b/package/rauc/Config.in.host
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_HOST_RAUC
>  	bool "host rauc"
> +	select BR2_PACKAGE_HOST_SQUASHFS # run-time dependency

If it's a runtime dependency...

> -HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
> +HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs

...you don't need to list it in <pkg>_DEPENDENCIES.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
