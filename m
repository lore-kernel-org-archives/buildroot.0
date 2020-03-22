From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:15:44 +0100
Subject: [Buildroot] [PATCH v1] package/mesa3d: fix musl related compile
 failures
In-Reply-To: <20200322121520.5898-1-ps.report@gmx.net>
References: <20200322121520.5898-1-ps.report@gmx.net>
Message-ID: <20200322221544.2d63fe15@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 13:15:20 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   http://autobuild.buildroot.net/results/1881daae69992e30a9c1fff1f639d57f82e6ee19
> 
>   ../src/gallium/drivers/vc4/vc4_bufmgr.c:110:57: error: format '%ld' expects argument of type 'long int', but argument 3 has type 'time_t' {aka 'long long int'} [-Werror=format=]
> 
>   ../src/gallium/drivers/panfrost/pan_bo.h:93:9: error: unknown type name ?time_t?
> 
>   ../src/gallium/drivers/v3d/v3d_bufmgr.c:83:57: error: format ?%ld? expects argument of type ?long int?, but argument 3 has type ?time_t? {aka ?long long int?} [-Werror=format=]
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../0005-vc4_bufmgr-fix-time_t-printf.patch   | 33 +++++++++++++++++++
>  ...n_bo.h-add-time.h-include-for-time_t.patch | 32 ++++++++++++++++++
>  .../0007-v3d_bufmgr-fix-time_t-printf.patch   | 33 +++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 package/mesa3d/0005-vc4_bufmgr-fix-time_t-printf.patch
>  create mode 100644 package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
>  create mode 100644 package/mesa3d/0007-v3d_bufmgr-fix-time_t-printf.patch

Applied to master, thanks. Please submit the patches upstream, as usual! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
