From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 13:27:19 +0100
Subject: [Buildroot] [PATCH v4] leveldb: new package
In-Reply-To: <201501081209.41211.ste@junkomatic.net>
References: <1420469267-26272-1-git-send-email-ste@junkomatic.net>
 <20150107101218.22b5455f@free-electrons.com>
 <201501081209.41211.ste@junkomatic.net>
Message-ID: <20150108132719.02d06610@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve James,

On Thu, 8 Jan 2015 12:09:41 +0000, Steve James wrote:

> OK, if you wish (I just copy-pasted from elsewhere). BTW I don't find this 
> statement natural to read whichever way the logic is expressed. I think it 
> would read better if "depends on" where replaced with "when" (or "if") 
> instead:-
> 
> comment "leveldb needs a toolchain w/ C++, threads"
> 	when !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS)
> 
> But maybe that's just something I have to get used to.

Well, Buildroot is re-using kconfig directly from the Linux kernel
sources. So we haven't defined the kconfig language, and we don't want
to change it specifically for Buildroot.

> Fair enough. I don't like it either, for the same reason (but I thought I 
> might get away with it :). I have been resisting making a patch for leveldb 
> but...

Yes, I agree there is sometimes a balance between having a patch, and
doing a little bit more work in the Buildroot .mk file. In this case, I
believe having a patch makes the whole thing a lot nicer, and hopefully
the patch can be applied upstream.


> > Full path for the destination is needed:
> > 
> > 							
> $(STAGING_DIR)/usr/lib/libleveldb.so.1.18
> 
> No, I don't think so. From install(1) man page:-

If you don't use a full path and do:

	$(INSTALL) -D $(@D)/foo $(STAGING_DIR)/usr/lib

and $(STAGING_DIR)/usr/lib doesn't already exist as a directory, then a
file named $(STAGING_DIR)/usr/lib will be created, with the contents of
$(@D)/foo. Cleary not what we want.

> > It would be good to add a comment above all these installation rules to
> > indicate that the leveldb build system doesn't provide any "make
> > install" rule.
> 
> Or better: I'll add the missing install recipe to the Makefile.

Indeed.

However, I looked quickly at the contribution process for leveldb and
it's a bit annoying: you have to sign a CLA to assign the copyright of
your contributions. Or hopefully they might consider those
contributions as small enough to not be copyrightable, and avoid the
CLA hassle. I'll let you handle that with upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
