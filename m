From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 6 May 2008 16:06:49 +0200
Subject: [Buildroot] Ulf, you broke AVR32, why?
References: <d6cda7730805051134j245a8687o66eaa6fc9d3c93ae@mail.gmail.com>
	<013a01c8aef9$5aa98d10$070514ac@atmel.com>
	<75DA8A60-EC04-485B-AA62-BE88EF164D53@valka.is>
Message-ID: <000b01c8af82$a74deb50$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ulf,

> You talk about us AVR32 people breaking packages, not testing our  
> changes and demanding that we take our effort at maintaining packages  
> and arch support to a separate tree. But still you do all off thous  
> things, breaking packages, removing needed arch patches, not testing  
> your changes and generally fucking up everything except AT91 support,  
> WHY?

> In my opinion, Buildroot is a collection of PATCHES to make cross- 
> compiling easier, not to create some broken package system that i have  
> to download every source and patch myself and patch by hand.

> My 10cent in the penis fight.
> Arnar Mar Sig.

Yeah right,
I made sure that AVR32 is supported by introducing the AVR32 to buildroot
in the first place and by ensuring that the AVR32 product line adopted
buildroot as the main delivery vehicle for their Linux.

When I introduced AVR32 support in buildroot, I made a
decision to use a prepatched source for various reasons.
One of them is that using a non-supported architecture
does not scale well, because that means that svn buildroot svn
grows by a significant amount every time a new toolchain is supported.
Another is that I noticed that the autotools version is really sensitive
causing problems with a number of customers.

I do not think that using prepatched source is the same thing as using a different tree.

I dont "accuse" people for breaking packages. I note that the redundant
toolchain support that was added later cause complaints both
for breaking other architectures and for size.

Since the patches are NOT neccessary, as you claim, 
because you can download exactly the same thing by
using the prepatched toolchain, 
the easiest way is to remove the offending patches.

The system works if the mirror has the proper value, 
which is has if the .config file is configured from scratch.

If you want to apply patches to the prepatched tree, you can,  
so your comment about manually downloading patches
and applying manually is 

As I see it there is one problem, and that is that the ATMEL MIRROR
is not write accessible to the public. I can't change that for the current mirror, 
but as I mentioned previously, 
I do not see any value in me beeing the only one able to update this,
only disadvantages, so anyone volunteering to host the mirror
and make it accessible to all buildroot maintainers are welcome.

=======================
Once we updated the prepatched toolchain from John's site we will be able to:

1) Download latest AVR32 toolchain in a prepatched format.
2) Apply any patch located in "target/device/Atmel/toolchain" automatically
    (Including selected patches copied from the toolchain directory)

I really do nor see the problem with this.

Best Regards
Ulf Samuelsson
