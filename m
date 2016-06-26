From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 22:59:53 +0200
Subject: [Buildroot] [PATCH] gd: security bump to version 2.2.2
In-Reply-To: <1466974451-29583-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466974451-29583-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160626225953.55e4e1d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 17:54:11 -0300, Gustavo Zacarias wrote:
> Drop upstreamed patches.
> Drop autoreconf since it's no longer required.
> Patch 0002-no-zlib.patch is no longer required, and is in fact harmful.
> Update homepage URL.
> 
> Fixes:
> CVE-2015-8874 - #215 Stack overflow with gdImageFillToBorder
> CVE-2016-3074 - gd2: handle corrupt images better
> CVE-2016-5767 - Integer Overflow in gdImagePaletteToTrueColor()
> resulting in heap overflow
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...tch => 0002-gd_bmp-fix-build-with-uClibc.patch} |   0
>  package/gd/0002-no-zlib.patch                      |  51 ---
>  package/gd/0004-webp-pre.patch                     |  37 --
>  package/gd/0005-webp.patch                         | 418 ---------------------
>  package/gd/Config.in                               |   2 +-
>  package/gd/gd.hash                                 |   2 +-
>  package/gd/gd.mk                                   |   5 +-
>  7 files changed, 4 insertions(+), 511 deletions(-)
>  rename package/gd/{0003-gd_bmp-fix-build-with-uClibc.patch => 0002-gd_bmp-fix-build-with-uClibc.patch} (100%)
>  delete mode 100644 package/gd/0002-no-zlib.patch
>  delete mode 100644 package/gd/0004-webp-pre.patch
>  delete mode 100644 package/gd/0005-webp.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
