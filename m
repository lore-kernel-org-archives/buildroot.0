From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Apr 2008 14:24:47 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
In-Reply-To: <0ddc01c89583$84ecb960$f52f9e86@LPSC0173W> (Guillaume Dargaud's
	message of "Thu\, 3 Apr 2008 14\:09\:03 +0200")
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W>
	<8763v071sq.fsf@macbook.be.48ers.dk> <20080402164154.GE9436@mx.loc>
	<0ddc01c89583$84ecb960$f52f9e86@LPSC0173W>
Message-ID: <87ej9n2kj4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

 Guillaume> So, how does one go to compile for a Xilinx ppc ?

There's initial support in arch/powerpc for the ppc405 in the Xilinx
FPGAs - But yes, it's early days.

 Guillaume> Deprecated or not, various info I have insist that I
 Guillaume> should use ARCH=ppc If I try:

 Guillaume> $ make ARCH=ppc KERNEL_ARCH=ppc

That won't work as various other parts (E.G. kernel headers depends on
KERNEL_ARCH=powerpc

 Guillaume> Am I supposed to try and edit some of the makefile to get
 Guillaume> them to use ARCH=ppc for the kernel ? I can't believe I'm
 Guillaume> the first one to use buildroot on a Xilinx board, so what
 Guillaume> am I doing wrong...?  -- Guillaume Dargaud
 Guillaume> http://www.gdargaud.net/

I normally don't compile my (ppc) kernels within buildroot. First
create your rootfs and cross compiler with buildroot and then use it
to compile the kernel manually (E.G. add
build_powerpc/staging_dir/usr/bin to your path).

-- 
Bye, Peter Korsgaard
