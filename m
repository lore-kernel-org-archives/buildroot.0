From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Apr 2009 11:17:19 +0200
Subject: [Buildroot] additional patches post or pre ?
In-Reply-To: <EA208D36C9EC4E91934F2BC1305454EE@apexjs> (Sagaert Johan's
	message of "Wed\, 22 Apr 2009 11\:07\:36 +0200")
References: <EA208D36C9EC4E91934F2BC1305454EE@apexjs>
Message-ID: <878wltoxnk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Peter i was talking about :

 Sagaert> Make menuconfig
 -> kernel
 -> patches
 -> additional patch to apply from $DL_DIR
 
 Sagaert> I was wondering if the patches from DL_DIR are aplied last.

From target/linux/Makefile.in.advanced:
$(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
ifneq ($(LINUX26_PATCH_SOURCE),)
        toolchain/patch-kernel.sh $(LINUX26_DIR) $(DL_DIR) $(LINUX26_PATCH_SOURC
E)
endif
ifneq ($(LINUX26_BSP_PATCH),)
        toolchain/patch-kernel.sh $(LINUX26_DIR) $(DL_DIR) $(LINUX26_BSP_PATCH)
endif
        toolchain/patch-kernel.sh $(LINUX26_DIR) toolchain/kernel-headers \
                linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}

So after the BR2_KERNEL_PATCH, but before the toolchain/kernel-headers
patches.

-- 
Bye, Peter Korsgaard
