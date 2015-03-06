From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 15:09:50 +0100
Subject: [Buildroot] [PATCH] cups: deprecate package due to security
 issues
In-Reply-To: <1425649164-31813-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425649164-31813-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150306150950.0fbaa59e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  6 Mar 2015 10:39:24 -0300, Gustavo Zacarias wrote:
> Also mark packages that depend on cups as deprecated as well for easier
> tracking.
> 
> It would probably be better to mark it as a legacy option so users get a
> warning when migrating configuration files, but it would require a
> direct removal for that.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/cups/Config.in             | 2 ++
>  package/foomatic-filters/Config.in | 2 ++
>  package/gutenprint/Config.in       | 2 ++
>  package/hplip/Config.in            | 2 ++
>  4 files changed, 8 insertions(+)
> 
> diff --git a/package/cups/Config.in b/package/cups/Config.in
> index ea1f003..8e60221 100644
> --- a/package/cups/Config.in
> +++ b/package/cups/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_CUPS
>  	bool "cups"
> +	# serious security issues, needs upgrading
> +	depends on BR2_DEPRECATED_SINCE_2015_05
>  	# needs fork()
>  	depends on BR2_USE_MMU
>  	help
> diff --git a/package/foomatic-filters/Config.in b/package/foomatic-filters/Config.in
> index 377566e..158bf44 100644
> --- a/package/foomatic-filters/Config.in
> +++ b/package/foomatic-filters/Config.in
> @@ -1,4 +1,6 @@
>  comment "foomatic-filters needs a toolchain w/ threads"
> +	# because of cups security issues
> +	depends on BR2_DEPRECATED_SINCE_2015_05

Any reason why this is done on the comment only, and not on the package
itself?

Other than that, I'd personally be in favor of this deprecation.
Hopefully it will encourage someone to step up and upgrade cups.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
