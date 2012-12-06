From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 07 Dec 2012 00:36:29 +0100
Subject: [Buildroot] [PATCH] tcllib: new package
In-Reply-To: <1354833972-17700-2-git-send-email-zinosat@tiscali.it>
References: <1354833972-17700-1-git-send-email-zinosat@tiscali.it>
 <1354833972-17700-2-git-send-email-zinosat@tiscali.it>
Message-ID: <50C12BFD.6020108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/12 23:46, Davide Viti wrote:
[snip]
> diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
> new file mode 100644
> index 0000000..471720d
> --- /dev/null
> +++ b/package/tcllib/tcllib.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# tcllib
> +#
> +#############################################################
> +TCLLIB_VERSION       = 1.13
> +TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.bz2
> +TCLLIB_SITE          =http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
> +TCLLIB_LICENSE       = tcllib license

  Since it's the same as the tcl license, I'd call it "tcl license".


  Regards,
  Arnout

> +TCLLIB_LICENSE_FILES = license.terms
> +TCLLIB_DEPENDENCIES  = host-tcl
> +
> +$(eval $(autotools-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
