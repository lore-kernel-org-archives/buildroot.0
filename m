From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Oct 2014 18:08:58 +0200
Subject: [Buildroot] [PATCH] libevent: use github call
In-Reply-To: <1413129607-9134-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413129607-9134-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141012160858.GB27528@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-12 18:00 +0200, Maxime Hadjinlian spake thusly:
[--SNIP--]
> diff --git a/package/libevent/0002-Remove-usage-of-top_srcdir.patch b/package/libevent/0002-Remove-usage-of-top_srcdir.patch
> new file mode 100644
> index 0000000..34c90f0
> --- /dev/null
> +++ b/package/libevent/0002-Remove-usage-of-top_srcdir.patch
> @@ -0,0 +1,64 @@
> +From 8fe87a7dd2179ae6a3697af5c2a43143adba3c82 Mon Sep 17 00:00:00 2001
> +From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> +Date: Sun, 12 Oct 2014 17:41:41 +0200
> +Subject: [PATCH 2/2] Remove usage of top_srcdir
> +
> +This is already upstream, waiting for a release.

For an upstream patch, we like yto have an URL pointing to the upstream
commit or mailing-post about it.

[--SNIP--]
> diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
> index 73be502..fbc7c54 100644
> --- a/package/libevent/libevent.mk
> +++ b/package/libevent/libevent.mk
> @@ -5,11 +5,11 @@
>  ################################################################################
>  
>  LIBEVENT_VERSION = 2.0.21
> -LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
> -LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
> +LIBEVENT_SITE = $(call github,libevent,libevent,release-$(LIBEVENT_VERSION)-stable)
>  LIBEVENT_INSTALL_STAGING = YES
>  LIBEVENT_LICENSE = BSD-3c, OpenBSD
>  LIBEVENT_LICENSE_FILES = LICENSE
> +LIBEVENT_AUTORECONF = YES

Please, add a small comment why we autoreconf:
    # Straight from the repository, need to generate autotools files

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
