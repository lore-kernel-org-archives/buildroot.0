From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 09:00:29 +0100
Subject: [Buildroot] [RFC v2 2/2] package/qt5webengine: fix chromium arm
 compile flags
In-Reply-To: <20200302230155.0b241578@gmx.net>
References: <20200302091926.19308-1-ps.report@gmx.net>
 <20200302091926.19308-2-ps.report@gmx.net>
 <20200302143007.17aa8819@windsurf.home>
 <20200302230155.0b241578@gmx.net>
Message-ID: <20200303090029.3ab94eef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Mon, 2 Mar 2020 23:01:55 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> > Could we instead ask this thing to not do all this sorcery, and instead
> > just use the compiler as-is, without passing crazy
> > architecture-specific compiler flags ?  
> 
> Disabled all march/mfloat-abi/mtune/mfpu flags with the following patch:

[...]

Thanks for this work! To me this feels like a better solution, even
though it's annoying to maintain such a local patch. I assume there's
pretty much zero chance to get this merged by upstream Chromium, and
then back into the qt5webengine code anyway.

> Quick (if you call can call it quick with miniumum 50 minutes compile time)
> worked for a buildroot toolchain (which defaults to the right cpu) and
> the rpi zero testcase..., but now no buildroot specific flags are
> used for the compile (no optimize, no custom, no cpu type etc.)...,
> will work with compilers with the right default values...

The CPU type is encoded into the compiler wrapper. So it's really only
the optimization/debug flags that you will be missing.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
