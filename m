From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 3 Apr 2008 16:20:32 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W><8763v071sq.fsf@macbook.be.48ers.dk>
	<20080402164154.GE9436@mx.loc><0ddc01c89583$84ecb960$f52f9e86@LPSC0173W>
	<87ej9n2kj4.fsf@macbook.be.48ers.dk>
Message-ID: <0e8d01c89595$e3482140$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Guillaume> Deprecated or not, various info I have insist that I
> Guillaume> should use ARCH=ppc If I try:
>
> Guillaume> $ make ARCH=ppc KERNEL_ARCH=ppc
>
> That won't work as various other parts (E.G. kernel headers depends on
> KERNEL_ARCH=powerpc

So how is one supposed to understand the 'use the ARCH=ppc' branch for 
Xilinx compilation ?!?

This morning I restarted from stratch to try to solve those ARCH vs 
KERNEL_ARCH issues, and now I've figured out that I can't even compile 
anything anymore (with the same .config files as before):

$ make ARCH=ppc
[...]
checking whether we are cross compiling... no
[...]

I'm...lost and confused.

> I normally don't compile my (ppc) kernels within buildroot. First
> create your rootfs and cross compiler with buildroot and then use it
> to compile the kernel manually (E.G. add
> build_powerpc/staging_dir/usr/bin to your path).


OK, I think that's the straw that broke the camel's back. After a totally 
wasted month I'm gonna go do something else, like try OpenEmbedded or ELDK.

-- 
Guillaume Dargaud
http://www.gdargaud.net/
