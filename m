From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:11:03 +0100
Subject: [Buildroot] [PATCH] configs/beaglebone_qt5_defconfig: kernel
 builds needs host-openssl
In-Reply-To: <20200227071149.6887-1-peter@korsgaard.com>
References: <20200227071149.6887-1-peter@korsgaard.com>
Message-ID: <20200227091103.01d6dd10@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 08:11:49 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Similar to the fix for the base beaglebone defconfig in commit 38912a61be
> (configs/beaglebone: kernel builds needs host-openssl), the qt5 variant uses
> the same kernel, so also needs host-openssl.
> 
> Fixes:
> 
> 914 scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
> 915  #include <openssl/bio.h>
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/451176891
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/beaglebone_qt5_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
