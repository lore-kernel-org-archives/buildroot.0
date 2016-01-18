From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 18 Jan 2016 07:06:10 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160117001117.569d43f2@free-electrons.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
Message-ID: <1453100769.7056.14.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2016-01-17 at 00:11 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Gustavo, Vicente, J?rg, Frank, Bernd, Maxime, Carsten, Davide, Jeremy,
> VIcente, Gilles, Gary, Romain, Matt, Waldemar, Fran?ois, Alexey, Joris,
> Volkov: there are some specific build failures for which your help
> would be appreciated. See below. Thanks in advance for your help!
> 
> On Sat, 16 Jan 2016 08:30:21 +0100 (CET), Thomas Petazzoni wrote:

> >          arc |                  mesa3d-11.1.0 | NOK | 
> > http://autobuild.buildroot.net/results/7b3f5c0e3c59bd49614e8ad4eee3d89e3527a939/
> 
> Compiler problem, issue is known by Synopsys.

Indeed that's a known problem for us and it's me to blame for seeing no progress here.
Still we already have newer toolchain in its RC1, let's see it problem still happens.
And anyways I'll send a patch with new tools support today.

> >          arc |                       qt-4.8.7 | NOK | 
> > http://autobuild.buildroot.net/results/a85a1839a45fb6102e53131ecc8f6dadf92bcdc2/
> 
> Static linking, I'm assuming this *could* be fixed by
> https://git.busybox.net/buildroot/commit/?id=12009bb92931b153823110f811632540044d3b02,
> though I am not sure. Alexey?

Well unfortunately mentioned patch doesn't help here, see it's being applied already:
------------------->8------------------
Applying 0009-Fix-library-inclusion-order-when-building-statically.patch using patch: 
patching file config.tests/unix/compile.test
[3m>>> qt 4.8.7 Configuring[23m
------------------->8------------------

So there's something else. I have 1 idea to try here.

> 
> >          arc |                     ruby-2.3.0 | NOK | 
> > http://autobuild.buildroot.net/results/8e98934b066d4973d88e7d28b042b99550d68ae8/
> 
> Compiler issue:
> 
> /tmp/cctdImle.s: Assembler messages:
> /tmp/cctdImle.s:2253: Error: invalid register number `63'
> /tmp/cctdImle.s:2255: Error: invalid register number `63'
> 
> Alexey ?

Good catch. Again let us try newer tools and if it doesn't help we'll be
bugging our toolchain developers.

> >          arc |                trousers-0.3.13 | NOK | 
> > http://autobuild.buildroot.net/results/c3d3bedffe0f4ba40f33d18e90a4802f4a7bfffb/
> 
> PIE problem, under discussion.

Indeed, Lada is busy with that.

Regards,
Alexey
