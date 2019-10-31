From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 21:27:12 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/alljoyn*: Remove the Alljoyn
 framework packages
In-Reply-To: <20191031173721.3192-1-titouan.christophe@railnova.eu>
References: <20191031173721.3192-1-titouan.christophe@railnova.eu>
Message-ID: <20191031212712.2601ffa0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 31 Oct 2019 18:37:21 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> diff --git a/Config.in.legacy b/Config.in.legacy
> index d4f3d04062..4d20e4da2a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,48 @@ endif
>  
>  comment "Legacy options removed in 2019.11"
>  
> +config BR2_PACKAGE_ALLJOYN
> +	bool "alljoin was removed"
> +	select BR2_LEGACY
> +	help
> +	  The alljoyn framework is dead
> +
> +config BR2_PACKAGE_ALLJOYN_BASE
> +	bool "alljoin-base was removed"
> +	select BR2_LEGACY
> +	help
> +	  The alljoyn framework is dead
> +
> +config BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL
> +	bool "alljoin-base control panel was removed"
> +	select BR2_LEGACY
> +	help
> +	  The alljoyn framework is dead
> +
> +config BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION
> +	bool "alljoin-base notification was removed"
> +	select BR2_LEGACY
> +	help
> +	  The alljoyn framework is dead
> +
> +config BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING
> +	bool "alljoin-base onboarding was removed"
> +	select BR2_LEGACY
> +	help
> +	  The alljoyn framework is dead

I don't think it is useful to have Config.in.legacy entries for
sub-options of the alljoyn-base package. Indeed, if the package was
selected in an existing configuration, the main package option will
have disappeared, and will trigger the Config.in.legacy mechanism.
Therefore, we don't really care about the sub-options IMO.

Other than that, I'm fine with dropping those packages, upstream is
indeed long dead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
