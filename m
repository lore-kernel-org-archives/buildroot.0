From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 27 Sep 2007 04:15:49 -0700 (PDT)
Subject: [Buildroot] unable to build arm926ejs toolchain with latest
 snapshot cp error during kernel unpack
In-Reply-To: <12918929.post@talk.nabble.com>
References: <12918929.post@talk.nabble.com>
Message-ID: <12919161.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,
i found the location of problem but yet to find the solution. In
buildroot\target\linux\makefile.in at 

$(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config          --------->
bug/error for me
	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
ifeq ($(BR2_ARM_EABI),y)

$(LINUX26_KCONFIG) ---> is not getting set/defined.


# Linux kernel configuration file
# Has to be set by the target/device
# If it is not set by the target/device, then pick the one from .config
ifndef LINUX26_KCONFIG
ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG))),)
LINUX26_KCONFIG=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
#"))
#"))
else
# LINUX26_KCONFIG=$(BOARD_PATH)/linux26.config
endif
endif


Kindly let me know how to set. 

also when i tries make linux26-

Regards
Gururaja



-- 
View this message in context: http://www.nabble.com/unable-to-build-arm926ejs-toolchain-with-latest-snapshot-cp-error-during-kernel-unpack-tf4527671.html#a12919161
Sent from the BuildRoot mailing list archive at Nabble.com.
