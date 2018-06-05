From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:49:11 +0200
Subject: [Buildroot] [PATCH] libusb: fix clock_gettime librt dependency
 check
In-Reply-To: <8cd6b40c6debfeb4861bc79b899417a01466e962.1528198930.git.baruch@tkos.co.il>
References: <8cd6b40c6debfeb4861bc79b899417a01466e962.1528198930.git.baruch@tkos.co.il>
Message-ID: <20180605184911.35062398@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 14:42:10 +0300, Baruch Siach wrote:
> The detection of the librt dependency of clock_gettime in glibc before
> 2.17 is broken. We do not support glibc older than 2.17 for target, but
> we still need to support hosts using old glibc. Add a patch fixing that.
> 
> Should fix (host-imx-usb-loader):
> http://autobuild.buildroot.net/results/0a1/0a156449e5f38a6092ab9c88e3e3f5ea9abc0f03/
> http://autobuild.buildroot.net/results/347/347f1b9bce2f0854e8ca6d49b9a9b3fa55de24b1/
> http://autobuild.buildroot.net/results/f6a/f6a3a62909ccb500ca122ec3f03119d7706fb88a/
> 
> Cc: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...x-detection-of-clock_gettime-library.patch | 36 +++++++++++++++++++
>  package/libusb/libusb.mk                      |  2 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 package/libusb/0001-configure.ac-fix-detection-of-clock_gettime-library.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
