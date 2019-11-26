From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:51:46 +0100
Subject: [Buildroot] [PATCH v1] package/libdrm: fix nouveau tests
 compile for musl
In-Reply-To: <20191125205520.9234-1-ps.report@gmx.net>
References: <20191125205520.9234-1-ps.report@gmx.net>
Message-ID: <20191126225146.0581d8ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Nov 2019 21:55:20 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Add openembedded provided patch [2] to fix musl toolchain compile failures
> because of different ioctl() signatures, (int, int, ...) vs. (int, unsigned
> long, ...).
> 
> Fixes:
> 
>   ../tests/nouveau/threaded.c:39:5: error: conflicting types for 'ioctl'
>   int ioctl(int fd, unsigned long request, ...)
> 
> [1] http://autobuild.buildroot.net/results/047f149a928ac2a17e25211a0a8a264ebae369ac
> [2] https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...uveau-threaded-adapt-ioctl-signature.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/libdrm/0006-tests-nouveau-threaded-adapt-ioctl-signature.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
