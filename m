From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Mar 2019 16:11:03 +0200
Subject: [Buildroot] [PATCH] package/mtd: backport patch to remove
 errors for devices without ecc support
In-Reply-To: <20190327140153.1332-1-patrickdepinguin@gmail.com>
References: <20190327140153.1332-1-patrickdepinguin@gmail.com>
Message-ID: <20190327141103.w45fwp43glxkrf77@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 27, 2019 at 03:01:53PM +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Since the introduction of mtd-utils 2.0.2, following error can appear on
> e.g. flash_erase calls:
> 
>     libmtd: error!: ECCGETLAYOUT ioctl request failed
>             error 122 (Operation not supported)
> 
> The error should only be printed if there was an actual error in the
> ECCGETLAYOUT ioctl call, not when the ioctl is not supported.
> 
> Backport an upstream patch that fixes this issue.

Why not bump to 2.1.0 instead?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
