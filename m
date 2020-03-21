From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 22:23:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xkeyboard-config: needs
 host-python3
In-Reply-To: <20200321095533.137088-1-fontaine.fabrice@gmail.com>
References: <20200321095533.137088-1-fontaine.fabrice@gmail.com>
Message-ID: <20200321212325.GL4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-21 10:55 +0100, Fabrice Fontaine spake thusly:
> host-python3 is needed to run map-variants.py since version 2.29 and
> https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/commit/57c745a9a373b4c9d272d00ff4f16dbcc6d3c48b
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7c3cdecc2feed62d7e0bad0e790a8bacaaa34cb7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[--SNIP--]
> diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
> index fde5d058d8..39c58cb0d3 100644
> --- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
> +++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
> @@ -14,6 +14,6 @@ XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
>  XKEYBOARD_CONFIG_INSTALL_STAGING = YES
>  
>  XKEYBOARD_CONFIG_CONF_OPTS = --disable-runtime-deps
> -XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-xapp_xkbcomp
> +XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-python3 host-xapp_xkbcomp

In fact, we don't really need *our* host-python3. The system provided
one should suffice, so I've switched to using $(BR2_PYTHON3_HOST_DEPENDENCY)
instead, and applied to master. Thanks.

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 2.25.1
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
