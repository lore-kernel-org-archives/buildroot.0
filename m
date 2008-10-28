From: Daniel J Laird <daniel.j.laird@nxp.com>
Date: Tue, 28 Oct 2008 13:36:08 +0100
Subject: [Buildroot] LDFLAGS setting in buildroot
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F13B20D91B5@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometime ago Thomas Petazzoni posted some patches about setting rpath-link etc.

I have been playing with this and have come to similar conclusion.  That is that
doing LD="$(TARGET_LD) $(TARGET_LDFLAGS)" is not very helpful.

In fact if I do this I need to pass LDFLAGS to lots of my packages
directfb
png,
webkit,
cairo,
To name but a few.

However if I split this into:
LD="$(TARGET_LD)"
LDFLAGS="$(TARGET_LDFLAGS)"

They all build better (i.e I do not need to add LD_FLAGS to all the packages) and I can then add --rpath-link lines to TARGET_LDFLAGS and they all still build (no shared library issues)
Does anyone have any problems with what I am suggesting before I go ahead and commit.....

Many thanks
Daniel Laird
