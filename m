From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Oct 2017 11:20:43 +0200
Subject: [Buildroot] [PATCH v3 1/1] libsepol: require threads
In-Reply-To: <20171025131200.18412-1-aduskett@gmail.com>
References: <20171025131200.18412-1-aduskett@gmail.com>
Message-ID: <20171027112043.33611a58@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Oct 2017 09:12:00 -0400, Adam Duskett wrote:

> diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
> index f92af52072..f17eb47448 100644
> --- a/package/libsepol/Config.in
> +++ b/package/libsepol/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBSEPOL
>  	bool "libsepol"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
>  	help
>  	  Libsepol is the binary policy manipulation library. It doesn't
>  	  depend upon or use any of the other SELinux components.

So a Config.in comment needs to be added here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
