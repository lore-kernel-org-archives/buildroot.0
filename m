From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 14:30:16 +0200
Subject: [Buildroot] [PATCH 1/2] gcc: remove option on SJLJ exceptions
In-Reply-To: <201007290659.39124.minimod@morethan.org>
References: <cover.1280385006.git.thomas.petazzoni@free-electrons.com>
	<201007290538.09064.minimod@morethan.org>
	<20100729133837.5680e0c2@surf>
	<201007290659.39124.minimod@morethan.org>
Message-ID: <20100729143016.07c9a2f0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Jul 2010 06:59:36 -0500
"Michael S. Zick" <minimod@morethan.org> wrote:

> > Why do you need to be so aggressive ? It is possible that removing
> > this option was a mistake, but there's *really* no need to be so
> > aggressive. It only reduces the motivation to look at the problem...
> 
> The last time this subject came up on the ML tests seemed to indicate
> that the option was required by the Lua package.
> 
> I just presumed you have been following the mailing list postings.

Sorry, I couldn't find the postings you're refering to. Do you have a
pointer ?

And even though the subject already came up on the mailing list, there
is absolutely zero reason for being aggressive. For the record, a
thread about SJLJ was started on July, 22nd by Ossy reporting a build
failure when SJLJ is enabled. On July, 27th, in the same thread, I
proposed to remove the option altogether, and there has been no
reaction to this message. But I admit that between the 27th and the
29th when the patch was committed, there is very little time to react.
I just wanted to point out that the patch does come out of nowhere
without prior discussion on the list.

> Pass an illegal value to a library routine or to a routine that you
> write. "Lua" refers to both a set of C libraries and to the
> interactive mode which uses those same libraries.
> 
> So testing with the interactive mode should be enough to see a
> backtrace.
> 
> Since the libraries (written in ANSI C) are quite close to the
> interactive environment (usually only one or two calls away) you will
> not see a very long backtrace unless you write a function or two of
> your own, but you will get one.

Ok, thanks for the example, will try.

However, it seems that the --enable-sjlj-exceptions configuration
option only applies to libstdc++. Not having --enable-sjlj-exceptions
does not remove setjmp()/longjmp() support, it just seems to tell the
C++ library to not use setjmp()/longjmp() for its own exceptions. Which
doesn't prevent Lua from using setjmp/longjmp on its own.

But of course, I haven't tried, so I may be plain wrong.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
