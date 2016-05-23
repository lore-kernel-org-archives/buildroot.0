From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 12:58:27 +0200
Subject: [Buildroot] [PATCH] liquid-dsp: wrapping isnan in T_ABS to help
 compilation w/ certain gcc
In-Reply-To: <1464000218-48218-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464000218-48218-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160523125827.1ca52536@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 11:43:38 +0100, Vicente Olivert Riera wrote:

> diff --git a/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch b/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch
> new file mode 100644
> index 0000000..e65af33
> --- /dev/null
> +++ b/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch
> @@ -0,0 +1,42 @@
> +wrapping isnan in T_ABS to help compilation w/ certain gcc versions
> +
> +This is an upstreamed patch backported from here:
> +
> +https://github.com/jgaeddert/liquid-dsp/commit/3055eb3da9d0a202c1a975f7db0c8370a09a30bc
> +
> +It will fix the following error:
> +
> +src/math/src/poly.findroots.c: In function
> +'polyc_findroots_bairstow_recursion':
> +src/math/src/poly.findroots.c:305:9: error: non-floating-point argument
> +in call to function '__builtin_isnan'
> +         if (isnan(du) || isnan(dv)) {
> +
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

This stuff should go....

> +
> +From 3055eb3da9d0a202c1a975f7db0c8370a09a30bc Mon Sep 17 00:00:00 2001
> +From: "Joseph D. Gaeddert" <joseph@liquidsdr.org>
> +Date: Thu, 25 Feb 2016 17:47:07 -0500
> +Subject: [PATCH] math/poly: wrapping isnan in T_ABS to help compilation w/
> + certain gcc versions
> +

here.

I've fixed that up when applying. Thanks for investigating this issue
and providing a fix!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
