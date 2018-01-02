From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 21:58:56 +0100
Subject: [Buildroot] [PATCH 2/2] fs/iso9660: fix transparent
 (de)compression
In-Reply-To: <e793abe185c20ebd853db927552156e203813613.1514923441.git.yann.morin.1998@free.fr>
References: <cover.1514923441.git.yann.morin.1998@free.fr>
 <e793abe185c20ebd853db927552156e203813613.1514923441.git.yann.morin.1998@free.fr>
Message-ID: <20180102215856.16467461@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Jan 2018 21:04:12 +0100, Yann E. MORIN wrote:
> It needs mkzftree from zisofs_tools, so we add a dependency to it, and
> we call that one explicitly (to avoid using the one from the host in
> PATH.
> 
> It also needs the the uncompressed kernel image, but because it is
> already in target/ so it gets compressed by mkzftree. We have two
> options:
>   - compress everything but the kernel image,
>   - compress everything, kernel included, and recopy it later.
> 
> We choose the latter, because it is the simplest solution. So, we alwats
> define the kernel-copy hook, but only register it when needed.
> 
> Finally, itneeds a kernel with support for transparent (de)compression,
> so we update the existing test config.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  fs/iso9660/iso9660.mk                               | 12 ++++++++----
>  support/testing/conf/minimal-x86-qemu-kernel.config |  1 +
>  2 files changed, 9 insertions(+), 4 deletions(-)

Applied to master after changing the dependency on host-zisofs-tools
following my change in PATCH 1/2, and fixing a few typos in the commit
log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
