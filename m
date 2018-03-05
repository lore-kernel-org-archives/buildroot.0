From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 5 Mar 2018 09:35:38 +0100
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Remove imx6s
 from has_vpu list
In-Reply-To: <20180304150606.32748-1-bernd.kuhls@t-online.de>
References: <20180304150606.32748-1-bernd.kuhls@t-online.de>
Message-ID: <20180305083538.GA20659@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Mar 04, 2018 at 04:06:05PM +0100, Bernd Kuhls wrote:
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

Indeed that was a mistake.
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Thanks,
Gary
