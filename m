From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2020 21:52:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinyproxy: disable a2x
In-Reply-To: <20200330204030.133514-1-fontaine.fabrice@gmail.com>
References: <20200330204030.133514-1-fontaine.fabrice@gmail.com>
Message-ID: <20200401195220.GV22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fa  All,

On 2020-03-30 22:40 +0200, Fabrice Fontaine spake thusly:
> If a2x is found, tinyproxy won't touch the configuration files and will
> try to regenerate them which will result in the following build failure:
> 
> make[4]: Entering directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/build/tinyproxy-1.10.0/docs/man5'
>   GEN      tinyproxy.conf.5
>   File "/accts/mlweber1/bin/a2x", line 76
>     print '%s: %s' % (PROG,msg)
>           ^
> SyntaxError: invalid syntax

Looks like this is a python2-style print statement executed by a python3
interpreter...

> Fixes:
>  - http://autobuild.buildroot.org/results/fbd81c05f37a3db6df1cbc3495a89957c6587d25
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tinyproxy/tinyproxy.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
> index 305be922f5..6120d183cc 100644
> --- a/package/tinyproxy/tinyproxy.mk
> +++ b/package/tinyproxy/tinyproxy.mk
> @@ -9,5 +9,6 @@ TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINY
>  TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.bz2
>  TINYPROXY_LICENSE = GPL-2.0+
>  TINYPROXY_LICENSE_FILES = COPYING
> +TINYPROXY_CONF_ENV = ac_cv_path_A2X=no
>  
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
