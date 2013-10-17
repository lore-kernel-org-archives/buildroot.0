From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Oct 2013 17:15:18 +0200
Subject: [Buildroot] [PATCH] tslib: needs shared library for dlopen
In-Reply-To: <ed7d27afb27011d62944.1382021888@argentina>
References: <ed7d27afb27011d62944.1382021888@argentina>
Message-ID: <20131017171518.28ec97bf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 17 Oct 2013 16:58:08 +0200, Thomas De Schampheleire wrote:

> diff --git a/package/tslib/Config.in b/package/tslib/Config.in
> --- a/package/tslib/Config.in
> +++ b/package/tslib/Config.in
> @@ -1,6 +1,10 @@
>  config BR2_PACKAGE_TSLIB
>  	bool "tslib"
> +	depends on !BR2_PREFER_STATIC_LIB # dlopen

I believe this needs to be propagated to the BR2_PACKAGE_DIRECTFB_TSLIB
option, which selects BR2_PACKAGE_TSLIB, but does not depends
on !BR2_PREFER_STATIC_LIB.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
