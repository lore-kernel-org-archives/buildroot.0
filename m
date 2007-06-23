From: Benjamin Tietz <benjamin@micronet24.de>
Date: Sat, 23 Jun 2007 18:32:19 +0200
Subject: [Buildroot] Easy packaging - Makefile.autotools.in with extra
	make magic
In-Reply-To: <20070621144231.GA4335@firebird.dresden.micronet24.de>
References: <f0528b5b0706140808s41ac007fn7f25a58b06e4b2f4@mail.gmail.com>
	<f0528b5b0706200253v702e78c3x4a802e4c9452d60@mail.gmail.com>
	<20070621144231.GA4335@firebird.dresden.micronet24.de>
Message-ID: <20070623163219.GA4196@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This was a easy one. even if it is only for future use. existing
packages must be changed to use something like
	MYPACKAGE_SITE = $(BR2_GNU_MIRROR)/mypackage

Benjamin

On Thu, Jun 21, 2007 at 04:42:31PM +0200, Benjamin Tietz wrote:
> Hi Julien, hi list,
> 
> > >By the way, what about a user defined GNU-Mirror - the official one is
> > >sometimes real slow...
> > 
> > That would be an excellent idea, but its beyond the scope of the
> > autotools makefile... Do you have such a patch ready?
> > 
> I see, I have not enough time... since I had some patches ready I
> wanted to release. Hopefully next weekend.
> 
> > >Just another word on the replace.sh: why? ( I'm afraid of hundreds of 
> > >stupid
> > >scripts lying around somewhere)
> > >It is used only once and could be substituted by something like
> > >	
> > >	for i in $(find $(STAGING_DIR)/usr/lib/ -name \*.la); do \
> > >		mv "$i" "$i~"; \
> > >		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:" "$i~" > 
> > >		"$i";\
> > >	done
> > 
> > Again, laziness. Fixed with the above.
> > 
> > Just one error in your code snippet -- correct me if i'm wrong.
> > you can't use the $(find ...) make function here, because it's
> > evaluated before the make rule is run, i.e. before the package is
> > actually installed. So I replaced it with a $$(find) shell call to the
> > 'find ' command.
> You are totally right. 
> 
> Thanks for your work. It should make the buildroot much more useful.
> 
> Benjamin
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gnu_mirror.patch
Type: text/x-diff
Size: 608 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070623/e9722553/attachment.bin 
