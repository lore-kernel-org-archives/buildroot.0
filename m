From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:01:58 +0200
Subject: [Buildroot] [PATCH] package/musl: fix conflict with riscv
 kernel headers
In-Reply-To: <546b2d18faabdbb04764d763c093e7e590cab627.1565071355.git.baruch@tkos.co.il>
References: <546b2d18faabdbb04764d763c093e7e590cab627.1565071355.git.baruch@tkos.co.il>
Message-ID: <20190806220158.3c54b738@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Aug 2019 09:02:35 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Add two patches to rename structs that both musl and kernel headers
> define. This fixes build of strace for risc64 at it happens to use
> headers from both sources.
> 
> Fixes (strace):
> http://autobuild.buildroot.net/results/ac32e83dc5eb5ce2809fc4b9d11f540dbdae9ed6/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-risc64-conflict-with-kernel-headers.patch | 61 +++++++++++++++++++

This one has been applied upstream.

>  ...regs_struct-conflict-with-kernel-hea.patch | 28 +++++++++

But this one has been rejected, they prefer to have an empty user.h.

Could you send an updated version that takes into account upstream's
feedback ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
