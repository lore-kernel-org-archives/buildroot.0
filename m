From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 21:40:58 +0100
Subject: [Buildroot] [PATCH v2] package/python-numpy: fix fenv build
 failure on ARC with glibc
In-Reply-To: <20190114154316.47795-1-Evgeniy.Didin@synopsys.com>
References: <20190114154316.47795-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20190114214058.423cb7f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Jan 2019 18:43:16 +0300, Evgeniy Didin wrote:
> Building python-numpy on ARC with glibc fails due to missing FE_*
> definitions in <fenv.h>. These exceptions are not supported by
> ARC architecture. Let's add patch, which disables compilation
> of a part of the code in which FE_* errors occur for ARC.
> 
> ARCompact toolchain issues are already fixed in the latest toolchain.
> Also since commit "311af5e8c2db887800639bc803c8201b6b70e9ce"
> ("toolchain/toolchain-buildroot: enable glibc for all little-endian
> ARCs with atomic ops") glibc is available for ARCompact.
> That is why in Config.in we are leaving only "BR_arc" and
> removing comments, which are not actual.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
> Changes since v1:
> -Modify patch according to uClibc patch
> -Remove irrelevant comments in Config.in
> -Update commit message and title
>  .../0003-no-FPU-exceptions-bits-on-ARC-glibc.patch | 42 ++++++++++++++++++++++
>  package/python-numpy/Config.in                     |  4 +--
>  2 files changed, 43 insertions(+), 3 deletions(-)
>  create mode 100644 package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch

Applied to master, thanks. Please submit the patch upstream if not
already done. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
