From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 15:53:34 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/kodi: switch to
 internal ffmpeg version 3.1.11 build
In-Reply-To: <20180812202352.15128-1-bernd.kuhls@t-online.de>
References: <20180812202352.15128-1-bernd.kuhls@t-online.de>
Message-ID: <20180814155334.0376e758@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Aug 2018 22:23:52 +0200, Bernd Kuhls wrote:
> Kodi 17 is incompatible with ffmpeg-4.x. To prepare the ffmpeg bump we
> switch the current Kodi package to internally build and statically link
> to patched ffmpeg-3.1.11 provided by upstream. Gnutls is added as
> dependency to allow playback of https streams.
> 
> Upstream expects Kodi 17 to be used with ffmpeg 3.1.x (see upstream PR
> 12368) so we choose the upstream way to build ffmpeg instead of provi-
> ding a version choice for ffmpeg in buildroot.
> 
> This commit can be reverted when Kodi is bumped to version 18, currently
> released as alpha3.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2:
> - git-formatted patches (Thomas)
> - fixed pkgconf problem by adding PKG_CONFIG_SYSROOT_DIR instead
>   of using /usr/bin/pkg-config (Thomas)
> - added upstream patch to fix ffmpeg build error on mips

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
