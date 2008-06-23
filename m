From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jun 2008 15:03:23 +0200
Subject: [Buildroot] cris
In-Reply-To: <485F507D.5070801@cetrtapot.si>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc> <485BAFF8.8090604@cetrtapot.si>
	<20080620141152.GG12682@mx.loc> <485F507D.5070801@cetrtapot.si>
Message-ID: <20080623130323.GB8920@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 23, 2008 at 09:27:57AM +0200, Hinko Kocevar wrote:
>Bernhard Fischer wrote:

>>> +ifeq ($(BR2_ARCH),"cris")
>>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/linux/user.h $(LINUX_HEADERS_DIR)/include/linux
>>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/asm-cris/user.h $(LINUX_HEADERS_DIR)/include/asm
>>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/asm-cris/elf.h $(LINUX_HEADERS_DIR)/include/asm
>>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/asm-cris/arch-v10 $(LINUX_HEADERS_DIR)/include/asm/arch
>>> +	 sed -i -e "/^#include <asm\/page\.h>/d" $(LINUX_HEADERS_DIR)/include/asm/user.h
>> 
>> as you can see this wouldn't work for v8 and generally should be fixed
>> in the kernel (also fails with 2.6.git).
>
>This problem is because include/asm-cris/Kbuild does not include the correct headers when the kernel source is not configured. Both include/asm-cris/arch-vXX directories are left behind when install_headers goes through header-y target. 
>
>I'll let Axis people sort it out (if ever), till then I guess we are stuck with the hack..

Yes, we'd need to use a prepared kernel ("archprepare"), which means
dropping the one from tool_build and setting one up early in project_.

I currently don't have time to do this properly, perhaps you want to
give it a try?
