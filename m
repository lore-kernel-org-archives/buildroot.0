From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Jan 2020 20:12:25 +0100
Subject: [Buildroot] [WIP] package/efl: bump to version 1.23.3
In-Reply-To: <20200104011453.516356-1-romain.naour@gmail.com>
References: <20200104011453.516356-1-romain.naour@gmail.com>
Message-ID: <2177514b-9ccc-a345-6e03-77fe0627e829@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Romain,

 Not a full review, just a quick thing I noticed...

On 04/01/2020 02:14, Romain Naour wrote:
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 8436951f0f..9f0b6d7fe2 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,24 @@ endif
>  
>  comment "Legacy options removed in 2020.02"
>  
> +config BR2_PACKAGE_EFL_GIF
> +	bool "efl evas gif loader is mandatory"
> +	select BR2_LEGACY
> +	help
> +	  Since efl 1.23.x, the evas gif loader can't be disabled.
> +
> +config BR2_PACKAGE_EFL_PNG
> +	bool "efl evas png loader is mandatory"
> +	select BR2_LEGACY
> +	help
> +	  Since efl 1.23.x, the evas png loader can't be disabled.
> +
> +config BR2_PACKAGE_EFL_ELPUT
> +	bool "efl elput is enabled by efl drm option"
> +	select BR2_LEGACY
> +	help
> +	  Since efl 1.23.x, the drm option enable the elput library.

 No legacy handling is needed for these. People who did have these options
enabled don't care, because they will still be enabled. People who didn't have
these options enabled won't even notice since legacy is not selected - and
anyway there's nothing to be done about it.

 Legacy handling is only relevant if either the legacy symbol selects some new
symbol, or if the help text gives some important advice.

 Regards,
 Arnout
