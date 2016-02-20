From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Feb 2016 12:06:06 +0100
Subject: [Buildroot] [PATCH v2 2/2] board/firefly_rk3288: add new board
In-Reply-To: <1455550191-28706-3-git-send-email-ariel@vanguardiasur.com.ar>
 (Ariel D'Alessandro's message of "Mon, 15 Feb 2016 12:29:51 -0300")
References: <1455550191-28706-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1455550191-28706-3-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <87bn7bhc9t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ariel" == Ariel D'Alessandro <ariel@vanguardiasur.com.ar> writes:

 > This commit adds basic configuration files for the Firefly RK3288 board.
 > Both minimal and demo defconfigs are added. The latter enables Qt5 with
 > the required Mali T76X GPU user space components.

 > More info about the board:
 > http://en.t-firefly.com/en/firenow/firefly_rk3288/specifications/

> +++ b/configs/firefly_rk3288_defconfig
 > @@ -0,0 +1,33 @@
 > +BR2_arm=y
 > +BR2_cortex_a12=y
 > +BR2_ARM_FPU_NEON_VFPV4=y
 > +BR2_KERNEL_HEADERS_VERSION=y
 > +BR2_DEFAULT_KERNEL_VERSION="4.4"

We now default the kernel headers to get them from the kernel source if
you build a Linux kernel, so these two lines can be removed from both
defconfigs.

Committed to next with that fixed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
