From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 23:00:01 +0200
Subject: [Buildroot] [PATCH] package/zip: install to staging
In-Reply-To: <20200706153406.430123-1-kamel.bouhara@bootlin.com>
References: <20200706153406.430123-1-kamel.bouhara@bootlin.com>
Message-ID: <20200707210001.GX2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kamel, All,

On 2020-07-06 17:34 +0200, Kamel Bouhara spake thusly:
> Install header files and libraries into the staging area.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zip/zip.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/zip/zip.mk b/package/zip/zip.mk
> index ca52c74fb1..c78efedc25 100644
> --- a/package/zip/zip.mk
> +++ b/package/zip/zip.mk
> @@ -10,6 +10,7 @@ ZIP_SOURCE = zip$(subst .,,$(ZIP_VERSION)).tgz
>  ZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
>  ZIP_LICENSE = Info-ZIP
>  ZIP_LICENSE_FILES = LICENSE
> +ZIP_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_PACKAGE_BZIP2),y)
>  ZIP_DEPENDENCIES += bzip2
> @@ -39,6 +40,11 @@ define ZIP_INSTALL_TARGET_CMDS
>  		prefix=$(TARGET_DIR)/usr
>  endef
>  
> +define ZIP_INSTALLING_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
> +		prefix=$(STAGING_DIR)/usr
> +endef
> +
>  define HOST_ZIP_BUILD_CMDS
>  	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
>  		CFLAGS="$(HOST_CFLAGS) $(ZIP_CFLAGS)" \
> -- 
> 2.26.2
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
