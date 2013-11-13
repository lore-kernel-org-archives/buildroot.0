From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Nov 2013 22:58:19 +0100
Subject: [Buildroot] [PATCH v3 6/7] toolchain: uclibc does not support
	microblze
In-Reply-To: <1384378130-8599-7-git-send-email-spenser@gillilanding.com>
References: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
 <1384378130-8599-7-git-send-email-spenser@gillilanding.com>
Message-ID: <20131113225819.56b10ada@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed, 13 Nov 2013 15:28:49 -0600, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  toolchain/toolchain-buildroot/Config.in |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 1529004..57bbc3d 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -9,6 +9,7 @@ choice
>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  	bool "uClibc"
>  	select BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on !BR2_microblaze

Hum, I see a libc/sysdeps/linux/microblaze in my uClibc tree. And also,
since there are some no-MMU variant of Microblaze processors, which C
library other than uClibc could they use?

That being said, I don't *require* you to add the support for uClibc.
Having glibc/eglibc support is already good. We can add uClibc support
later on.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
