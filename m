From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:17:26 +0100
Subject: [Buildroot] [PATCH] package/sdl2_net: add missing host-pkgconf
 dependency
In-Reply-To: <20181212085212.12149-1-thomas.petazzoni@bootlin.com>
References: <20181212085212.12149-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181213211726.7afffc30@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 09:52:12 +0100, Thomas Petazzoni wrote:
> The sdl2_net configure script uses pkg-config to finx sdl2. If it
> doesn't find pkg-config, it tries to locate sdl2-config, and defaults
> to /usr/bin/sdl2-config, which causes the build to fail with:
> 
> arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/SDL2'
> 
> Fix this by adding host-pkgconf to the dependencies of sdl2_net. We
> could have added the right autoconf cache variable to tell the
> configure script where sdl2-config is located, but since pkg-config is
> tried first, let's use that.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/sdl2_net/sdl2_net.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
