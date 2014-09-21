From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:39:57 +0200
Subject: [Buildroot] [PATCH 2/2] qemu-sparc: use default gcc
In-Reply-To: <20140919103404.GA24103@waldemar-brodkorb.de>
References: <20140919103404.GA24103@waldemar-brodkorb.de>
Message-ID: <20140921193957.77da49d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Fri, 19 Sep 2014 12:34:04 +0200, Waldemar Brodkorb wrote:
> With the kernel patch from:
> http://patchwork.ozlabs.org/patch/384285/
> There is no problem with latest gcc anymore.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../linux/linux-0001-sparc-memset-fix.patch        |   50 ++++++++++++++++++++
>  configs/qemu_sparc_ss10_defconfig                  |    2 +
>  package/gcc/Config.in.host                         |    7 ++-
>  3 files changed, 55 insertions(+), 4 deletions(-)
>  create mode 100644 board/qemu/sparc-ss10/linux/linux-0001-sparc-memset-fix.patch

It's a bit annoying that we need a patch to the kernel to make sure
that gcc can build a working kernel since it means that people not
using the Qemu defconfig for SPARC builds will not get the patch.

Though the problem has been around since a long time, so if people
really bothered about working SPARC support in upstream kernel/gcc,
they should have complained earlier.

So: applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
