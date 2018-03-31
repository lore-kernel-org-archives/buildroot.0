From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 23:08:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Remove imx6s
 from has_vpu list
In-Reply-To: <20180304150606.32748-1-bernd.kuhls@t-online.de>
References: <20180304150606.32748-1-bernd.kuhls@t-online.de>
Message-ID: <20180331230818.6ab39238@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Mar 2018 16:06:05 +0100, Bernd Kuhls wrote:
> According to imx-vpu-5.4.37/Makefile, line 6:
> 
> 	INCLUDE_LIST:= IMX27ADS IMX51 IMX53 IMX6Q
> 
> imx6s is not supported by the imx-vpu package. Its install target,
> guarded by
> 
> 	ifeq ($(PLATFORM), $(findstring $(PLATFORM), $(INCLUDE_LIST)))
> 
> does nothing, causing a build error later on in the imx-vpuwrap package
> 
> checking for vpu_lib.h... no
> configure: error: lib_vpu is required, consider installing imx-lib
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freescale-imx/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
