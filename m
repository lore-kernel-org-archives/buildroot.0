From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Mar 2017 09:16:23 +0100
Subject: [Buildroot] [PATCH] support/script/check-bin-arch: ignore
 /usr/share
In-Reply-To: <2219b1bf-ae08-5c54-5f18-6a91e9f975ba@mind.be>
References: <1490128516-31437-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87inn1k9bb.fsf@dell.be.48ers.dk>
 <20170322140639.5c8c5149@free-electrons.com>
 <87efxpj8bv.fsf@dell.be.48ers.dk>
 <2219b1bf-ae08-5c54-5f18-6a91e9f975ba@mind.be>
Message-ID: <20170323091623.6fcd2bb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 00:03:57 +0100, Arnout Vandecappelle wrote:

> >  >> I wonder if we shouldn't turn the tests around, E.G. instead of
> >  >> searching for elf files with a machine different from target, search for
> >  >> a files with machine == host.  
> 
>  I don't agree. We don't only want to detect host-target confusion, we also want
> to detect wrong compilation, e.g. missing -EB.

This was exactly the case of the gst-ffmpeg package, for which I've
sent a fix. Everything was built for Sparc, but two libraries were
built for a slightly different version of Sparc, which was actually
incorrect.

Since for now, autobuilders issue caused by this seems to have all been
handled, I don't think there's much need to find a different solution.
Let's give it some more time and see if we need to change our mind.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
