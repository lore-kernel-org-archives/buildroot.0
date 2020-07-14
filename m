From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 10:13:47 +0200
Subject: [Buildroot] [PATCH] package/gpsd: bump version to 3.20
In-Reply-To: <20200714033848.1516000-1-hancock@sedsystems.ca>
References: <20200714033848.1516000-1-hancock@sedsystems.ca>
Message-ID: <20200714101347.16e52a6c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 21:38:48 -0600
Robert Hancock <hancock@sedsystems.ca> wrote:

> Removes BR2_PACKAGE_GPSD_PPS config option, since PPS functionality is
> no longer optional and always enabled in gpsd's SCons configuration.
> 
> Removed passing ntpshm=y to SCons since that feature is also no longer
> optional.
> 
> Added a patch adapted from changes merged upstream post-3.20 to fix a
> build failure during cross-compilation when checking sizeof(time_t)
> and where shared libraries were being linked with ld rather than g++.
> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>  ...s-during-gpsd-3.20-cross-compilation.patch | 148 ++++++++++++++++++
>  package/gpsd/Config.in                        |   3 -
>  package/gpsd/gpsd.hash                        |   2 +-
>  package/gpsd/gpsd.mk                          |   6 +-
>  4 files changed, 150 insertions(+), 9 deletions(-)
>  create mode 100644 package/gpsd/0001-Fix-errors-during-gpsd-3.20-cross-compilation.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
