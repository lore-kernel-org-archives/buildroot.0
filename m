From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 23:04:39 +0200
Subject: [Buildroot] [PATCH 2/2] package/lldpd: explicit optional
 dependency
In-Reply-To: <1471171604-16162-2-git-send-email-yann.morin.1998@free.fr>
References: <1471171604-16162-1-git-send-email-yann.morin.1998@free.fr>
 <1471171604-16162-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1e7265e6-5ca3-ca95-397f-6f69d681348e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-08-16 12:46, Yann E. MORIN wrote:
> check is an optional depenency of lldpd, so we must depend on it when it
> is enabled.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However, while you're at it, there also seems to be a hidden dependency on
valgrind:

AC_CHECK_HEADERS([valgrind/valgrind.h])

 Regards,
 Arnout

> ---
>  package/lldpd/lldpd.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
> index 008d4bf..f3f047f 100644
> --- a/package/lldpd/lldpd.mk
> +++ b/package/lldpd/lldpd.mk
> @@ -12,6 +12,10 @@ LLDPD_LICENSE_FILES = README.md
>  # Touching configure.ac and Makefile.am in our patches:
>  LLDPD_AUTORECONF = YES
>  
> +ifeq ($(BR2_PACKAGE_CHECK),y)
> +LLDPD_DEPENDENCIES += check
> +endif
> +
>  # Detection of c99 support in configure fails without WCHAR. To enable
>  # automatic detection of c99 support by configure, we need to enable
>  # WCHAR in toolchain. But actually we do not need WCHAR at lldpd
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
