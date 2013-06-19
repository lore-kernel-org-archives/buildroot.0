From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Wed, 19 Jun 2013 18:03:51 +1000
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <20130619082557.447efce8@skate>
References: <kphffs$v5g$1@ger.gmane.org> <51BEAB3A.8010408@mind.be>
 <kpmcpb$lbo$1@ger.gmane.org> <51C08403.4050900@mind.be>
 <kpqg93$v74$1@ger.gmane.org> <20130619082557.447efce8@skate>
Message-ID: <kprol2$uk1$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Sorry, to clarify - I get the error running just "make", but if I want to
>> experiment by changing build flags, I can run "make binutils" to skip
>> recompiling gcc, uclibc, etc. and just attempt the bit that recently failed.
>
> I believe you're still confusing the target binutils (which gets built
> when you run "make binutils") with the cross binutils (which gets built
> together with gcc, uclibc as part of the cross-compilation toolchain,
> this one can be rebuilt explicitly by doing "make host-binutils").

That's possible, but I don't believe so.  I understand that "make binutils" 
will compile the target binutils.  But when I just run "make" it successfully 
builds the host binutils, then continues on to build the target binutils, 
where it fails.  So I was just running "make binutils" as a quick way of 
recompiling the target binutils while I was trying to figure out a way around 
the problem.  I now realise that the problem is this package (target binutils) 
shouldn't be being built at all, so you can probably forget my comment about 
"make binutils" now :-)

> Do you need the target binutils? If you need BFLT support, your target
> system has no MMU, so is probably a bit memory limited, so what would
> you need to have binutils on your target on a small system?

No I don't want the target binutils, but I don't seem to be able to disable 
it.  It's deselected in the buildroot config, but it still seems to be getting 
compiled.  How would I go about working out why?  I'm not sure how to debug 
all the make dependencies.

Thanks,
Adam.
