From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Dec 2016 23:39:21 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: add autoreconf back
In-Reply-To: <d545c88d-8eae-ed7a-23ab-781924c58571@mind.be> (Arnout
 Vandecappelle's message of "Mon, 5 Dec 2016 23:00:39 +0100")
References: <20161205131504.28872-1-gary.bisson@boundarydevices.com>
 <20161205213207.42e356af@free-electrons.com>
 <d6c03c59-32b7-3749-80a7-ba4c812b3f87@mind.be>
 <20161205221922.13838a32@free-electrons.com>
 <d545c88d-8eae-ed7a-23ab-781924c58571@mind.be>
Message-ID: <87eg1m57c6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> So, we've got two options here:
 >> 
 >> 1. Say that having to change the original .mk file of a package in
 >> Buildroot is a fact of life if you add custom patches for this
 >> package.

 >  Actually, for this particular case, it would be sufficient to patch Makefile in
 > addition to Makefile.in. Which is a fact of life I'd say. We also sometimes have
 > to do that when autoreconf doesn't work.

 >> 2. Imagine a mechanism that allows the "external" stuff to set
 >> autoreconf on a per-package basis.

 >  Eek please no.

 >  One thing I can imagine is that the expansion of the package infras is done
 > later (after inclusion of external.mk). The first pass would just set variables,
 > not define rules and definitely not use any ifdefs. The rules etc. would then
 > have to avoid using $(1) $(2) etc, and just rely on $($(PKG)_NAME) and friends.

Lets not complicate things too much. Just patching Makefile as well
and/or modifying the package is imho good enough.

-- 
Bye, Peter Korsgaard
