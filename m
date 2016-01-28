From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 28 Jan 2016 13:44:42 +1100
Subject: [Buildroot] PowerPC64 toolchain not building
In-Reply-To: <20160127093256.77169e7d@free-electrons.com>
References: <20160123150731.1c1db4b0@free-electrons.com>
 <20160124191236.GQ17143@waldemar-brodkorb.de>
 <20160124213607.6e3b1257@free-electrons.com>
 <20160127043858.GB6719@tungsten.ozlabs.ibm.com>
 <20160127093256.77169e7d@free-electrons.com>
Message-ID: <20160128024442.GA5589@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 27, 2016 at 09:32:56AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 27 Jan 2016 15:38:58 +1100, Sam Bobroff wrote:
> 
> > I have a bit of experience with buildroot on PowerPC64 so I also attempted to
> > replicate this, but I could not. I don't know the rest of your config but I
> > did match the values you posted above. An operand error like that could be
> > related to the specific architecture version the assembler is expecting, so
> > changing the "target architecture variant" is probably worth trying (try
> > "generic").
> 
> Thanks a lot for having looked at the problem!
> 
> You need to select the power8 processor for the issue to reproduce. It
> doesn't appear with power7 for example.

Hmm, while that's not surprising, I've used that combination of options (power8
big-endian with gcc 4.9.x and gcc 5.x) and it works fine for me. Have you tried
building from completely clean, including clearing or disabling ccache?

Maybe the host architecture matters? Is that x86_64? What gcc do you have on
the host?

Cheers,
Sam.
