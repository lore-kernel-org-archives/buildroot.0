From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 17:47:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/gssdp: explicitly disable vapi
In-Reply-To: <20200315164150.640729-1-aduskett@gmail.com>
References: <20200315164150.640729-1-aduskett@gmail.com>
Message-ID: <20200315164724.GH19677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-15 09:41 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Currently, vapi support does not work with meson due to meson calling vapigen
> directly instead of the vala wrapper. As such, when building typelib files for
> gobject-introspection, vapigen fails to find the proper .gir files and fails
> to build.
> 
> Explicitly disable vapi until a fix for vapi is made.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gssdp/gssdp.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
> index 4589517691..071ad00109 100644
> --- a/package/gssdp/gssdp.mk
> +++ b/package/gssdp/gssdp.mk
> @@ -14,7 +14,8 @@ GSSDP_INSTALL_STAGING = YES
>  GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
>  GSSDP_CONF_OPTS = \
>  	-Dexamples=false \
> -	-Dintrospection=false
> +	-Dintrospection=false \
> +	-Dvapi=false

Sorry, no: that's two different fixes, so should be two different
patches:
  - one to explicitly disable vapi support
  - one to enable instrospection

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_LIBGTK3),y)
>  GSSDP_DEPENDENCIES += libgtk3
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
