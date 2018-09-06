From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 23:41:49 +0200
Subject: [Buildroot] [PATCH next] libusbgx: fix build with glibc-2.28
In-Reply-To: <20180822135234.20670-1-gwenj@trabucayre.com>
References: <20180822135234.20670-1-gwenj@trabucayre.com>
Message-ID: <20180906234149.3af458dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Aug 2018 15:52:34 +0200, Gwenhael Goavec-Merou wrote:

> diff --git a/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch b/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch
> new file mode 100644
> index 0000000000..997cbf9a12
> --- /dev/null
> +++ b/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch
> @@ -0,0 +1,94 @@
> +Add include of sys/sysmacro.h.
> +
> +Without sys/sysmacros.h and with glibc build fails with error like:
> +
> +libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `minor'
> +libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `major'
> +libusbgx-libusbgx-v0.2.0/src/.libs/libusbgx.so: undefined reference to `makedev'
> +
> +Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> +Signed-off-by: Sid Spry <R030t1@gmail.com>

The order of the SoB should be the opposite: first the original author,
then you.

Also, please use a Git-formatted patch.

Could you submit a new version with those minor nits fixed?

Also, could you submit a new pull request upstream, because it seems
that Sid Spry is not going to resubmit a proper patch that takes into
account the comments made by upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
