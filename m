From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:53:41 +0200
Subject: [Buildroot] [PATCH] u-boot: Allow to specify a list of patches
In-Reply-To: <1405448794-10517-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1405448794-10517-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20140715205341.77237719@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Tue, 15 Jul 2014 15:26:34 -0300, Ezequiel Garcia wrote:
> It's often desirable to specify a list of patches, in addition to the current
> support to pass a directory full of uboot-*.patch files. This matches the
> option currently available for specifying Linux patches, except this commit
> doesn't add the URL option. Relying on URLs is fragile and makes a build hard
> to reproduce.
> 
> U-Boot is as special as Linux, in the sense that it needs to be customized more
> often than not, so having a flexible mechanism is useful.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  Config.in.legacy     | 14 ++++++++++++++
>  boot/uboot/Config.in | 11 ++++++-----
>  boot/uboot/uboot.mk  | 12 ++++++++----
>  3 files changed, 28 insertions(+), 9 deletions(-)

We now have BR2_GLOBAL_PATCH_DIR, so I believe that what we would
recommend to use from now on. We have even been talking about removing
the Linux-specific and U-Boot specific patching config options.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
