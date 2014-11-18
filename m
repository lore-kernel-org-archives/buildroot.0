From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 16:20:20 +0100
Subject: [Buildroot] [PATCH 1/2] arch/powerpc: add fsl e5500 and e6500
 support
In-Reply-To: <546B5779.9010708@zacarias.com.ar>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
 <1416266092-6465-2-git-send-email-gustavo@zacarias.com.ar>
 <CANQCQpbtbch9q-HKXFhQRkKxYpr1FD9nhebwpiaj=65O_Pm+xQ@mail.gmail.com>
 <546B5779.9010708@zacarias.com.ar>
Message-ID: <20141118162020.02921a54@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 18 Nov 2014 11:28:09 -0300, Gustavo Zacarias wrote:

> > I'll try to give this a test when I get a chance, we currently have a
> > e5500 target that we're building binaries for but with a e500mc
> > toolchain (using arch compatibility mode on the processor).  Will the
> > buildroot toolchain do multilib so that it's possible to build uboot
> > 32/36bit and a kernel 64bit?  So far that's why we stuck with the
> > e500mc (just 32/36bit) keeping us using a single toolchain.
> 
> We don't do proper multilib yet, so unfortunately you'll have to go with
> separate BR projects for say kernel/bootloader (64 bit) and userland (32
> bit).

That's kind of annoying, and we have a similar problem on x86-64 when
we need to build a 32 bits bootloader (though this might become less of
an issue with UEFI being capable of using 64 bits bootloaders).

Should we do something about this, and support multilib? Note that SH4
is also broken since quite a while in the internal toolchain backend
because it needs multilib support. The issue is how do we decide which
multilib variants to build? Do we simply "force" a certain set of
multilib variants for a given architecture?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
