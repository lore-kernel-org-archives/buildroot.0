From: Steve James <ste@junkomatic.net>
Date: Thu, 8 Jan 2015 12:50:56 +0000
Subject: [Buildroot] [PATCH v4] leveldb: new package
In-Reply-To: <20150108132719.02d06610@free-electrons.com>
References: <1420469267-26272-1-git-send-email-ste@junkomatic.net>
 <201501081209.41211.ste@junkomatic.net>
 <20150108132719.02d06610@free-electrons.com>
Message-ID: <201501081250.56410.ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 08 Jan 2015 12:27:19 Thomas Petazzoni wrote:
--snip--

> Well, Buildroot is re-using kconfig directly from the Linux kernel
> sources. So we haven't defined the kconfig language, and we don't want
> to change it specifically for Buildroot.

As I thought. I'll get used to it.

--snip--

> If you don't use a full path and do:
> 
> 	$(INSTALL) -D $(@D)/foo $(STAGING_DIR)/usr/lib
> 
> and $(STAGING_DIR)/usr/lib doesn't already exist as a directory, then a
> file named $(STAGING_DIR)/usr/lib will be created, with the contents of
> $(@D)/foo. Cleary not what we want.

I would ordinarily create destination directories first, but I hadn't in this 
case, so good point.

> > > It would be good to add a comment above all these installation rules to
> > > indicate that the leveldb build system doesn't provide any "make
> > > install" rule.
> > 
> > Or better: I'll add the missing install recipe to the Makefile.
> 
> Indeed.
> 
> However, I looked quickly at the contribution process for leveldb and
> it's a bit annoying: you have to sign a CLA to assign the copyright of
> your contributions. Or hopefully they might consider those
> contributions as small enough to not be copyrightable, and avoid the
> CLA hassle. I'll let you handle that with upstream.

Yes I saw that too. How very annoying. I'm reluctant to put my name on a 
Google License Agreement just to tweak a Makefile. I see they even want my 
address and phone number. Hmm.

Whether they accept it upstream or not, I think patching the install recipe 
into the leveldb Makefile is a more correct solution and will be better for 
Buildroot.

Steve.
