From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 10:02:21 +0200
Subject: [Buildroot] [PATCH] fakeroot: fix spurious message "undefined
 symbol"
In-Reply-To: <20161004150530.12197-1-maxime.hadjinlian@gmail.com>
References: <20161004150530.12197-1-maxime.hadjinlian@gmail.com>
Message-ID: <20161005100221.5ae0ad76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Oct 2016 17:05:30 +0200, Maxime Hadjinlian wrote:

> diff --git a/package/fakeroot/hide-dlsym-error.patch b/package/fakeroot/hide-dlsym-error.patch
> new file mode 100644
> index 0000000..3fd34c8
> --- /dev/null
> +++ b/package/fakeroot/hide-dlsym-error.patch

This is not a proper name for a patch, it should have a sequence number.

> @@ -0,0 +1,32 @@
> +Description: Hide error from dlsym()
> + dlsym(), starting in glibc 2.24 actually reports errors. In our case,
> + we try to get ACL functions which are not in the glibc. This causes
> + failures in test suites, so hide those messages for non-debugging
> + purposes for now. It also makes the build logs annoying to read.
> +Author: Julian Andres Klode <juliank@ubuntu.com>
> +Origin: vendor
> +Bug-Debian: https://bugs.debian.org/830912
> +Forwarded: no
> +Last-Update: 2016-08-12

This lacks your Signed-off-by line.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
