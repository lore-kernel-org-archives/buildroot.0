From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 27 Sep 2017 17:36:44 +0200
Subject: [Buildroot] [PATCH 1/2] tbb: new package
In-Reply-To: <20170926203504.22326-2-bradford@density.io>
References: <20170926203504.22326-1-bradford@density.io>
 <20170926203504.22326-2-bradford@density.io>
Message-ID: <CAHXCMM+zCdA0wEd+taFp_JOC5bx1k0OR4MOwOTJ5_trEHUsUMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Sep 26, 2017 at 10:35 PM, Bradford Barr <bradford@density.io> wrote:
> From: bradford barr <bradford@density.io>
>
> Intel Threading Building Blocks (TBB), is a C++ library to help developers
> write highly parallelized applications. OpenCV uses it to accelerate some of
> it's more heavy weight procedures.
>
> Signed-off-by: bradford barr <bradford@density.io>
[...]
> --- /dev/null
> +++ b/package/tbb/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_TBB
> +       bool "tbb"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       help
> +         Intel(R) Threading Building Blocks (Intel(R) TBB) lets you easily
> +         write parallel C++ programs that take full advantage of multicore
> +         performance, that are portable, composable and have future-proof
> +         scalability.
> +
> +         https://www.threadingbuildingblocks.org/
> +
> +comment "tbb needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS

I wonder whether TBB is available for all architecture supported by BR.

Regards,

-- 
Samuel
