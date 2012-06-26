From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jun 2012 09:35:57 +0200
Subject: [Buildroot] [PATCH resend] owl-linux: new package
In-Reply-To: <1340651389-7856-1-git-send-email-spdawson@gmail.com>
References: <1340651389-7856-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120626093557.2de31adb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 25 Jun 2012 20:09:49 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

This looks pretty good. The patches of the package should have a
Signed-off-by line, but otherwise, I'm not seeing any other issue.

I am also a bit worried about all the comment "owl-linux is only
supported blabla", because those warnings will also appear for anyone
not even doing something for ARM, and there will be two of such
warnings.

Maybe group the ARM9 and EABI checks into one comment? And maybe make
it visible only on ARM?

comment "owl-linux is only supported on ARM9 architecture with EABI"
	depends on !(BR2_arm920t || BR2_arm922t || BR2_arm926t)	|| !BR2_ARM_EABI
	depends on BR2_arm

or something like that.

> +define OWL_LINUX_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M="$(@D)" modules_install
> +endef

At some point in the discussion, it was mentioned that this driver
might only work with one particular CodeSourcery toolchain, which would
suggest that it uses the C library, and therefore contain userspace
code. But here you're only installing the kernel module itself. Could
you clarify this point, just for our (my?) knowledge?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
