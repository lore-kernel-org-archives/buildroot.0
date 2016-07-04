From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 17:46:26 +0200
Subject: [Buildroot] [PATCH 2/6] libuci: update legal info
In-Reply-To: <1467636386-6759-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1467636386-6759-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160704154626.GC3549@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul, All,

On 2016-07-04 18:16 +0530, Rahul Bedarkar spake thusly:
> CLI tool and lua bindings are released under GPLv2.
> 
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/libuci/libuci.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
> index 8c060d5..b9bd0c7 100644
> --- a/package/libuci/libuci.mk
> +++ b/package/libuci/libuci.mk
> @@ -6,7 +6,7 @@
>  
>  LIBUCI_VERSION = e339407372ffc70b1451e4eda218c01aa95a6a7f
>  LIBUCI_SITE = git://nbd.name/uci.git
> -LIBUCI_LICENSE = LGPLv2.1
> +LIBUCI_LICENSE = LGPLv2.1, GPLv2 (tools)
>  LIBUCI_INSTALL_STAGING = YES
>  LIBUCI_DEPENDENCIES = libubox
>  
> @@ -15,6 +15,7 @@ LIBUCI_DEPENDENCIES += lua
>  LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
>  	-DLUAPATH=/usr/lib/lua/5.1 \
>  	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
> +LIBUCI_LICENSE += , GPLv2 (lua bindings)

Although this is correct, this causes the resulting string to be
ill-formatted:

    LGPLv2.1, GPLv2 (tools) , GPLv2 (lua bindings)

In this case, what we did in other such conditions, was:

    LIBUCI_LICENSE = LGPLv2.1, GPLv2 (tools)

    ifeq ($(BR2_PACKAGE_LUA_5_1),y)
    LIBUCI_LICENSE := $(LIBUCI_LICENSE), GPLv2 (lua bindings)
    endif

See for example qt or freeswitch.

Regards,
Yann E. MORIN.

>  else
>  LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
>  endif
> -- 
> 2.6.2
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
