From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:36:05 +0200
Subject: [Buildroot] [PATCH 3/4] package/bind: don't enable server by
 default
In-Reply-To: <20190423212406.13909-3-fontaine.fabrice@gmail.com>
References: <20190423212406.13909-1-fontaine.fabrice@gmail.com>
 <20190423212406.13909-3-fontaine.fabrice@gmail.com>
Message-ID: <20190424223605.7c21b543@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Apr 2019 23:24:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Don't enable server by default as dhcp will now select bind to use the
> bind libraries
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bind/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/bind/Config.in b/package/bind/Config.in
> index 60546f691b..6d4ee2e6d7 100644
> --- a/package/bind/Config.in
> +++ b/package/bind/Config.in
> @@ -28,7 +28,6 @@ if BR2_PACKAGE_BIND
>  
>  config BR2_PACKAGE_BIND_SERVER
>  	bool "Install server components"
> -	default y

This will break existing defconfigs which did not explicitly enable
BR2_PACKAGE_BIND_SERVER because it was implicitly enabled when
BR2_PACKAGE_BIND=y. But I don't see a good solution to avoid that. We
certainly don't want BR2_PACKAGE_DHCP=y to install the full BIND server.

So to me, it's an acceptable trade-off. I've Cc'ed Arnout, Peter and
Yann to see what they think.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
