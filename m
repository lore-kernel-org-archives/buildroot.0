From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Mar 2020 21:47:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump to version 2.64.0
In-Reply-To: <20200306211458.54107-1-james.hilliard1@gmail.com>
References: <20200306211458.54107-1-james.hilliard1@gmail.com>
Message-ID: <20200312204723.GH705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-03-06 14:14 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../libglib2/0003-remove-cpp-requirement.patch | 18 +++++++++---------
>  package/libglib2/libglib2.hash                 |  4 ++--
>  package/libglib2/libglib2.mk                   |  8 ++++----
>  3 files changed, 15 insertions(+), 15 deletions(-)
[--SNIP--]
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index f00818f69c..a5e70193bf 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBGLIB2_VERSION_MAJOR = 2.62
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
> +LIBGLIB2_VERSION_MAJOR = 2.64
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0

In the meantime. Adam has sent his own attempt at the bump, with a
commit log that explains the switch to afeature, and to a more recent
release, 2.64.1.

So I'm working on Adam's patch, and I've marked yours as superseded.

Regards,
Yann E. MORIN.

>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>  LIBGLIB2_LICENSE = LGPL-2.1+
> @@ -80,10 +80,10 @@ endef
>  endif
>  
>  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
> -LIBGLIB2_CONF_OPTS += -Dlibmount=true
> +LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
>  LIBGLIB2_DEPENDENCIES += util-linux
>  else
> -LIBGLIB2_CONF_OPTS += -Dlibmount=false
> +LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
>  endif
>  
>  # Purge useless binaries from target
> -- 
> 2.20.1
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
