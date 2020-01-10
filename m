From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 23:15:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/libva-utils: fix non x11 build
In-Reply-To: <20200106055116.149922-1-bernd.kuhls@t-online.de>
References: <20200106055116.149922-1-bernd.kuhls@t-online.de>
Message-ID: <20200110231558.41c1dcd3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Mon,  6 Jan 2020 06:51:16 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/70f/70fd6609fffdaa07be583420dab067da27b7d505/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-fix-build-without-x11.patch          | 33 +++++++++++++++++++
>  package/libva-utils/libva-utils.mk            |  2 ++
>  2 files changed, 35 insertions(+)
>  create mode 100644 package/libva-utils/0001-fix-build-without-x11.patch
> 
> diff --git a/package/libva-utils/0001-fix-build-without-x11.patch b/package/libva-utils/0001-fix-build-without-x11.patch
> new file mode 100644
> index 0000000000..905e90410f
> --- /dev/null
> +++ b/package/libva-utils/0001-fix-build-without-x11.patch
> @@ -0,0 +1,33 @@
> +From 5efef48d74d772cb5318345aa61d94d27e0c42d1 Mon Sep 17 00:00:00 2001
> +From: Lukas Rusak <lorusak@gmail.com>
> +Date: Fri, 22 Feb 2019 18:43:25 -0800
> +Subject: [PATCH] only build sfcsample when x11 is enabled
> +
> +Downloaded from https://github.com/LibreELEC/LibreELEC.tv/pull/4093

This link now says:

Upsteam fix seems to be intel/libva-utils at 82ccf0f

which points to https://github.com/intel/libva-utils/commit/82ccf0fc82ec3929e545fb06880b1ea955ef54ac

Could you try this one instead, since it has been merged upstream ?
(And it doesn't need autoreconf).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
