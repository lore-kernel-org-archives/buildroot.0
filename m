From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jun 2010 23:53:16 +0200
Subject: [Buildroot] [PATCH 18/46] u-boot: remove unneeded symbolic link
	+ blank line
In-Reply-To: <fce3ab311202b3d347f76da0e96d5fd7fbf1bb27.1275343447.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 1 Jun 2010 00:08:04 +0200")
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<fce3ab311202b3d347f76da0e96d5fd7fbf1bb27.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8739wxi437.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  boot/u-boot/u-boot.mk |    2 --
 Thomas>  1 files changed, 0 insertions(+), 2 deletions(-)

 Thomas> diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
 Thomas> index bc03039..92fdc4c 100644
 Thomas> --- a/boot/u-boot/u-boot.mk
 Thomas> +++ b/boot/u-boot/u-boot.mk
 Thomas> @@ -147,7 +147,6 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 Thomas>  		$(addprefix $(U_BOOT_DIR)/lib_generic/,crc32.c md5.c sha1.c) \
 Thomas>  		$(U_BOOT_DIR)/tools/os_support.c \
 Thomas>  		$(U_BOOT_DIR)/libfdt/fdt*.c
 Thomas> -
 Thomas>  	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 Thomas>  # Build manually fw_printenv for the target
 Thomas> @@ -157,7 +156,6 @@ $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/.configured
 Thomas>  		-DUSE_HOSTCC -o $@ \
 Thomas>  		$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib_generic/crc32.c
 Thomas>  	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 Thomas> -	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv

Why is this unneeded? The fw_setenv link is needed to be able to set
parameters.

-- 
Bye, Peter Korsgaard
