From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Jul 2014 18:32:32 +0200
Subject: [Buildroot] [PATCH 1/1] bzip2: install shared library for the
 host
In-Reply-To: <1404993626-32112-1-git-send-email-david.bachelart@bbright.com>
References: <1404993626-32112-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20140710163232.GD28300@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2014-07-10 14:00 +0200, David Bachelart spake thusly:
> libbz2.so was explicitly built for the host, but was not installed. Install it.
> 
> Signed-off-by: David Bachelart <david.bachelart@bbright.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/bzip2/bzip2.mk |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
> index fcddb55..7584694 100644
> --- a/package/bzip2/bzip2.mk
> +++ b/package/bzip2/bzip2.mk
> @@ -61,6 +61,8 @@ endef
>  define HOST_BZIP2_INSTALL_CMDS
>  	$(HOST_MAKE_ENV) \
>  		$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
> +	$(HOST_MAKE_ENV) \
> +		$(MAKE) -f Makefile-libbz2_so PREFIX=$(HOST_DIR)/usr -C $(@D) install
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
