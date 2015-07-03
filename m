From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 Jul 2015 18:07:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtool: disable makeinfo
In-Reply-To: <e64f1903478b53f185f3bf114f86c46948a31311.1435886073.git.sam.bobroff@au1.ibm.com>
References: <e64f1903478b53f185f3bf114f86c46948a31311.1435886073.git.sam.bobroff@au1.ibm.com>
Message-ID: <5596B35A.2020804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/15 03:14, Sam Bobroff wrote:
> host-libtool can fail to build if the host is missing makeinfo, so
> disable it.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> Without this patch, buildroot fails to build host-libtool on my Debian
> 8 system, as it doesn't have the texinfo package installed.
> 
>  package/libtool/libtool.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
> index 28786d2..8688f8b 100644
> --- a/package/libtool/libtool.mk
> +++ b/package/libtool/libtool.mk
> @@ -13,6 +13,7 @@ LIBTOOL_DEPENDENCIES = host-m4
>  LIBTOOL_LICENSE = GPLv2+
>  LIBTOOL_LICENSE_FILES = COPYING
>  
> +HOST_LIBTOOL_CONF_ENV = MAKEINFO=true
>  HOST_LIBTOOL_LIBTOOL_PATCH = NO
>  
>  # We have a patch that affects libtool.m4, which triggers an autoreconf
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
