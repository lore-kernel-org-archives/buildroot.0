From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:28:13 +0200
Subject: [Buildroot] [PATCH] lynx: add patch to fix static link issue
In-Reply-To: <20180507200617.2527-1-thomas.petazzoni@bootlin.com>
References: <20180507200617.2527-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180513222813.1c9ec3d4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 May 2018 22:06:17 +0200, Thomas Petazzoni wrote:
> The lynx package incorrectly uses target LDFLAGS to build a host tool,
> which causes a problem when we do a statically link build for the
> target, on a host machine that doesn't support static linking.
> 
> A simple patch fixes the problematic makefile, and it has been
> submitted upstream on the project mailing list.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/38ba2531eeeb4a7985eddd2df8bfaf0b56e6a687/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...s-don-t-build-host-tools-with-target-LDFL.patch | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/lynx/0001-src-chrtrans-don-t-build-host-tools-with-target-LDFL.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
