From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:16:49 +0200
Subject: [Buildroot] [PATCH v2 18/37] docs/manual: add check-package to
 "Tips and tricks"
In-Reply-To: <20180401050850.5701-19-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-19-ricardo.martincoski@gmail.com>
Message-ID: <20180401091649.217db6e8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:31 -0300, Ricardo Martincoski wrote:

> +[[check-package]]
> +==== How to check the coding style
> +
> +Buildroot provides a script in +utils/check-package+ that checks new or
> +changed files for coding style. It is not a complete language validator,
> +but it catches many common mistakes. It is meant to run in the actual
> +files you created or modified, before creating the patch for submission.
> +
> +This script can be used for packages and also for package-like files:
> +boot, fs, toolchain, ... ; but it does not check package infra types.

I'm not sure to understand what you mean by "does not check package
infra types". Do you mean that the code in package/pkg-*.mk is not
checked ? Or that it doesn't check the $(eval $(autotools-package))
line at the end of every package ?

> +The tool can also be used for proprietary packages in a br2-external:

I would say "external packages" or just "packages", because packages in
a br2-external are not necessarily proprietary.

> +
> +----
> +$ check-package -b /path/to/br2-ext-tree/package/my-package/*
> +----
> +
>  [[testing-package]]
>  ==== How to test your package
>  
> diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
> index c642146287..76fca6bf8c 100644
> --- a/docs/manual/adding-packages.txt
> +++ b/docs/manual/adding-packages.txt
> @@ -12,6 +12,8 @@ tuning their configuration.
>  When you add a new package, be sure to test it in various conditions;
>  see xref:testing-package[]
>  
> +Also check the new package for coding style; see xref:check-package[]

Final dot ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
