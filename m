From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 10:28:07 +0200
Subject: [Buildroot] [PATCH v7] libdrm: change to meson build system
In-Reply-To: <20190625201128.24781-1-ps.report@gmx.net>
References: <20190625201128.24781-1-ps.report@gmx.net>
Message-ID: <20190804102807.5b0d142d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Jun 2019 22:11:27 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - remove legacy patch
>   0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
> 
> - add patch to fix meson atomic ops detection
>   0003-meson.build-fix-intel-atomics-detection.patch
> 
> - add patch to enable static build
>   0004-meson.build-enable-static-build.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - convertion from "LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'"
>     is missing (maybe meson gets it right (?) or use LIBDRM_CFLAGS
>     to force it)

Applied to master, thanks. However, there is already one build failure,
I'm not sure if it's directly related to the meson change:

  http://autobuild.buildroot.net/results/d15/d15ed604756cac4e4a87afca61b7a4778f293baf/build-end.log

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
