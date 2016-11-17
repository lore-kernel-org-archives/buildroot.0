From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2016 15:08:55 +0100
Subject: [Buildroot] [PATCH 00/15] Reproducible builds
In-Reply-To: <9798cfe2186532e99707f24481a2a03a@sysmic.org>
References: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
 <20161117121341.4a63ed15@free-electrons.com>
 <9798cfe2186532e99707f24481a2a03a@sysmic.org>
Message-ID: <20161117150855.4b2c99b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 14:17:41 +0100, J?r?me Pouiller wrote:

> >>   - since gcc versions supporting SOURCE_DATE_EPOCH are not widely 
> >> available,
> >>     external toolchains probably won't work.  
> > 
> > Instead of patching gcc, can we solve the problem in the toolchain
> > wrapper? I.e, maybe the toolchain wrapper can set __DATE__ and __TIME__
> > by passing -D__DATE__=... -D__TIME__=... to gcc ?  
> 
> Yes, I can switch to this solution.

I think it's a reasonable use of the wrapper, and makes the thing work
fine for external toolchain as well, which is nice.

Another (unrelated) question: how can we test this stuff? You're
providing the initial steps for it, but at some point, we will want to
validate which packages behave properly and which packages don't behave
properly. Have you already thought of automated testing we can do (in
the autobuilders perhaps?) to exercise this "reproducible builds"
functionality? Should we from time to time do a given builds twice,
each time in a different environment (different date, different time,
different user, different path, different timezone, different locale,
etc.) ?

To what extent do we try to be reproducible? Do we try to have
something that produces the same result when executed multiple times,
but on the same machine, in the same environment (i.e only date/time
changes) ? Or do we try to go the point where a given Buildroot .config
gives a byte identical output regardless of the host machine on which
you do the build? It would be great to know what our definition of
"reproducible is", and document it in the help text of the
BR2_REPRODUCIBLE option.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
