From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 23:34:57 +0100
Subject: [Buildroot] [PATCH 1/1] Added new package ncdu
In-Reply-To: <1355774648.20811.YahooMailNeo@web120305.mail.ne1.yahoo.com>
References: <1355774648.20811.YahooMailNeo@web120305.mail.ne1.yahoo.com>
Message-ID: <50CF9E11.5070808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Dear Bogdan,

  Thanks for your patch.

  We prefer generally prefer patches to be sent in-line with the correct 
spacing - using git send-email is the easiest way to send a patch.

  Some additional comments below.

On 17/12/12 21:04, Bogdan Radulescu wrote:
>
> Signed-off-by: Bogdan Radulescu<bogdan@nimblex.net>
[snip]
> diff --git a/package/ncdu/Config.in b/package/ncdu/Config.in
> new file mode 100644
> index 0000000..d8b4db4
> --- /dev/null
> +++ b/package/ncdu/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_NCDU
> +       bool "ncdu"

  Indentation in Config.in should be a single TAB.

> +       select BR2_PACKAGE_NCURSES
> +       help
> +         ncdu is a disk usage analyzer with an ncurses interface

  ... except for help which should be one TAB + 2 spaces.

> +
> +         http://dev.yorhel.nl/ncdu
> diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
> new file mode 100644
> index 0000000..26f3b5e
> --- /dev/null
> +++ b/package/ncdu/ncdu.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# ncdu
> +#
> +#############################################################
> +NCDU_VERSION=1.9

  We prefer spaces around the =

NCDU_VERSION = 1.9

> +NCDU_SITE=http://dev.yorhel.nl/download/
> +NCDU_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install

  Since you don't install to staging, this is redundant.

> +NCDU_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install

  I don't understand where this comes from... It looks like it should be 
DESTDIR=$(TARGET_DIR), which is the default, so this line is redundant as 
well.

  It would be nice to also add the licensing:

NCDU_LICENSE = MIT
NCDU_LICENSE_FILES = COPYING

(test with 'make legal-info')

  Regards,
  Arnout

> +
> +NCDU_DEPENDENCIES = ncurses
> +
> +$(eval $(autotools-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
