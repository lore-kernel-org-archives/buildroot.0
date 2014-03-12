From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 12 Mar 2014 23:16:40 +0100
Subject: [Buildroot] [PATCH v6 4/5] pkgconf: rewrite variable sdkdir,
 needed by xdriver_xf86-video-intel
In-Reply-To: <BLU0-SMTP316AB12B933108688B43F8BD9760@phx.gbl>
References: <1394653353-10904-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP316AB12B933108688B43F8BD9760@phx.gbl>
Message-ID: <5320DCC8.3000303@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Bernd,

> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> ---
> v3: no changes
> v2: no changes
>
>   package/pkgconf/pkgconf-fix-variable.patch |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

/Shouldn't you rename this patch on/

pkgconf-01-fix-variable.patch

Regards,
Jerzy

>
> diff --git a/package/pkgconf/pkgconf-fix-variable.patch b/package/pkgconf/pkgconf-fix-variable.patch
> index e19f76c..4c213d6 100644
> --- a/package/pkgconf/pkgconf-fix-variable.patch
> +++ b/package/pkgconf/pkgconf-fix-variable.patch
> @@ -7,17 +7,19 @@ This is sometimes used to find header files (E.G. in gst-plugins configure),
>   so ensure the sysroot'ed files are used.
>   
>   Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
>   
>   diff -Nura pkgconf-0.8.9.orig/main.c pkgconf-0.8.9/main.c
>   --- pkgconf-0.8.9.orig/main.c	2012-10-24 14:32:08.236508699 -0300
>   +++ pkgconf-0.8.9/main.c	2012-10-24 14:54:36.771070217 -0300
> -@@ -298,7 +298,12 @@
> +@@ -298,7 +298,13 @@
>    	if (eflag != PKG_ERRF_OK)
>    		return false;
>    
>   -	printf("%s\n", req.buf);
>   +	if ( !strcmp(req.variable, "includedir") ||
>   +	  !strcmp(req.variable, "mapdir") ||
> ++	  !strcmp(req.variable, "sdkdir") ||
>   +	  !strcmp(req.variable, "libdir"))
>   +		printf("%s%s\n", sysroot_dir, req.buf);
>   +	else
