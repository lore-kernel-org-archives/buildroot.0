From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 23:20:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Patch to fix check_as
 macro in Rules.mak
In-Reply-To: <AM0P194MB06448CBCB64FBB28F3240C118BD00@AM0P194MB0644.EURP194.PROD.OUTLOOK.COM>
References: <AM0P194MB06448CBCB64FBB28F3240C118BD00@AM0P194MB0644.EURP194.PROD.OUTLOOK.COM>
Message-ID: <20200507232002.274fd3d2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 12:47:04 +0000
"Patzlaff, Marcel" <m.patzlaff@pilz.de> wrote:

> This introduces a patch for uClibc to fix a feature check macro which
> does not work when building with binutils 2.31.x or higher. Without
> this fix, all binaries of uClibc will always request an executable
> stack and thus all other binaries that link to it!
> 
> See also https://bugs.busybox.net/show_bug.cgi?id=12801
> 
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> ---
>  ...heck_as-for-recent-binutils-versions.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/uclibc/0003-Rules.mak-Fix-check_as-for-recent-binutils-versions.patch

In the mean time, your patch was merged in upstream uClibc-ng, version
1.0.34 was released, and we just applied a patch for Buildroot that
updates to use uClibc-ng 1.0.34.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
