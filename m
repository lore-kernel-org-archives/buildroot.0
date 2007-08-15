From: Benjamin Tietz <benjamin@micronet24.de>
Date: Wed, 15 Aug 2007 11:26:04 +0200
Subject: [Buildroot] x11r7 created
	$(BUILD_DIR)/<package-dir>/.stamp_downloaded
In-Reply-To: <1187116207.13869.24.camel@elrond.sweden.atmel.com>
References: <1186864171.4742.15.camel@elrond.sweden.atmel.com>
	<20070814142017.GA4242@firebird.dresden.micronet24.de>
	<1187116207.13869.24.camel@elrond.sweden.atmel.com>
Message-ID: <20070815092604.GA4252@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 14, 2007 at 08:30:07PM +0200, Ulf Samuelsson wrote:
> tis 2007-08-14 klockan 16:20 +0200 skrev Benjamin Tietz:
> > On Sat, Aug 11, 2007 at 10:29:31PM +0200, Ulf Samuelsson wrote:
> > > The Makefile seems to create this file to indicate that it 
> > > had downloaded the source code.
> > > The $(BUILD_DIR) becomes really crowded this way.
> > From this one file, I see.
> > > 
> 
> Every package downloaded by make source, 
> creates a directory in $(BUILD_DIR)
> - And just to have a storage location for the
> "<PACKAGE>/.stamp_downloaded".
not just for this one file, the directory will also used far all other
stamp-files as well as a target for the unpacked source, their build and
so on
> 
> 
> > > I Think we should modify this so that the Makefile
> > > checks for the existance of the source file in $(DL_DIR)
> > > like most other packages.
> > > Tried, (see patch below), but the rule:
> > > 
> > > +$(DL_DIR)/$$($(PKG)_SOURCE):
> > >         $(call MESSAGE,"Downloading")
> > >         test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR)
> > > $($(PKG)_SITE)/$($(PKG)_SOURCE)
> > >         mkdir -p $(@D)
> > Mainly because of the way, make handles variables. They get
> > expanded,when the makefile is parsed. Even the doubled dollarsign can't
> > help you here.
> > 
> > > 
> > > fails (is not found) so I had to add 
> > > 
> > > +$$($(2)_TARGET_SOURCE):
> > > +       $(WGET) -P $(DL_DIR) $$($(2)_SITE)/$$($(2)_SOURCE)
> > > +
> > > 
> > In the macro it gets evaluated every time any package wants it to use.
> > Does that really pays the one unneeded stamp-file?
> > 
> 
> No 50-100 new directories in $(BUILD_DIR) 
> (I didn't count)
You will get them anyway, when you build the package.
> 
> > > to make it work.
> > > Anyone got a clue why the first rule fails?
> > > 
> > > 
> > > Maybe we should also consider building x11r7 in $(BUILD_DIR)/x11r7
> > > due to crowding.
> > You even get afraid of crowding, aren't you?
> > > 
> 
> NO, pissed off...
> I like all/most of the folders to fit into one window w/o scrolling.
What about changing your view to list? 
> 
> BR
> Ulf Samuelsson
> 
> 
> 
