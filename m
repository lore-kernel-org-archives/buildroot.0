From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:45:50 +0200
Subject: [Buildroot] [PATCH] package/gd: add post-2.2.5 security fixes
 from upstream
In-Reply-To: <20191020090511.2135-1-peter@korsgaard.com>
References: <20191020090511.2135-1-peter@korsgaard.com>
Message-ID: <20191021214550.59dc1c87@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 11:05:10 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security vulnerablities:
> 
> - CVE-2018-1000222: Libgd version 2.2.5 contains a Double Free Vulnerability
>   vulnerability in gdImageBmpPtr Function that can result in Remote Code
>   Execution .  This attack appear to be exploitable via Specially Crafted
>   Jpeg Image can trigger double free
> 
> - CVE-2018-5711: gd_gif_in.c in the GD Graphics Library (aka libgd), as used
>   in PHP before 5.6.33, 7.0.x before 7.0.27, 7.1.x before 7.1.13, and 7.2.x
>   before 7.2.1, has an integer signedness error that leads to an infinite
>   loop via a crafted GIF file, as demonstrated by a call to the
>   imagecreatefromgif or imagecreatefromstring PHP function
> 
> - CVE-2019-11038: When using the gdImageCreateFromXbm() function in the GD
>   Graphics Library (aka LibGD) 2.2.5, as used in the PHP GD extension in PHP
>   versions 7.1.x below 7.1.30, 7.2.x below 7.2.19 and 7.3.x below 7.3.6, it
>   is possible to supply data that will cause the function to use the value
>   of uninitialized variable.  This may lead to disclosing contents of the
>   stack that has been left there by previous code
> 
> - CVE-2019-6978: The GD Graphics Library (aka LibGD) 2.2.5 has a double free
>   in the gdImage*Ptr() functions in gd_gif_out.c, gd_jpeg.c, and gd_wbmp.c
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...-check-return-value-in-gdImageBmpPtr.patch |  80 +++++++
>  ...l-infinite-loop-in-gdImageCreateFrom.patch |  61 +++++
>  ...lized-read-in-gdImageCreateFromXbm-C.patch |  41 ++++
>  ...Potential-double-free-in-gdImage-Ptr.patch | 219 ++++++++++++++++++
>  4 files changed, 401 insertions(+)
>  create mode 100644 package/gd/0001-bmp-check-return-value-in-gdImageBmpPtr.patch
>  create mode 100644 package/gd/0002-Fix-420-Potential-infinite-loop-in-gdImageCreateFrom.patch
>  create mode 100644 package/gd/0003-Fix-501-Uninitialized-read-in-gdImageCreateFromXbm-C.patch
>  create mode 100644 package/gd/0004-Fix-492-Potential-double-free-in-gdImage-Ptr.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
