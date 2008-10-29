From: Daniel Laird <danieljlaird@hotmail.com>
Date: Wed, 29 Oct 2008 14:17:16 +0000
Subject: [Buildroot] LDFLAGS setting in buildroot
In-Reply-To: <87y7075w4w.fsf@macbook.be.48ers.dk>
References: <C13DBBE85AD6974B85C118C35890CA5F13B20D91B5@EU1RDCRDC1WX029.exi.nxp.com>	<20081028131817.GA3139@mx.loc>
	<20081028143538.5e9eda36@surf>	<20081028134555.GB3139@mx.loc>
	<20081028150833.015999ca@surf>	<20081028153100.GC3139@mx.loc>
	<20081028170050.6ded5cda@surf>	<20081028161325.GA5827@mx.loc>	<C13DBBE85AD6974B85C118C35890CA5F13B20D9424@EU1RDCRDC1WX029.exi.nxp.com>	<20081028171739.GC5827@mx.loc>	<C13DBBE85AD6974B85C118C35890CA5F13B20D977B@EU1RDCRDC1WX029.exi.nxp.com>
	<87y7075w4w.fsf@macbook.be.48ers.dk>
Message-ID: <COL102-DS22280F945FD348E58B8171DC260@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, I agree.  in this case freetype was not dependant upon zlib and it
looks for it in configure so I added that dependancy and it works fine.....

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of Peter Korsgaard
Sent: 2008 Oct 29 14:11
To: Daniel J Laird
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] LDFLAGS setting in buildroot

>>>>> "Daniel" == Daniel J Laird <daniel.j.laird@nxp.com> writes:

 Daniel> I have been playing with using the AUTO_CONFIGURE_TARGET and it
seems to be going faster as  you indicated but I have discovered an issue.
 Daniel> I build a number of packages and as each one builds  they update
the central cache file.
 Daniel> However One of my packages configures before zlib is built.  
 Daniel> This means it caches zlib is unavailable.

Shouldn't that package then depend on zlib?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
