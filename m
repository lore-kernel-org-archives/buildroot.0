From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:37:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: fix
 xlib_libXfont2 dependency
In-Reply-To: <20200905145323.1096973-1-bernd.kuhls@t-online.de>
References: <20200905145323.1096973-1-bernd.kuhls@t-online.de>
Message-ID: <20200906143709.1a4b42ac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Sep 2020 16:53:23 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The dependency to xlib_libXfont2 was mistakenly removed in
> https://git.buildroot.net/buildroot/commit/?id=e6dc4f1857eed27a19abd57fae7428bea38b69e5
> 
> Add it back again to fix build errors detected by the autobuilders and
> remove handling of xlib_libXfont as well because only older versions of
> xserver_xorg-server needed it.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f72/f72cc9b30e55e2c665de7a00482a1c3ba702118c/
> http://autobuild.buildroot.net/results/9dd/9dd99e633dee8f11e7b2b973d4a72e51a2812ec9/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xserver_xorg-server/Config.in              | 1 +
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 9 +--------
>  2 files changed, 2 insertions(+), 8 deletions(-)

Applied to master, thanks. It is very, very good that the commit log
contains the details of since when the issue is occurring, and why.
Thanks for that!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
