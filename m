From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:18:47 +0100
Subject: [Buildroot] [PATCH 1/4] arm: conditionally support regular ARM
 instructions
In-Reply-To: <1421951608-31233-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1421951608-31233-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20150202211847.2d007d67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Thu, 22 Jan 2015 15:33:25 -0300, Ezequiel Garcia wrote:
> From: Guido Mart?nez <guido@vanguardiasur.com.ar>
> 
> Until now, all ARM processors supported the original ARM instructions.
> However, the Cortex-M variants don't support them, and support only
> Thumb/Thumb2 modes.
> 
> So, make a Kconfig option for ARM support and use it.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  arch/Config.in.arm | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

I've applied this patch, after taking into account Romain's comment,
and also after renaming BR2_ARM_INSTRUCTIONS_ARM_CHOICE to
BR2_ARM_INSTRUCTIONS_ARM and removing the hidden option
BR2_ARM_INSTRUCTIONS_ARM outside the choice.

From the commit log:

[Thomas:
  - Remove the dependency in the choice between ARM/Thumb/Thumb-2,
    because basically the choice is now always visible.
  - Replace the BR2_ARM_INSTRUCTIONS_ARM_CHOICE choice option directly
    by BR2_ARM_INSTRUCTIONS_ARM, instead of having this blind option
    defined separately. This means the choice is now always visible,
    even when only the ARM instruction set is supported.]


Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
