From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 13:59:39 +0200
Subject: [Buildroot] [PATCH] package/ofono: use target ell library if
 enabled
In-Reply-To: <20191022104757.109356-1-nicolas.serafini@sensefly.com>
References: <20191022104757.109356-1-nicolas.serafini@sensefly.com>
Message-ID: <20191022135939.06701cb8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Oct 2019 10:48:31 +0000
Nicolas Serafini <nicolas.serafini@sensefly.com> wrote:

> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
> ---
>  package/ofono/ofono.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
> index ce05dfcadf..85e249a233 100644
> --- a/package/ofono/ofono.mk
> +++ b/package/ofono/ofono.mk
> @@ -49,7 +49,9 @@ else
>  OFONO_CONF_OPTS += --disable-bluetooth
>  endif
>  
> -# required by 0003-build-Add-check-for-explicit_bzero-support.patch

Dropping this comment is correct, because indeed this patch no longer exists.

> +ifeq ($(BR2_PACKAGE_ELL),y)
>  OFONO_AUTORECONF = YES

But why are you keeping AUTORECONF = YES here ?

Also, dropping autoreconf should be in a separate patch.

> +OFONO_CONF_OPTS += --enable-external-ell

You forgot:

OFONO_DEPENDENCIES += ell
else
OFONO_CONF_OPTS += --disable-external-ell

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
