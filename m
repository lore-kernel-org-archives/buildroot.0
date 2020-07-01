From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jul 2020 23:56:31 +0200
Subject: [Buildroot] [PATCH v6 21/28] package/python-sip: Fix qmake
 usage for per-package build
In-Reply-To: <20200217212350.29750-22-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-22-anaumann@ultratronik.de>
Message-ID: <20200701215631.GZ20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2020-02-17 22:23 +0100, Andreas Naumann spake thusly:
> Since python-sip is not built by the qmake infra, we need to explicitly
> integrate the qt.conf fixup needed for successful per-package build and
> consistently use qmake via QT5_QMAKE variable.

And why can't we make it use the qmake infra now that we have it?

Regards,
Yann E. MORIN.

> ---
>  package/python-sip/python-sip.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
> index 1d6c205396..7ae2d43e1e 100644
> --- a/package/python-sip/python-sip.mk
> +++ b/package/python-sip/python-sip.mk
> @@ -38,6 +38,7 @@ define HOST_PYTHON_SIP_INSTALL_CMDS
>  endef
>  
>  define PYTHON_SIP_CONFIGURE_CMDS
> +	$(QT5_QT_CONF_FIXUP)
>  	(cd $(@D); \
>  		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/bin/python configure.py \
>  			--bindir $(TARGET_DIR)/usr/bin \
> @@ -46,7 +47,7 @@ define PYTHON_SIP_CONFIGURE_CMDS
>  			--sipdir $(TARGET_DIR)/usr/share/sip \
>  			--sysroot $(STAGING_DIR)/usr \
>  			--use-qmake && \
> -		$(HOST_DIR)/bin/qmake)
> +		$(QT5_QMAKE))
>  endef
>  
>  define PYTHON_SIP_BUILD_CMDS
> -- 
> 2.25.0
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
