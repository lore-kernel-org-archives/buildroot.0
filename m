From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 15:35:46 +0200
Subject: [Buildroot] [PATCH v2 7/7] package/qt5/qt5webengine: re-enable
 building if BUG_85682=y on Qt5 Latest
In-Reply-To: <20190626125900.48230-8-giulio.benetti@micronovasrl.com>
References: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
 <20190626125900.48230-8-giulio.benetti@micronovasrl.com>
Message-ID: <20190803153546.407dbd68@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jun 2019 14:59:00 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> On Qt5 Latest package qt5webengine depends on package libnss that was
> affected by Gcc Bug 85862, but that bug has been worked around on
> libnss, so we can now remove 'depends on
> !BR2_TOOLCHAIN_HAS_GCC_BUG_85862' as well as '||
> BR2_PACKAGE_QT5_VERSION_5_6' that allowed to build qt5 version 5.6 that
> doesn't depend on libnss.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/qt5/qt5webengine/Config.in | 6 ------
>  1 file changed, 6 deletions(-)

Applied to master after reworking a bit the commit title and commit log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
