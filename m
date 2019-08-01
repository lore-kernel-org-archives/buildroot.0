From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 1 Aug 2019 19:25:28 +0200
Subject: [Buildroot] [PATCH 1/2 v7] package/iputils: drop setuid on
 arping
In-Reply-To: <f9b8b678e88316d6b572dc87e5080896cd8a84c7.1564676540.git.yann.morin.1998@free.fr>
References: <cover.1564676540.git.yann.morin.1998@free.fr>
 <f9b8b678e88316d6b572dc87e5080896cd8a84c7.1564676540.git.yann.morin.1998@free.fr>
Message-ID: <20190801172527.GA27877@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> arping can be used for arp poisoning, so it should really not be setuid.

> Reported-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
+1
> ---
>  package/iputils/iputils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index b28222138f..7482bbdca1 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -80,7 +80,7 @@ IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
>  # handle permissions ourselves
>  IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
>  define IPUTILS_PERMISSIONS
> -	/usr/sbin/arping      f 4755 0 0 - - - - -
> +	/usr/sbin/arping      f  755 0 0 - - - - -
>  	/usr/bin/clockdiff    f 4755 0 0 - - - - -
>  	/bin/ping             f 4755 0 0 - - - - -
>  	/usr/bin/traceroute6  f 4755 0 0 - - - - -


Kind regards,
Petr
