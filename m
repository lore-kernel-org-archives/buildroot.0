From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 22:04:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/matchbox: add missing expat
 dependency
In-Reply-To: <20200508145641.1716629-1-fontaine.fabrice@gmail.com>
References: <20200508145641.1716629-1-fontaine.fabrice@gmail.com>
Message-ID: <20200508200424.GP12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-08 16:56 +0200, Fabrice Fontaine spake thusly:
> matchbox selects expat but does not add it to its dependency resulting
> in the following build failure:
> 
> configure: error: cannot find expat library
> make: *** [/home/buildroot/autobuild/run/instance-2/output-1/build/matchbox-1.2/.stamp_configured] Error 1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/37021f1d7fcfd890011068a28ce6181dc509e746
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both matchbox patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/matchbox/matchbox.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> index c0a2778b67..4d30a42ca3 100644
> --- a/package/matchbox/matchbox.mk
> +++ b/package/matchbox/matchbox.mk
> @@ -10,7 +10,7 @@ MATCHBOX_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-win
>  MATCHBOX_LICENSE = GPL-2.0+
>  MATCHBOX_LICENSE_FILES = COPYING
>  
> -MATCHBOX_DEPENDENCIES = matchbox-lib
> +MATCHBOX_DEPENDENCIES = expat matchbox-lib
>  MATCHBOX_CONF_OPTS = \
>  	--enable-expat \
>  	--disable-gconf \
> -- 
> 2.26.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
