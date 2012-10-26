From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Oct 2012 09:38:00 +0200
Subject: [Buildroot] [PATCH] gqview: Fix build failure due to missing -lm
In-Reply-To: <1349555736-10008-1-git-send-email-gvaxon@gmail.com>
References: <1349555736-10008-1-git-send-email-gvaxon@gmail.com>
Message-ID: <508A3DD8.8060009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/12 22:35, Valentine Barshak wrote:
> Signed-off-by: Valentine Barshak<gvaxon@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Problem can be reproduced on e.g. x86_64 with external toolchain.

  And since upstream is dead, the simple addition of -lm to LIBS is an
adequate solution.

  Regards,
  Arnout

> ---
>   package/gqview/gqview.mk | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
> index 2f64cd0..7d09fda 100644
> --- a/package/gqview/gqview.mk
> +++ b/package/gqview/gqview.mk
> @@ -7,6 +7,7 @@ GQVIEW_VERSION = 2.1.5
>   GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
>   GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
>   GQVIEW_DEPENDENCIES = host-pkg-config libgtk2
> +GQVIEW_CONF_ENV = LIBS="-lm"
>
>   $(eval $(autotools-package))
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
