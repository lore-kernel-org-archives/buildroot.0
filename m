From: Nicholas Kinar <n.kinar@usask.ca>
Date: Wed, 02 Dec 2009 16:55:16 -0600
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
 OS X
In-Reply-To: <4B16EECC.4090909@usask.ca>
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
	<4B128965.2090303@usask.ca> <87einh2n3w.fsf@macbook.be.48ers.dk>
	<20091201144803.26ddbe83@surf> <4B153461.1030404@usask.ca>
	<873a3ulncz.fsf@macbook.be.48ers.dk> <4B15C71D.8020106@usask.ca>
	<4B168E68.1060003@usask.ca> <87tyw9te21.fsf@macbook.be.48ers.dk>
	<4B16EECC.4090909@usask.ca>
Message-ID: <4B16F054.8070104@usask.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello--

I've now added these entries to the Buildroot .config file:

BR2_ENABLE_LOCALE=no
BR2_BUILD_SUFFIX=apple-darwin9
BR2_EXTRA_GCC_CONFIG_OPTIONS="--host=i686-apple-darwin9 
--build=i686-apple-darwin9"


Buildroot continues to build, but crashes with the following error.  (My 
apologies for the odd characters in the error posting.)  Apparently the 
compiler cannot find elf.h, which is required for compilation.  This 
could prove to be a real show-stopper, since elf.h does not appear to be 
included with BSD-style systems.


lsmod.c:28:24: error: asm/unistd.h: No such file or directory
insmod.c:29:24: error: asm/unistd.h: No such file or directory
make[1]: *** [lsmod.o] Error 1
make[1]: *** Waiting for unfinished jobs....
modprobe.c:35:17: error: elf.h: No such file or directory
modprobe.c:38:24: error: asm/unistd.h: No such file or directory
make[1]: *** [insmod.o] Error 1
modprobe.c: In function ?get_section32?:
modprobe.c:437: error: ?Elf32_Ehdr? undeclared (first use in this function)
modprobe.c:437: error: (Each undeclared identifier is reported only once
modprobe.c:437: error: for each function it appears in.)
modprobe.c:437: error: ?hdr? undeclared (first use in this function)
modprobe.c:438: error: ?Elf32_Shdr? undeclared (first use in this function)
modprobe.c:438: error: ?sechdrs? undeclared (first use in this function)
modprobe.c: In function ?get_section64?:
modprobe.c:464: error: ?Elf64_Ehdr? undeclared (first use in this function)
modprobe.c:464: error: ?hdr? undeclared (first use in this function)
modprobe.c:465: error: ?Elf64_Shdr? undeclared (first use in this function)
modprobe.c:465: error: ?sechdrs? undeclared (first use in this function)
modprobe.c: In function ?elf_ident?:
modprobe.c:491: error: ?EI_CLASS? undeclared (first use in this function)
modprobe.c:491: error: ?ELFMAG? undeclared (first use in this function)
modprobe.c:491: error: ?SELFMAG? undeclared (first use in this function)
modprobe.c:492: error: ?ELFCLASSNONE? undeclared (first use in this 
function)
modprobe.c: In function ?get_section?:
modprobe.c:502: error: ?ELFCLASS32? undeclared (first use in this function)
modprobe.c:504: error: ?ELFCLASS64? undeclared (first use in this function)
modprobe.c: In function ?invalidate_section32?:
modprobe.c:536: error: ?Elf32_Ehdr? undeclared (first use in this function)
modprobe.c:536: error: ?hdr? undeclared (first use in this function)
modprobe.c:537: error: ?Elf32_Shdr? undeclared (first use in this function)
modprobe.c:537: error: ?sechdrs? undeclared (first use in this function)
modprobe.c:543: error: ?SHF_ALLOC? undeclared (first use in this function)
modprobe.c: In function ?invalidate_section64?:
modprobe.c:548: error: ?Elf64_Ehdr? undeclared (first use in this function)
modprobe.c:548: error: ?hdr? undeclared (first use in this function)
modprobe.c:549: error: ?Elf64_Shdr? undeclared (first use in this function)
modprobe.c:549: error: ?sechdrs? undeclared (first use in this function)
modprobe.c:555: error: ?SHF_ALLOC? undeclared (first use in this function)
modprobe.c: In function ?strip_section?:
modprobe.c:564: error: ?ELFCLASS32? undeclared (first use in this function)
modprobe.c:567: error: ?ELFCLASS64? undeclared (first use in this function)
make[1]: *** [modprobe.o] Error 1
make: *** 
[/Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/module-init-tools-3.2.2/depmod] 
Error 2
