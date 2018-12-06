From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:57:17 +0100
Subject: [Buildroot] [PATCH] package/lynx: add dependency on host-pkgconf
In-Reply-To: <20181203145152.7945-1-thomas.petazzoni@bootlin.com>
References: <20181203145152.7945-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181206215717.2baeaa2b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 15:51:52 +0100, Thomas Petazzoni wrote:
> The Lynx configure script uses pkg-config when available:
> 
> checking for nios2-buildroot-linux-gnu-pkg-config... /home/thomas/projets/buildroot/output/host/bin/pkg-config
> checking pkg-config for openssl... yes
> [...]
> checking pkg-config for ncurses... yes
> 
> Using pkg-config avoids build failures such as:
> 
> checking for _nc_freeall... no
> configure: error: Configuration does not support color-styles
> make: *** [/home/test/autobuild/run/instance-1/output/build/lynx-2.8.9rel.1/.stamp_configured] Error 1
> 
> When building with "make lynx", so that pkg-config is not built
> before. The issue is that in this case, lynx configure script picks up
> the ncurses6-config script for the host ncurses instead of the one in
> staging. Using pkg-config solves that nicely.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/lynx/lynx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
