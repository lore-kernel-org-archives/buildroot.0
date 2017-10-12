From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 22:46:38 +0200
Subject: [Buildroot] [PATCH v2 2/2] opencv3: add support for tbb
In-Reply-To: <20170928235043.31891-3-bradford@density.io>
References: <20170928235043.31891-1-bradford@density.io>
 <20170928235043.31891-3-bradford@density.io>
Message-ID: <20171012224638.20c6a202@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Sep 2017 19:50:43 -0400, Bradford Barr wrote:

> diff --git a/package/opencv3/0001-tbb-debug.patch b/package/opencv3/0001-tbb-debug.patch
> new file mode 100644
> index 0000000..808483d
> --- /dev/null
> +++ b/package/opencv3/0001-tbb-debug.patch
> @@ -0,0 +1,27 @@
> +From a56d7592f0f2f63a84e2159171a784026cc99986 Mon Sep 17 00:00:00 2001
> +From: bradford barr <bradford@density.io>
> +Date: Thu, 28 Sep 2017 17:31:41 -0400
> +Subject: [PATCH] TBB Debug Release
> +
> +OpenCV fails to detect tbb on a debug build if the platform has only installed
> +debug libraries.  This PR adds an additional check to the tbb detect logic for
> +systems that only install tbb debug and not both tbb debug and release.

This would be unnecessary if you drop the "debug" support in the tbb
package.

> +config BR2_PACKAGE_OPENCV3_WITH_TBB
> +	bool "tbb support"
> +	select BR2_PACKAGE_TBB

You forgot to propagate the dependencies of tbb here (and don't forget
to add the corresponding Config.in comment).

Otherwise, looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
