From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 14:05:27 +0200
Subject: [Buildroot] [PATCH 1/1] libebml: fix build on some toolchains
In-Reply-To: <20180430094422.5136-1-fontaine.fabrice@gmail.com>
References: <20180430094422.5136-1-fontaine.fabrice@gmail.com>
Message-ID: <20180430140527.3301f3bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Apr 2018 11:44:22 +0200, Fabrice Fontaine wrote:
> Replace climits include by limits (retrieve upstream patch from:
> https://github.com/Matroska-Org/libebml/commit/e46906b80e7662fb78d305f576412f9fa4a22218)
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/3c2402a7052acb67fc7e03ad2ff27e84534aaa36
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...bmlSInteger-Use-limits-instead-of-climits.patch | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/libebml/0001-EbmlSInteger-Use-limits-instead-of-climits.patch
> 
> diff --git a/package/libebml/0001-EbmlSInteger-Use-limits-instead-of-climits.patch b/package/libebml/0001-EbmlSInteger-Use-limits-instead-of-climits.patch
> new file mode 100644
> index 0000000000..3e341d0792
> --- /dev/null
> +++ b/package/libebml/0001-EbmlSInteger-Use-limits-instead-of-climits.patch
> @@ -0,0 +1,23 @@
> +From e46906b80e7662fb78d305f576412f9fa4a22218 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Hugo=20Beauz=C3=A9e-Luyssen?= <hugo@beauzee.fr>
> +Date: Mon, 23 Apr 2018 12:05:42 +0200
> +Subject: [PATCH] EbmlSInteger: Use <limits> instead of <climits>
> +
> +The former is the proper header to use for std::numerical_limits

This lacks your SoB line, and it would be good to include a reference
to the upstream commit as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
