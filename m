From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Tue, 31 May 2016 09:43:48 +0200
Subject: [Buildroot] [PATCH] build: fix umask test
In-Reply-To: <744ed421-d308-297d-a497-251a7756c0d2@mind.be>
References: <20160530070635.GA27560@airbook.vandijck-laurijssen.be>
 <87mvn82d50.fsf@dell.be.48ers.dk> <87inxw2cnt.fsf@dell.be.48ers.dk>
 <20160530111740.14c24236@free-electrons.com>
 <20160530095319.GA5804@airbook.vandijck-laurijssen.be>
 <87a8j73lz2.fsf@dell.be.48ers.dk>
 <20160530210928.GA19307@airbook.vandijck-laurijssen.be>
 <744ed421-d308-297d-a497-251a7756c0d2@mind.be>
Message-ID: <20160531074348.GA26685@airbook>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > 
> > I see, but how would that help when bash is not on the system?
> > Is bash a prerequisite?
> 
>  Yes, bash is a prerequisite. Some of our own scripts are bash scripts.
> Moreover, quite a few packages just assume that the shell is bash. Requiring
> bash and setting is as SHELL is the simplest way to handle that.

The Makefile only recommends /bin/bash, it falls back to 'sh' when bash
is not present.

> 
> > 
> > I was thinking on using /bin/printf to avoid using the shell builtin.
> 
>  I don't have /bin/printf, only /usr/bin/printf...

Thanks for mentioning, I'll address the problem without printf.

Kurt
