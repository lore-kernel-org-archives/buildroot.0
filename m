From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:22:44 +0200
Subject: [Buildroot] [PATCH] package/xen: Fix qemu-xen memfd build
 failure
In-Reply-To: <1523211915-680-1-git-send-email-alistair@alistair23.me>
References: <1523211915-680-1-git-send-email-alistair@alistair23.me>
Message-ID: <20180409112244.4936e731@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Apr 2018 11:25:15 -0700, Alistair Francis wrote:
> Fix the QEMU memfd compile error:
> tools/qemu-xen/util/memfd.c:40:12: error: static declaration of 'memfd_create' follows non-static declaration
>  static int memfd_create(const char *name, unsigned int flags)
>             ^~~~~~~~~~~~
> 
> that has been introduced since the Glibc 2.27 upgrade.
> 
> This just involves porting the upstream QEMU patch to the Xen QEMU tree.
> 
> This fixes:
> http://autobuild.buildroot.net/results/ec7cda00e07b0c98a9a366244b67611e042e0d4b/
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  package/xen/0003-memfd-fix-configure-test.patch | 62 +++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/xen/0003-memfd-fix-configure-test.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
