From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2008 14:37:29 +0100
Subject: [Buildroot] LDFLAGS setting in buildroot
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F13B20D91B5@EU1RDCRDC1WX029.exi.nxp.com>
References: <C13DBBE85AD6974B85C118C35890CA5F13B20D91B5@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <20081028143729.71c6dc03@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Oct 2008 13:36:08 +0100,
Daniel J Laird <daniel.j.laird@nxp.com> a ?crit :

> Sometime ago Thomas Petazzoni posted some patches about setting
> rpath-link etc.
> 
> I have been playing with this and have come to similar conclusion.
> That is that doing LD="$(TARGET_LD) $(TARGET_LDFLAGS)" is not very
> helpful.

It's worse than that: on my setup, the patch you committed didn't work
because the -Wl,--rpath-link option was in TARGET_LDFLAGS, and so was
part of the LD variable, leading to ./configure failures when trying to
detect available libraries.

> They all build better (i.e I do not need to add LD_FLAGS to all the
> packages) and I can then add --rpath-link lines to TARGET_LDFLAGS and
> they all still build (no shared library issues) Does anyone have any
> problems with what I am suggesting before I go ahead and commit.....

Can you just send the patch you intend to commit, so that I can test
before ?

Thanks a lot for caring about this issue !

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
