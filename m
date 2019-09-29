From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Sep 2019 09:14:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: remove -mno-compact-eh
 for Code Sourcery MIPS
In-Reply-To: <20190929064724.4245-1-bernd.kuhls@t-online.de>
References: <20190929064724.4245-1-bernd.kuhls@t-online.de>
Message-ID: <20190929091439.13aa0db0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 08:47:24 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> https://git.buildroot.net/buildroot/commit/package/mesa3d?id=e032a29604e843c8adc551d5ceb3c45bc7715b4d
> added -mno-compact-eh to CFLAGS/CXXFLAGS.
> 
> This breaks mesa build since its switch to meson:
> 
> Sanity check compile stderr:
> cc: error: unrecognized command line option ?-mno-compact-eh?; did you mean ?-fno-compare-elim??
> 
> It turns out that mesa3d still builds now with this option.
> 
> Fixes:
> http://autobuild.buildroot.net/results/37f/37fce69751aa31ae467d502e660d7db513333d4d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk | 8 --------
>  1 file changed, 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
