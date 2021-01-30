From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jan 2021 16:29:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/logrotate: use official tarball
In-Reply-To: <20210130141833.2370779-1-fontaine.fabrice@gmail.com>
References: <20210130141833.2370779-1-fontaine.fabrice@gmail.com>
Message-ID: <20210130152928.GA2743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-30 15:18 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/logrotate/logrotate.hash | 2 +-
>  package/logrotate/logrotate.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
> index b3628da7de..2af46d60b7 100644
> --- a/package/logrotate/logrotate.hash
> +++ b/package/logrotate/logrotate.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256  66232111a2b02cce3c2436c141b7a2af78fa758aac326ab2b79f9a5b0d749142  logrotate-3.18.0.tar.gz
> +sha256  841f81bf09d0014e4a2e11af166bb33fcd8429cc0c2d4a7d3d9ceb3858cfccc5  logrotate-3.18.0.tar.xz
> diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
> index b765fff4ee..96b65d571a 100644
> --- a/package/logrotate/logrotate.mk
> +++ b/package/logrotate/logrotate.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  LOGROTATE_VERSION = 3.18.0
> -LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
> +LOGROTATE_SOURCE = logrotate-3.18.0.tar.xz
> +LOGROTATE_SITE = https://github.com/logrotate/logrotate/releases/download/$(LOGROTATE_VERSION)

But now, the release tarball has a configure script, so we probably want
to drop AUTORECONF = YES, a few lines below, no?

Regards,
Yann E. MORIN.

>  LOGROTATE_LICENSE = GPL-2.0+
>  LOGROTATE_LICENSE_FILES = COPYING
>  LOGROTATE_CPE_ID_VALID = YES
> -- 
> 2.29.2
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
