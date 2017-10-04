From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 4 Oct 2017 11:22:17 +0300
Subject: [Buildroot] [PATCH] qemu: security bump to version 2.8.1.1
In-Reply-To: <20171004071357.15093-1-peter@korsgaard.com>
References: <20171004071357.15093-1-peter@korsgaard.com>
Message-ID: <20171004082217.o2yzbrwjdpicpe4r@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Oct 04, 2017 at 09:13:57AM +0200, Peter Korsgaard wrote:
> Fixes the following security issues and adds a number of other bigfixes:
> 
> 2.8.1: Changelog:
> https://lists.gnu.org/archive/html/qemu-devel/2017-03/msg06332.html
> 
> CVE-2017-2615 - display: cirrus: oob access while doing bitblt copy backward
> mode
> 
> CVE-2017-2620 - display: cirrus: out-of-bounds access issue while in
> cirrus_bitblt_cputovideo
> 
> CVE-2017-2630 - nbd: oob stack write in client routine drop_sync
> 
> 2.8.1.1 Changelog:
> https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg03460.html
> 
> CVE-2017-7471 - 9p: virtfs allows guest to change filesystem attributes on
> host
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/qemu/qemu.hash | 2 +-
>  package/qemu/qemu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index 19cb306938..5164303768 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -1,2 +1,2 @@
>  # Locally computed, tarball verified with GPG signature

The signatures are at:

  https://download.qemu.org/qemu-2.8.1.1.tar.bz2.sig
  https://download.qemu.org/qemu-2.8.1.1.tar.xz.sig

> -sha256 dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62  qemu-2.8.0.tar.bz2
> +sha256 f62ab18a1fb9ff5b4c81ed44becc945b11581eff777618141bdb787da55d3638  qemu-2.8.1.1.tar.bz2
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index f42d6497b6..155cb281b9 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QEMU_VERSION = 2.8.0
> +QEMU_VERSION = 2.8.1.1
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2

There is also a .xz tarball available.

>  QEMU_SITE = http://wiki.qemu.org/download

This redirects to https://download.qemu.org.

>  QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
