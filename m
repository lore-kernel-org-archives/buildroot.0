From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Oct 2012 19:49:21 +0200
Subject: [Buildroot] Question about 64Bit kernel and 32Bit applications
In-Reply-To: <CAMJ=MEe-AfvoQ9tx5z3Wo2=w3tTbsorqCmcSp6trkxMmwpusZg@mail.gmail.com>
References: <CAMJ=MEd+eR2Z1yUKu541TQzQJOhu-fpa6HDLD0e-0+n-Jt-6WA@mail.gmail.com>
 <20121002160254.3b94fe25@skate>
 <CAMJ=MEe-AfvoQ9tx5z3Wo2=w3tTbsorqCmcSp6trkxMmwpusZg@mail.gmail.com>
Message-ID: <20121002194921.5fb92a46@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ronny,

Please keep the list Cc'ed for Buildroot related discussions.

On Tue, 2 Oct 2012 19:43:46 +0200, Ronny Meeus wrote:

> The toolchain is available from cnusers.org.
> You need to register first but once registered (can take 1 day or so), go to:
> Downloads -> Downloads for registered users -> Octeon Software
> development kit -> SDK 2.3
> This is the complete octeon SDK including an installed toochain, Linux
> source code, example code, uboot etc for the Cavium reference boards.
> This is the direct link:
> http://www.cnusers.org/index.php?option=com_remository&Itemid=32&func=fileinfo&id=165

Ok, thanks, I'll have a look. However, if registration is required,
integrating the toolchain in Buildroot will be difficult.

> > And my opinion is that we should not try to support this. Unless I'm
> > missing something, it is a really bizarre use case, and adding support
> > for it would create an horrible additional complexity in Buildroot.
> 
> In my opinion this usecase is not so bizarre. New applications can be
> compiled in 64Bit mode while legacy applications (coming from a 32Bit
> machine) can be compiled with the -mabi=n32 compiler option. If we
> would not do this and just compile in 64Bit mode, the impact in the
> application can be big (size of several types changes from 4 to 8
> bytes, impact on the size of data-types, alignment issues etc).
> 
> What about the support to compile the userland with a different ABI
> than the kernel?

Sure. Do you know what changes we should do to make this possible?

> > The change you did for libfuse cannot be integrated: it is MIPS
> > specific, and we also have no way of specifying on a per-package basis
> > whether it should be built for 32 bits or 64 bits.
> 
> I just included this code to give you an indication of the changes I
> needed to do ...

Sure, that's the way I took your code, I just highlighted the reason
why we couldn't accept this type of modification.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
