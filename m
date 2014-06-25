From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 21:34:24 +0200
Subject: [Buildroot] [PATCH 16/54] librsvg: add license information
In-Reply-To: <1403636160-11807-16-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-16-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140625193424.GB3489@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/librsvg/librsvg.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
> index 9385fe9..86dce41 100644
> --- a/package/librsvg/librsvg.mk
> +++ b/package/librsvg/librsvg.mk
> @@ -10,6 +10,8 @@ LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_
>  LIBRSVG_INSTALL_STAGING = YES
>  LIBRSVG_CONF_OPT = --disable-tools
>  LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 gdk-pixbuf
> +LIBRSVG_LICENSE = LGPLv2+

We will have to be *extra* carefull when we bump this: there is one file
that is LGPLv2.1+ in the current master, so the result would be LGPLV2.1+,
I think:
    https://git.gnome.org/browse/librsvg/tree/rsvg-xml.c

But since we only package the 2.26, this file is not yet present. So:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +LIBRSVG_LICENSE_FILES = COPYING.LIB
>  
>  # If we have Gtk2, let's build it first to benefit from librsvg Gtk
>  # support.
> -- 
> 1.8.5.5
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
