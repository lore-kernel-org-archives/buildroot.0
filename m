From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 11:03:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/quota: fix NLS build
In-Reply-To: <20191226085938.2198391-1-fontaine.fabrice@gmail.com>
References: <20191226085938.2198391-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226110305.40906ef7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 26 Dec 2019 09:59:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/9e40a5b97dcd52cdfbd11688426ecad70390d56b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...l-AM_MKINSTALLDIRS-to-substitute-MKI.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/quota/0002-configure.ac-call-AM_MKINSTALLDIRS-to-substitute-MKI.patch
> 
> diff --git a/package/quota/0002-configure.ac-call-AM_MKINSTALLDIRS-to-substitute-MKI.patch b/package/quota/0002-configure.ac-call-AM_MKINSTALLDIRS-to-substitute-MKI.patch
> new file mode 100644
> index 0000000000..a8cf7eebcc
> --- /dev/null
> +++ b/package/quota/0002-configure.ac-call-AM_MKINSTALLDIRS-to-substitute-MKI.patch
> @@ -0,0 +1,37 @@
> +From 48fb73784875fa654f6179c5f71756d898a6b6f5 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 26 Dec 2019 09:43:32 +0100
> +Subject: [PATCH] configure.ac: call AM_MKINSTALLDIRS to substitute
> + @MKINSTALLDIRS@
> +
> +MKINSTALLDIRS is obsolete and doesn't get automatically called.
> +
> +Force call AM_MKINSTALLDIRS() macro to substitute every @MKINSTALLDIRS@
> +occurence in *.in files.

When I looked at the build issue, my first thought was that
"QUOTA_GETTEXTIZE = YES" was missing, but I did not test this. Did you
test with GETTEXTIZE = YES ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
