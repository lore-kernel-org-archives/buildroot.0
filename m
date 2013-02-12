From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 20:27:36 +0100
Subject: [Buildroot] [PATCH] Fixed dts parent directory issue.
In-Reply-To: <1360688135-7785-1-git-send-email-nagy@accelecon.com>
References: <1360688135-7785-1-git-send-email-nagy@accelecon.com>
Message-ID: <20130212202736.30974aac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Nagy,

On Tue, 12 Feb 2013 11:55:35 -0500, Michael Nagy wrote:

>  define LINUX_INSTALL_DTB
> -	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
> +	cp $(KERNEL_ARCH_PATH)/boot/dts/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
>  endef
>  endif
>  endif

This has already been fixed in the Git repository by
5b33e0b6a139ce3a622817b45a8882a448312fc0 and
a1cfe20df6c6b4f148db0c104e8ff701654a2c09.

Your fix was also not entirely correct, because it would have broken
the build of kernel earlier than 3.8 (at which time dtbs were build in
arch/<arch>/boot and not arch/<arch>/boot/dts). The commits we have in
the Git repository take this into account.

Note that those two fixes are also part of the 2013.02-rc1 release
candidate that was published a few days ago.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
