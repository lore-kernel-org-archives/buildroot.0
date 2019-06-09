From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 9 Jun 2019 23:35:45 +0200
Subject: [Buildroot] [PATCH 1/4] package/iputils: fix IDN support
In-Reply-To: <20190609093814.14169-1-fontaine.fabrice@gmail.com>
References: <20190609093814.14169-1-fontaine.fabrice@gmail.com>
Message-ID: <20190609213544.GA16399@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> iputils depends on libidn2 since version s20180629 and
> https://github.com/iputils/iputils/commit/665fe4d30ff8b6649454ae25e4768b2f23605332
Acked-by: Petr Vorel <petr.vorel@gmail.com>

Thanks a lot, Fabrice!

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/iputils/iputils.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index f0902c7038..2b326838f7 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -24,9 +24,9 @@ else
>  IPUTILS_CONF_OPTS += -DUSE_CAP=false
>  endif

> -ifeq ($(BR2_PACKAGE_LIBIDN),y)
> +ifeq ($(BR2_PACKAGE_LIBIDN2),y)
>  IPUTILS_CONF_OPTS += -DUSE_IDN=true
> -IPUTILS_DEPENDENCIES += libidn
> +IPUTILS_DEPENDENCIES += libidn2
>  else
>  IPUTILS_CONF_OPTS += -DUSE_IDN=false
>  endif


Kind regards,
Petr
