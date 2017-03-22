From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:40:56 +0100
Subject: [Buildroot] [PATCH v5 11/19] infra-libtool: pass sysroot
 information to libtool
In-Reply-To: <ec738de2-eb06-2db5-1e20-c78c10ceff21@mind.be>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <8e7692b2-4ebc-d533-8eda-d4a92fd2a7f8@mind.be>
 <20170322091437.7ebd63bf@free-electrons.com>
 <3486005.igxPQ1hGml@sagittae>
 <b9674e85-d4dc-47e1-1bd1-84d5ca676968@mind.be>
 <ec738de2-eb06-2db5-1e20-c78c10ceff21@mind.be>
Message-ID: <20170322224056.5ffcb26a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 22:28:27 +0100, Arnout Vandecappelle wrote:

> >>>> I think we can take the risk. The autobuilders will discover any issues,
> >>>> which we can fix per package (e.g. with AUTORECONF = YES).  
> 
>  By the way, this series also *fixes* issues. E.g. I couldn't reproduce
> http://autobuild.buildroot.net/results/e8c6bdc314b9a8d5de303633a3abd7b7e44beb2e
> after applying this series, whereas I could reproduce it before.

So it allows to have better .la files, that help with "transitive"
dependencies in static linking scenarios?

Also, you don't need to convince me that we need to use the libtool
sysroot support. Anything to cleanup/remove the libtool hacks that we
have is welcome, so this series is definitely welcome, and I'm not
trying to push back on it.

It's just that Jerome's assumption was that the sysroot support was in
libtool since 1.5, which is not the case, and the fact that it's only
there since libtool 2.4 and we have packages using earlier libtool
versions needs to be handled by the series.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
