From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 17:18:41 +0100
Subject: [Buildroot] [PATCH 5/5] lttng-babeltrace: bump to version 1.4.0
In-Reply-To: <20161029180339.24535-6-eeppeliteloop@gmail.com>
References: <20161029180339.24535-1-eeppeliteloop@gmail.com>
 <20161029180339.24535-6-eeppeliteloop@gmail.com>
Message-ID: <20161030171841.7e58ddee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 14:03:39 -0400, Philippe Proulx wrote:
> Also: remove the host package. Users can get Babeltrace on major
> Linux distributions.

Please improve the commit log with details about the different patches
being removed/added.

> new file mode 100644
> index 0000000..1885526
> --- /dev/null
> +++ b/package/lttng-babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
> @@ -0,0 +1,25 @@
> +From d3cce60dfde30bd2fd67caa3fbc5f111131c243a Mon Sep 17 00:00:00 2001
> +From: Philippe Proulx <eeppeliteloop@gmail.com>
> +Date: Fri, 28 Oct 2016 01:48:25 -0400
> +Subject: [PATCH] configure.ac: remove elfutils version test for Buildroot

Why? Is this version check causing a problem?

> diff --git a/package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch b/package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
> new file mode 100644
> index 0000000..3a8e154
> --- /dev/null
> +++ b/package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
> @@ -0,0 +1,31 @@
> +From 27e37d2621317d25e08ba0683bf8540b05b9347d Mon Sep 17 00:00:00 2001
> +From: Philippe Proulx <eeppeliteloop@gmail.com>
> +Date: Fri, 28 Oct 2016 02:09:20 -0400
> +Subject: [PATCH] tests/lib/Makefile.am: remove unneeded -static flag
> +
> +Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Please explain why it is unneeded and why we want to remove it. I know
why: it's because it breaks the build in shared-only builds. But it
should be explained here as well.

Do you think it can be accepted upstream?

> -HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
> -	host-popt host-util-linux host-libglib2 host-pkgconf
> -
> -# for 0002-configure-fix-uuid-support-detection-on-static-build.patch
>  LTTNG_BABELTRACE_AUTORECONF = YES

Please keep a comment above this line that explains why it is needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
