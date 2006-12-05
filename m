From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 5 Dec 2006 09:22:46 +0100
Subject: [Buildroot] Building 2.6.19 with Soekris 4801 target
In-Reply-To: <20061205075036.GB31372@aon.at>
References: <33915.10.1.2.50.1165286261.squirrel@bvwireless.net>
	<20061205075036.GB31372@aon.at>
Message-ID: <20061205082246.GA31644@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 05, 2006 at 08:50:36AM +0100, Bernhard Fischer wrote:
>On Mon, Dec 04, 2006 at 09:37:41PM -0500, Eric Malkowski wrote:
>
>>So I made the following mod to toolchain/kernel-headers/kernel-headers.mk
>>to copy over the 2.6.19 top level Makefile to the linux headers dir and
>>voila:
>>
>>[malk at testbed buildroot]$ svn diff toolchain/kernel-headers/kernel-headers.mk
>>Index: toolchain/kernel-headers/kernel-headers.mk
>>===================================================================
>>--- toolchain/kernel-headers/kernel-headers.mk  (revision 16776)
>>+++ toolchain/kernel-headers/kernel-headers.mk  (working copy)
>>@@ -150,6 +150,7 @@
>> $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
>>        (cd $(LINUX_HEADERS_UNPACK_DIR) ; \
>>         $(MAKE) ARCH=$(KERNEL_ARCH) INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR)
>>headers_install)
>>+       cp $(LINUX_HEADERS_UNPACK_DIR)/Makefile $(LINUX_HEADERS_DIR)
>>        touch $(LINUX_HEADERS_DIR)/.configured
>> else
>> # the sanitized kernel-headers
>>
>
>Could you look if calling make prepare (or something like make

Ah, no. The old uClibc release had version checks that are removed for
good from uClibc trunk.

To please uClibc-0.9.28, we can copy the Makefile, but i ask you to
update the patch to delete that Makefile if the kernel version is >=
2.6.18 and uClibc-0.9.28 is used, right after the configure-step from
uClibc.

thanks,
