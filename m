From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:34:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/hidapi: select glibc gconv libs
 copy
In-Reply-To: <1529257913-9183-1-git-send-email-danwalkes@trellis-logic.com>
References: <1529257913-9183-1-git-send-email-danwalkes@trellis-logic.com>
Message-ID: <20180626233421.1684c68d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jun 2018 17:51:53 +0000, Dan Walkes wrote:
> Hidapi source uses iconv_open UTF-16 conversion [1] which requires
> gconv libararies when buiding with glibc in order to successfully
> find serial number, manufacturer and product strings [2].
> 
> Use select in the config file to autmatically select gconv libararies
> for inclusion on the target when building with glibc
> 
> Tested with ./utils/test-pkg -c hidapi.cfg -p hidapi and hidapi.cfg file
> contents:
> BR2_PACKAGE_HIDAPI=y
> BR2_PACKAGE_EUDEV=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_USE_MMU=y
> BR2_USE_WCHAR=y
> 
> Also tested on x86-64 build target with application using hidapi
> 
> [1]: https://github.com/signal11/hidapi/blob/a6a622ffb680c55da0de787ff93b80280498330f/libusb/hid.c#L446
> [2]: https://www.silabs.com/community/interface/forum.topic.html/cp2114_linux_sta-RtWg
> 
> Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
> Tested-by: Dan Walkes <danwalkes@trellis-logic.com>
> ---
>  package/hidapi/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
