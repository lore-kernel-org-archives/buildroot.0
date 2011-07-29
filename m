From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 29 Jul 2011 20:17:33 +0200
Subject: [Buildroot] adding nut to buildroot
In-Reply-To: <BAY160-W42BE42946C7EB9032C7376CF340@phx.gbl>
References: <BAY160-W42BE42946C7EB9032C7376CF340@phx.gbl>
Message-ID: <201107292017.33978.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tilman, All,

On Friday 29 July 2011 00:41:13 Tilman Glotzner wrote:
> The executables installed in the image are prefixed by the cross
> compiler, e.g. apcsmart becomes arm-linux-apcsmart
[--SNIP--]
> nut.mk
> =====
>  
> #############################################################
> #
> # nut
> #
> #############################################################
> NUT_VERSION = 2.6.1
> NUT_SOURCE = nut-$(NUT_VERSION).tar.gz
> NUT_SITE = http://www.networkupstools.org/source/2.6/
> NUT_INSTALL_STAGING = NO
> NUT_INSTALL_TARGET = YES
> NUT_LIBTOOL_PATCH = NO
>  
> $(eval $(call AUTOTARGETS,package,nut))
>  
> Can you kindly advise how to debug or fix it ?

Try adding:
  NUT_CONF_OPT = --program-prefix=''

If that does not work, you may try with:
  NUT_CONF_OPT = --program-transform-name='s/$(GNU_TARGET_NAME)-//;'

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
