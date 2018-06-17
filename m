From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 23:46:04 +0200
Subject: [Buildroot] [PATCH] qt5: bump latest version to 5.11.0
In-Reply-To: <20180613234411.14823-1-gael.portay@savoirfairelinux.com>
References: <20180613234411.14823-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180617234604.0a7d1225@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jun 2018 19:44:11 -0400, Ga?l PORTAY wrote:
> qtwayland:
> 
> 	Remove 0001-Fix-compilation-for-Renesas-R-Car-M3.patch (upstream
> 	since [1]).
> 
> qtwebengine:
> 
> 	New 3rd-part 0001-Fix-build-with-GCC-8.1.0.patch (upstream in
> 	chromium [2]).
> 
> [1]: https://github.com/qt/qtwayland/commit/8b204b2c56be5e7c1fd21144ae140c9b865dd86b
> [2]: https://codereview.qt-project.org/#/c/229160/
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

I've applied. But there was something weird, see below.


> diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
> index ce1189d0e1..6bd9a9d51b 100644
> --- a/package/qt5/qt5charts/qt5charts.hash
> +++ b/package/qt5/qt5charts/qt5charts.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
>  sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz

This didn't apply, because there was no such hash in upstream
Buildroot, since qtcharts only appeared in Qt 5.7.

Could you make sure your patches apply on top of the latest master ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
