From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 13:43:42 +0100
Subject: [Buildroot] [PATCH 1/1] libupnp: add 1.8.3 version
In-Reply-To: <20171114193821.25188-1-fontaine.fabrice@gmail.com>
References: <20171114193821.25188-1-fontaine.fabrice@gmail.com>
Message-ID: <20171115134342.60226366@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 20:38:21 +0100, Fabrice Fontaine wrote:

> diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
> index 7c6c37607..0a8e98c97 100644
> --- a/package/libupnp/Config.in
> +++ b/package/libupnp/Config.in
> @@ -10,5 +10,19 @@ config BR2_PACKAGE_LIBUPNP
>  
>  	  http://pupnp.sourceforge.net/
>  
> +choice
> +	prompt "libupnp version"
> +	default BR2_PACKAGE_LIBUPNP_1_6
> +	help
> +	  Select the version of libupnp API you wish to use.
> +
> +config BR2_PACKAGE_LIBUPNP_1_6
> +	bool "libupnp 1.6.x"
> +
> +config BR2_PACKAGE_LIBUPNP_1_8
> +	bool "libupnp 1.8.x"
> +
> +endchoice

I believe we should perhaps instead add a separate libupnp18 package,
all those "depends on" to decide which package should be visible
depending on the version of libupnp that is currently selected are a
bit annoying. But don't rewrite your patch right now: wait for other
Buildroot developers to give their opinion on this matter.

Is it possible to install both libupnp 1.6 and libupnp 1.8 in the same
system without any conflict ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
