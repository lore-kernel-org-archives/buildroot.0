From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 8 Feb 2021 18:46:45 +0100
Subject: [Buildroot] [PATCH] package/python: clarify that this refers to
 the deprecated 2.7 series
In-Reply-To: <20210208132412.29013-1-peter@korsgaard.com>
References: <20210208132412.29013-1-peter@korsgaard.com>
Message-ID: <20210208184645.2beb3433@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Mon,  8 Feb 2021 14:24:11 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> Python 2.7 is EOL, so people should use the python3 package instead if
> possible.  Make it a bit more obvious that 'python' is not the right package
> to use by explicitly mentioning that this if about python 2.7 and that it is

s/this if about/this is about/?

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> deprecated.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/python/Config.in b/package/python/Config.in
> index bded00c9e8..ab6950cae8 100644
> --- a/package/python/Config.in
> +++ b/package/python/Config.in
> @@ -3,7 +3,7 @@ comment "python needs a toolchain w/ wchar, threads, dynamic library"
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>
>  config BR2_PACKAGE_PYTHON
> -	bool "python"
> +	bool "python2.7 (deprecated)"
>  	depends on BR2_USE_WCHAR
>  	# uses fork()
>  	depends on BR2_USE_MMU
