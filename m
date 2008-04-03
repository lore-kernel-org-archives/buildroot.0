From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Apr 2008 17:09:38 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
In-Reply-To: <0e8d01c89595$e3482140$f52f9e86@LPSC0173W> (Guillaume Dargaud's
	message of "Thu\, 3 Apr 2008 16\:20\:32 +0200")
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W>
	<8763v071sq.fsf@macbook.be.48ers.dk> <20080402164154.GE9436@mx.loc>
	<0ddc01c89583$84ecb960$f52f9e86@LPSC0173W>
	<87ej9n2kj4.fsf@macbook.be.48ers.dk>
	<0e8d01c89595$e3482140$f52f9e86@LPSC0173W>
Message-ID: <87bq4r0ybx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

Hi,

 Guillaume> Deprecated or not, various info I have insist that I
 Guillaume> should use ARCH=ppc If I try:
 >> 
 Guillaume> $ make ARCH=ppc KERNEL_ARCH=ppc
 >> 
 >> That won't work as various other parts (E.G. kernel headers depends on
 >> KERNEL_ARCH=powerpc

 Guillaume> So how is one supposed to understand the 'use the
 Guillaume> ARCH=ppc' branch for Xilinx compilation ?!?

I'm not following you - ARCH=ppc is a kernel thing, it doesn't have
anything to do with buildroot.

 Guillaume> This morning I restarted from stratch to try to solve
 Guillaume> those ARCH vs KERNEL_ARCH issues, and now I've figured out
 Guillaume> that I can't even compile anything anymore (with the same
 Guillaume> .config files as before):

 Guillaume> $ make ARCH=ppc
 Guillaume> [...]
 Guillaume> checking whether we are cross compiling... no
 Guillaume> [...]

 Guillaume> I'm...lost and confused.

Don't set ARCH or KERNEL_ARCH on the buildroot command line, only use
it when you are compiling a kernel (outside buildroot).

 >> I normally don't compile my (ppc) kernels within buildroot. First
 >> create your rootfs and cross compiler with buildroot and then use it
 >> to compile the kernel manually (E.G. add
 >> build_powerpc/staging_dir/usr/bin to your path).

 Guillaume> OK, I think that's the straw that broke the camel's
 Guillaume> back. After a totally wasted month I'm gonna go do
 Guillaume> something else, like try OpenEmbedded or ELDK.

Suit yourself, but buildroot with Xilinx/ARCH=ppc kernels works (I use
it myself).

-- 
Bye, Peter Korsgaard
