From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Mar 2014 00:00:14 +0100
Subject: [Buildroot] [PATCH 2/2] fetchmail: New package
In-Reply-To: <BLU0-SMTP1875387C9CEE20843356896D9700@phx.gbl>
References: <1394835693-32232-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP1875387C9CEE20843356896D9700@phx.gbl>
Message-ID: <20140314230014.GC16649@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-03-14 23:21 +0100, Bernd Kuhls spake thusly:
[--SNIP--]
> diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
> new file mode 100644
> index 0000000..61e86a9
> --- /dev/null
> +++ b/package/fetchmail/fetchmail.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# fetchmail
> +#
> +################################################################################
> +
> +FETCHMAIL_VERSION_MAJOR = 6.3
> +FETCHMAIL_VERSION_MINOR = 26
> +FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).$(FETCHMAIL_VERSION_MINOR)
> +FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
> +FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)/

The official site for fetchmail is:
    http://www.fetchmail.info/

and following the "download" link points to:
    http://developer.berlios.de/project/showfiles.php?group_id=1824

which then has a download link for the tarball:
    http://prdownload.berlios.de/fetchmail/fetchmail-6.3.26.tar.xz

(The .tar.bz2 also exists there.)

Also, the official development tree is on gitorious, not sourceforge:
    https://gitorious.org/fetchmail/fetchmail/

I'd prefer we use the download locations from the official distribution
medium, rather than from a mirror.

> +FETCHMAIL_LICENSE = GPLv2; some exceptions are mentioned in COPYING
> +FETCHMAIL_LICENSE_FILES = COPYING
> +
> +FETCHMAIL_CONF_OPT = \
> +	--with-ssl=$(STAGING_DIR)/usr
> +
> +FETCHMAIL_DEPENDENCIES = \
> +	ca-certificates \
> +	openssl \
> +	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
> +
> +$(eval $(autotools-package))
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
