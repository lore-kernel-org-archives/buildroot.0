From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 22:51:55 +0100
Subject: [Buildroot] [PATCH] package/libgeos: fix build failure due to
 Gcc Bug 68485
In-Reply-To: <20210212224238.1938197-1-giulio.benetti@benettiengineering.com>
References: <20210212224238.1938197-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210213225155.6b83e879@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Fri, 12 Feb 2021 23:42:38 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Package libgeos manifests Microblaze Gcc Bug 68485 resulting in a build
> failure due to an Internal Compiler Error.
> 
> As done for other packages in Buildroot work around this Gcc Bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0da/0daa6b259aea5381fad86d01e6dd026b1c8ad073/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libgeos/libgeos.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks. Could you check if this bug still exists
with gcc 10.x, and if it does, ping on the gcc bug report ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
