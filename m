From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 23:16:16 +0100
Subject: [Buildroot] [PATCH 1/1] check-bin-arch: skip /lib/modules to
 allow 32-bit userland on 64-bit arch
In-Reply-To: <20180220111156.31881-1-thomas.de_schampheleire@nokia.com>
References: <20180220111156.31881-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180225231616.73e79a1b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Feb 2018 12:11:56 +0100, Thomas De Schampheleire wrote:
> The script check-bin-arch fails as follows on a config for PowerPC e6500
> (64-bit CPU) with BR2_ARCH="powerpc" (32-bit userland desired):
> 
> ERROR: architecture for "/lib/modules/..../lib/libcrc32c.ko"
>             is "PowerPC64", should be "PowerPC"
> 
> This situation is perfectly acceptable: the kernel is 64-bit and so are its
> modules, even though userland is 32-bit.
> 
> To keep check-bin-arch and its caller simple, just skip /lib/modules/
> entirely, like is done for /lib/firmware and some others.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/scripts/check-bin-arch | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
