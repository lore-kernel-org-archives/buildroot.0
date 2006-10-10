From: Erik Andersen <andersen@codepoet.org>
Date: Tue, 10 Oct 2006 10:05:31 -0600
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <20061010072000.GC13303@aon.at>
References: <20061009161313.4F9374859A@busybox.net>
	<20061009175626.GB24455@codepoet.org>
	<20061010072000.GC13303@aon.at>
Message-ID: <20061010160531.GA2258@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue Oct 10, 2006 at 09:20:00AM +0200, Bernhard Fischer wrote:
> >> +KERNEL_ARCH:=$(shell $(SHELL) -c 'if test "$(ARCH)" = "i486" -o "$(ARCH)" = "i586"; then echo i386; else echo $(ARCH); fi')
> >> +
> >
> >How about something like this:
> >
> >KERNEL_ARCH := $(shell $(CC) -dumpmachine | sed -e s'/-.*//' \
> >	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
> >	-e s/arm.*/arm/ -e s/sa110/arm/ \
> >	-e s/s390x/s390/ -e s/parisc64/parisc/ \
> >	-e s/ppc.*/powerpc/ -e s/mips.*/mips/)
> 
> In principle i agree, but then only GCC has -dumpmachine. We know the
> TARGET_ARCH beforehand, so shouldn't need to rely on -dumpmachine and a
> specific compiler to resolve the correct ARCH to be used for the kernel
> (only!), agree?

sure, using ARCH is fine.  Still should be adjusted to use the
kernel arch names with a pass through sed...

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
