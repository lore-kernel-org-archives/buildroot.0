From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 18 Mar 2009 15:46:57 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090318142514.GE27893@whatever.nu>
References: <20090318112308.GA27893@whatever.nu>
	<20090318114711.GA19956@buzzloop.caiaq.de>
	<20090318122515.GB27893@whatever.nu>
	<20090318123004.GE18723@buzzloop.caiaq.de>
	<20090318131349.GD27893@whatever.nu>
	<20090318132530.GF18723@buzzloop.caiaq.de>
	<20090318142514.GE27893@whatever.nu>
Message-ID: <20090318144657.GC19956@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 18, 2009 at 03:25:14PM +0100, Per-Henrik Lundblom wrote:
> > > conftest.c:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'me'
> > > configure:3636: $? = 1
> > > configure: failed program was:
> > > | #ifndef __cplusplus
> > > |   choke me
> > > | #endif
> > 
> > That's your problem - C++ support is not enabled. Could you try your
> > build with 'BR2_INSTALL_LIBSTDCPP=y'? And as Sven suggested, clean your
> > tree probably :)
> 
> Don't know how i could have missed the "choke me", i digged through the
> condig.log pretty thoroughly... 

Sorry, my suggestion was misleading - this test seem to be ok to fail.
Also, the config.log file you sent ends with "configure: exit 0", so
this is the wrong point to dig for the problem.

However, The information you posted is not sufficient to tell where
exactly your build breaks. Could you a) figure out which part is the
exact problem and then b) have a look at config.log and see which part
makes this configure run give up?

Daniel
