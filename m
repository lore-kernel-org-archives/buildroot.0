From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 12:25:59 +0200
Subject: [Buildroot] [PATCH 2/3] Update configuration files of Acme
 Systems Aria G25
In-Reply-To: <1474450641-7816-2-git-send-email-biagio.hkr@gmail.com>
References: <1474450641-7816-1-git-send-email-biagio.hkr@gmail.com>
 <1474450641-7816-2-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160921122559.608a91f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 11:37:20 +0200, Biagio Montaruli wrote:
> Improve Buildroot configuration for Aria G25 (both 128M and 256M version)
> in order to use the 3.8.6 version of AT91bootstrap
> 
> Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>

Your previous patches updating the configurations have not been merged,
so please resend a patch that has all the changes for each
configuration.

Also, I am not sure we want to do:

-# AT91bootstrap bootloader
+# AT91bootstrap bootloader v3.8.6
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.6"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"

Indeed, if we do that, it means that whenever the at91bootstrap3
package gets updated, your defconfigs would automatically use a newer
version of the bootloader, which has never been tested. For defconfigs,
we generally prefer to use fixed versions of the bootloader and kernel.
So please keep your defconfigs as they were: an explicit reference to
the project on Github and the v3.8.6 Git tag.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
