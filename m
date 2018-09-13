From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 20:53:37 +0200
Subject: [Buildroot] [PATCH v3] libusbgx: fix build with glibc-2.28
In-Reply-To: <20180913132713.29628-1-gwenj@trabucayre.com>
References: <20180913132713.29628-1-gwenj@trabucayre.com>
Message-ID: <20180913205337.6aa6359b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Sep 2018 15:27:13 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html sys/sysmacros.h
> must be explicitly included.
> Without sys/sysmacros.h and with glibc-2.28 build fails with error like:
> src/.libs/libusbgx.so: undefined reference to minor' src/.libs/libusbgx.so: undefined reference tomajor'
> src/.libs/libusbgx.so: undefined reference to `makedev'
> 
> backport pr #29 (https://github.com/libusbgx/libusbgx/pull/29) (now applied)
> 
> fix:
> http://autobuild.buildroot.net/results/872e2ab084c0c9bf466265d2f66140fbba692ee6/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v2 -> v3:
>  * use a git-formatted patch (thomas)
>  * change SoB order (thomas)
> Changes v1 -> v2:
>  * specify branch and glibc version (thomas)
> ---
>  .../0001-Add-include-of-sys-sysmacro.h.patch       | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
