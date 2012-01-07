From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 7 Jan 2012 13:59:13 -0600
Subject: [Buildroot] Job ID Query
In-Reply-To: <874nw7ia2j.fsf@macbook.be.48ers.dk>
References: <201201060925.51926.minimod@morethan.org>
 <874nw7ia2j.fsf@macbook.be.48ers.dk>
Message-ID: <201201071359.15470.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat January 7 2012, you wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
>  Michael> Group,
>  Michael> Is there a Make or BuildRoot variable that identifies
>  Michael> the current make job id?
> 
> Not afaik. What is the use case for knowing this?
> 

Package capture in the presence of multiple make jobs outputting
to a common directory, typically, through a common part of the
build system infrastructure.

It goes back to a suggestion of mine a few months back in answer
to (one of many) posts about capturing the build output in
distinct packages.

Have been working on parts of my own suggestion and think I can
make it work, __IFF__ you run Buildroot -j1.

Which no one of sane mind, with a multicore machine will be 
interested in doing. ;-)

I did also consider dropping that restrictive phrase: "outputting
to a common directory" -
But that I consider both too invasive, and against my declared
intent to make it a transparent feature addition for the user.

Will continue giving my own suggestion more thought as time
becomes available.

After all, (on a failure) make does have that: "Waiting for xyz
jobs to complete" message, it does "know" how many jobs are
running at the moment.

But I certainly don't want to propose patching make to expose
the job identification if it doesn't already provide that.

Mike
