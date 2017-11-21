From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Nov 2017 09:13:33 +0100
Subject: [Buildroot] [PATCH 3/3] lttng-tools: bump to version 2.10.1
In-Reply-To: <20171120232006.22588-3-eeppeliteloop@gmail.com>
References: <20171120232006.22588-1-eeppeliteloop@gmail.com>
 <20171120232006.22588-3-eeppeliteloop@gmail.com>
Message-ID: <20171121091333.6213c754@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Nov 2017 18:20:06 -0500, Philippe Proulx wrote:
> Adding 0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch
> to detect if dlmopen() exists and disable parts of the build accordingly
> if not. This fixes a bug when building with musl or uClibc-ng.
> 
> Adding 0002-Fix-src-common-pipe.h-include-sys-types.h-for-ssize_.patch
> to fix an #include bug when building with musl.
> 
> Adding 0003-Fix-warning-src-bin-lttng-utils.c-cast-incompatible-.patch
> to remove compilation warnings.
> 
> All three new patches are in upstream's master branch as of this date
> and will be part of an eventual release.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Thanks for working on this!

> diff --git a/package/lttng-tools/0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch b/package/lttng-tools/0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch
> new file mode 100644
> index 0000000000..8e14a14413
> --- /dev/null
> +++ b/package/lttng-tools/0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch
> @@ -0,0 +1,249 @@
> +From bc1d8ca01415710d40224de312c7ecf6f4223301 Mon Sep 17 00:00:00 2001
> +From: Philippe Proulx <eeppeliteloop@gmail.com>
> +Date: Mon, 6 Nov 2017 18:46:41 -0500
> +Subject: [PATCH] Fix: detect dlmopen() and disable corresponding tests if not
> + available
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +musl and uClibc-ng are known not to support dlmopen(). LTTng-UST has
> +this dlmopen() detection.
> +
> +Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> +[Philippe: backport from upstream commit bc1d8ca0
> +           edited to remove .gitignore part]
> +Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>

Would it be possible to get just this patch, on the current version of
lttng-tools.

Indeed, we want to fix the build issue of lttng-tools in Buildroot's
master branch, but the version bumps can only got in the next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
