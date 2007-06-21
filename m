From: Benjamin Tietz <benjamin@micronet24.de>
Date: Thu, 21 Jun 2007 16:42:31 +0200
Subject: [Buildroot] Easy packaging - Makefile.autotools.in with extra
	make magic
In-Reply-To: <f0528b5b0706200253v702e78c3x4a802e4c9452d60@mail.gmail.com>
References: <f0528b5b0706140808s41ac007fn7f25a58b06e4b2f4@mail.gmail.com>
	<f0528b5b0706200253v702e78c3x4a802e4c9452d60@mail.gmail.com>
Message-ID: <20070621144231.GA4335@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien, hi list,

> >By the way, what about a user defined GNU-Mirror - the official one is
> >sometimes real slow...
> 
> That would be an excellent idea, but its beyond the scope of the
> autotools makefile... Do you have such a patch ready?
> 
I see, I have not enough time... since I had some patches ready I
wanted to release. Hopefully next weekend.

> >Just another word on the replace.sh: why? ( I'm afraid of hundreds of 
> >stupid
> >scripts lying around somewhere)
> >It is used only once and could be substituted by something like
> >	
> >	for i in $(find $(STAGING_DIR)/usr/lib/ -name \*.la); do \
> >		mv "$i" "$i~"; \
> >		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:" "$i~" > 
> >		"$i";\
> >	done
> 
> Again, laziness. Fixed with the above.
> 
> Just one error in your code snippet -- correct me if i'm wrong.
> you can't use the $(find ...) make function here, because it's
> evaluated before the make rule is run, i.e. before the package is
> actually installed. So I replaced it with a $$(find) shell call to the
> 'find ' command.
You are totally right. 

Thanks for your work. It should make the buildroot much more useful.

Benjamin
