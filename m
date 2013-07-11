From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 11 Jul 2013 08:33:59 +0300
Subject: [Buildroot] [PATCH] Raspberry Pi - WiringPi Library Package
In-Reply-To: <1373519960-6212-1-git-send-email-g@maral.me>
References: <1373519841-6138-1-git-send-email-g@maral.me>
 <1373519960-6212-1-git-send-email-g@maral.me>
Message-ID: <20130711053359.GC4338@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillermo,

On Wed, Jul 10, 2013 at 10:19:20PM -0700, Guillermo A. Amaral wrote:
> From: "Guillermo A. Amaral" <g@maral.me>
> 
> 
> Signed-off-by: Guillermo A. Amaral <g@maral.me>
> ---

[...]

> diff --git a/package/wiringpi/wiringpi-CLOEXEC-undefined.patch 
> b/package/wiringpi/wiringpi-CLOEXEC-undefined.patch
> new file mode 100644
> index 0000000..ca0ed99
> --- /dev/null
> +++ b/package/wiringpi/wiringpi-CLOEXEC-undefined.patch
> @@ -0,0 +1,29 @@
> +From 728b2634cbf661e5303b1e8cb791b909ad4e907c Mon Sep 17 00:00:00 2001
> +From: "Guillermo A. Amaral" <g@maral.me>
> +Date: Wed, 10 Jul 2013 22:05:12 -0700
> +Subject: [PATCH] Declare O_CLOEXEC on systems with an older kernel and/or
> + glibc.
> +
> +Signed-off-by: Guillermo A. Amaral <g@maral.me>
> +---
> + wiringPi/wiringPi.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/wiringPi/wiringPi.c b/wiringPi/wiringPi.c
> +index ba61d9f..2ee23b9 100644
> +--- a/wiringPi/wiringPi.c
> ++++ b/wiringPi/wiringPi.c
> +@@ -77,6 +77,10 @@
> + #define	FALSE	(1==2)
> + #endif
> + 
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0

Are you sure? I see

#define O_CLOEXEC      02000000

in include/uapi/asm-generic/fcntl.h.

baruch

> ++#endif
> ++
> + // Environment Variables
> + 
> + #define	ENV_DEBUG	"WIRINGPI_DEBUG"
> +-- 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
