From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 21:57:15 +0100
Subject: [Buildroot] [PATCH v2 1/4] libfm-extra: new package
In-Reply-To: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141210205715.GE3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincet, All,

On 2014-11-21 15:33 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[--SNIP--]
> diff --git a/package/libfm-extra/libfm-extra.mk b/package/libfm-extra/libfm-extra.mk
> new file mode 100644
> index 0000000..70e37b9
> --- /dev/null
> +++ b/package/libfm-extra/libfm-extra.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# libfm-extra
> +#
> +################################################################################
> +
> +LIBFM_EXTRA_VERSION = 1.2.3
> +LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz
> +LIBFM_EXTRA_SITE = http://sourceforge.net/projects/pcmanfm/files
> +LIBFM_EXTRA_DEPENDENCIES = libglib2
> +LIBFM_EXTRA_LICENSE = GPLv2

Dome files have the LGPLV2.1+ header, like:
    src/fm.c
    src/fm-extra.h
    src/base/fm-app-info.c
    [...]

Also, the only file that seem to get compiled is:
    src/extra/fm-xml-file.c

for which the header states it is LGPLv2.1+.

So, even if there's only the COPYING for the GPLv2 and that we only
compile an LGPLv2.1+ file, I'd state both licenses.

> +LIBFM_EXTRA_LICENSE_FILES = COPYING

Here, I'd add src/extra/fm-xml-file.c as a license file, too.

Regards,
Yann E. MORIN.

> +LIBFM_EXTRA_INSTALL_STAGING = YES
> +LIBFM_EXTRA_CONF_OPTS = --with-extra-only --with-gtk=no
> +
> +$(eval $(autotools-package))
> -- 
> 1.7.1
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
