From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Jun 2021 23:02:26 +0200
Subject: [Buildroot] [PATCH 11/15] package/owfs: Remove Python
 sysconfigdata fixup
In-Reply-To: <20210621141130.48654-12-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-12-herve.codina@bootlin.com>
Message-ID: <20210622210226.GO44262@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> This fixup is done at pkg-generic level for all packages.
> So, it is no more needed in owfs package.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

When you respin the series, you can carry my:

    Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/owfs/owfs.mk | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
> index ffc0b3098d..10543d3698 100644
> --- a/package/owfs/owfs.mk
> +++ b/package/owfs/owfs.mk
> @@ -88,15 +88,6 @@ OWFS_DEPENDENCIES += python host-swig
>  # override the PYSITEDIR variable in make.
>  OWFS_EXTRA_MAKE_OPTS += PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
>  
> -ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> -define OWFS_FIXUP_PYTHON_SYSCONFIGDATA
> -	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
> -		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
> -		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/owfs/:g"
> -endef
> -OWFS_PRE_CONFIGURE_HOOKS += OWFS_FIXUP_PYTHON_SYSCONFIGDATA
> -endif
> -
>  else
>  OWFS_CONF_OPTS += --disable-owpython --without-python
>  endif
> -- 
> 2.31.1
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
