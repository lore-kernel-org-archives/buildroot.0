From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:31:52 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libtasn1: fix build with gcc 4.8
In-Reply-To: <20200424180321.892100-1-fontaine.fabrice@gmail.com>
References: <20200424180321.892100-1-fontaine.fabrice@gmail.com>
Message-ID: <20200427223152.3eb367dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 20:03:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/0030c903abf6c964806a97067af94a99867a3896
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Set -std=gnu99 instead of patching source code
> 
>  package/libtasn1/libtasn1.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
> index 9b8260ab48..d5a6c69965 100644
> --- a/package/libtasn1/libtasn1.mk
> +++ b/package/libtasn1/libtasn1.mk
> @@ -17,4 +17,6 @@ LIBTASN1_AUTORECONF = YES
>  # 'missing' fallback logic botched so disable it completely
>  LIBTASN1_CONF_ENV = MAKEINFO="true"
>  
> +LIBTASN1_CONF_OPTS = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"

BTW: this should be fixed upstream by adding AC_PROG_CC_C99 in the
configure.ac. Then we can drop adding -std=gnu99 manually.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
