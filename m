From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Wed, 09 Jun 2021 10:31:30 +0200
Subject: [Buildroot] [PATCH v5 0/5] Introduce bmap-tools as target +
 host package
In-Reply-To: <20210609095022.4f59aa2f@windsurf>
References: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
 <6e9afcd08150926a669d4df1198461e0acc7f063.camel@orolia.com>
 <20210609095022.4f59aa2f@windsurf>
Message-ID: <c36d6e9234c92cc4b17697073c2b70d5243d562e.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Thanks a lot for the testing! I'll double check, but I believe the
> tests were working here. But of course, I've done quite a bit of back
> and forth, so let's double check :)
> 

For the 64M thing, maybe a difference in qemu versions?
I'm using debian bullseye (11) and my qemu version is:
$ qemu-system-arm  --version
QEMU emulator version 5.2.0 (Debian 1:5.2+dfsg-10)
Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

About the timeout, I bet it was due to the work load, because I can't
reproduce it today, when the activity on my machine is low.
That said, the execution times range between 13s to 16s which makes me
say that the orinigal 20s limit was maybe too optimistic.
Maybe 60 seconds is not strictly required, but at least something like
40s would be safer.

> > And I have a question, is keeping python 2 compatibility still
> > required? Shouldn't we get rid of this test? It'd save quite an
> > amount
> > of CPU time :)
> 
> python2 is already marked deprecated in BR, and we're more and more
> thinking of getting rid of it. I think this may happen in the near
> future.
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
