From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 14:35:09 +0100
Subject: [Buildroot] [PATCH 1/2] package/libv4l: fix musl build
In-Reply-To: <20191030065303.22948-1-bernd.kuhls@t-online.de>
References: <20191030065303.22948-1-bernd.kuhls@t-online.de>
Message-ID: <20191208143509.05d71702@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Oct 2019 07:53:02 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/bf8/bf88f89bdb966ef54938e4274114d4afe5668b1f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...d-missing-includes-to-fix-musl-build.patch | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch

Thanks, applied. However, I have one comment, see below.

> diff --git a/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch b/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch
> new file mode 100644
> index 0000000000..238f8fc377
> --- /dev/null
> +++ b/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch
> @@ -0,0 +1,68 @@
> +From baba68cdcb44fc11d0ba8ce2c13eb5b06bbd9b33 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Wed, 30 Oct 2019 07:15:23 +0100
> +Subject: [PATCH] keymap.h: add missing includes to fix musl build
> +
> +Needed to fix these build errors:
> +
> +In file included from keymap.c:13:0:
> +keymap.h:23:2: error: unknown type name 'u_int32_t'
> +  u_int32_t scancode;
> +
> +keymap.h:36:1: error: unknown type name 'error_t'
> + error_t parse_keymap(char *fname, struct keymap **keymap, bool verbose);
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> +Patch was not sent upstream due to broken mailing list setup:
> +
> +<majordomo@vger.kernel.org>: host vger.kernel.org[209.132.180.67] said: 553
> +    5.7.1 Hello [xx.xx.xx.xx], for your MAIL FROM address
> +    <bernd.kuhls@t-online.de> policy analysis reported: Your address is not
> +    liked source for email (in reply to MAIL FROM command)
> +
> +Hello [xx.xx.xx.xx], for your MAIL FROM address <berndkuhls@hotmail.com>
> + policy analysis reported: Your address is not liked source for email 

We really want to upstream these patches. vger.kernel.org is a very
widely used mailing list service, as it's used for virtually all kernel
mailing lists.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
