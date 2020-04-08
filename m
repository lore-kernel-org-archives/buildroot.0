From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Apr 2020 14:50:58 +0200
Subject: [Buildroot] [PATCH 1/2] linux: do not install images in
 subdirectories
In-Reply-To: <20200402214549.2977215-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 2 Apr 2020 23:45:48 +0200")
References: <20200402214549.2977215-1-thomas.petazzoni@bootlin.com>
Message-ID: <87wo6qjg3x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The Linux kernel image is typically found in arch/ARCH/boot/, which is
 > why LINUX_IMAGE_PATH is defined as:

 > LINUX_IMAGE_PATH = $(LINUX_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)

 > However, on MIPS, some kernel image types are available from
 > arch/mips/boot/compressed, or even at the top-level directory. For
 > such cases, LINUX_IMAGE_NAME might be set (using
 > BR2_LINUX_KERNEL_IMAGE_NAME) to values such as:

 >   compressed/vmlinux.bin.z

 > or

 >   ../../../uzImage.bin

 > Except that the line:

 >   $(INSTALL) -m 0644 -D $(LINUX_IMAGE_PATH) $(1)/$(notdir $(LINUX_IMAGE_NAME))

 > will lead to such images be installed in:

 >   $(TARGET_DIR)/boot/compressed/vmlinux.bin.z
 >   $(BINARIES_DIR)/compressed/vmlinux.bin.z

 > and:

 >   $(TARGET_DIR)/boot/../../../uzImage.bin
 >   $(BINARIES_DIR)/../../../uzImage.bin

 > which of course is completely bogus.

 > So let's install them under their name, not their full relative path
 > to arch/ARCH/boot/.

 > Reported-by: Paul Cercueil <paul@crapouillou.net>
 > Cc: Paul Cercueil <paul@crapouillou.net>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
