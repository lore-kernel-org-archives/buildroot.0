From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:19:20 +0200
Subject: [Buildroot] [PATCH] libtirpc: Fix build error due to missing
 stdint.h inclusion
In-Reply-To: <20170615180517.17185-1-dmitrii@synopsys.com>
References: <20170615180517.17185-1-dmitrii@synopsys.com>
Message-ID: <20170615231920.5816dc03@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Jun 2017 21:05:17 +0300, Dmitrii Kolesnichenko wrote:
> Add patch to fix following error:
> | ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
> |   if (len < (uintptr_t)xdrs->x_base) {
> |              ^~~~~~~~~
> 
> It includes stdint.h to provide uintptr_t.
> 
> This patch has been submitted upstream:
> https://sourceforge.net/p/libtirpc/mailman/libtirpc-devel/
> 
> Signed-off-by: Dmitrii Kolesnichenko <dmitrii@synopsys.com>

Thanks for the contribution. However, could you be more specific about
which Buildroot configuration triggers this build failure?

I don't see build failures on libtirpc in our autobuilders
(http://autobuild.buildroot.net/).

> diff --git a/package/libtirpc/0008-Fix-build-error-due-to-missing-stdint.h-include.patch b/package/libtirpc/0008-Fix-build-error-due-to-missing-stdint.h-include.patch
> new file mode 100644
> index 0000000..ccb0dff
> --- /dev/null
> +++ b/package/libtirpc/0008-Fix-build-error-due-to-missing-stdint.h-include.patch
> @@ -0,0 +1,26 @@
> +Fixes
> +| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
> +|   if (len < (uintptr_t)xdrs->x_base) {
> +|              ^~~~~~~~~
> +
> +Signed-off-by: Khem Raj <raj.khem@...>

Please add your Signed-off-by here as well. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
