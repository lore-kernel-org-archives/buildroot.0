From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 20:33:07 +0100
Subject: [Buildroot] Atmel specific handling in buildroot
Message-ID: <873af0mvws.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Why is it again we have special handling of Atmel targets?

git grep -B2 'default.*if BR2_TARGET_ATMEL'        ~/source/buildroot
target/Config.in-choice
target/Config.in-       prompt "Kernel type"
target/Config.in:       default BR2_KERNEL_LINUX_ADVANCED if BR2_TARGET_ATMEL
target/device/Config.in.linux.patches-  depends on !BR2_KERNEL_PREPATCHED
target/device/Config.in.linux.patches-  default y if BR2_avr32
target/device/Config.in.linux.patches:  default y if BR2_TARGET_ATMEL && BR2_arm
--
target/linux/Config.in.advanced-config BR2_LINUX_COPYTO_TFTPBOOT
target/linux/Config.in.advanced-        bool "Copy kernel to /tftpboot"
target/linux/Config.in.advanced:        default y if BR2_TARGET_ATMEL
--
target/linux/Config.in.advanced-config BR2_LINUX_COPY_CONFIGURATION
target/linux/Config.in.advanced-        bool "Copy buildroot configuration to Li
target/linux/Config.in.advanced:        default y if BR2_TARGET_ATMEL

Do we really need that? It would imho be a lot more sensible if BR
behaved the same way for all archs.

-- 
Bye, Peter Korsgaard
