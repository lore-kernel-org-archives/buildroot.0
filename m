From: Darius Augulis <augulis.darius@gmail.com>
Date: Sat, 20 Aug 2011 12:22:21 +0300
Subject: [Buildroot] [PATCH 14/28] grub: convert to AUTOTARGETS
In-Reply-To: <20a318776db62b41f3bb365d2417e6251fc2d8ea.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <20a318776db62b41f3bb365d2417e6251fc2d8ea.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4E4F7CCD.8030407@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi Thomas,

with these changes grub is not installed to staging dir.
grub.mk has label:

define GRUB_INSTALL_STAGING_CMDS
         install -m 0755 -D $(@D)/grub/grub $(STAGING_DIR)/sbin/grub
endef

but when building it's installed only to target dir, but not to staging.

Darius.


On 07/05/2011 10:54 PM, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   boot/grub/grub.500-build-fix.patch |   14 +++++
>   boot/grub/grub.mk                  |  102 ++++++++++++++----------------------
>   2 files changed, 53 insertions(+), 63 deletions(-)
>   create mode 100644 boot/grub/grub.500-build-fix.patch
