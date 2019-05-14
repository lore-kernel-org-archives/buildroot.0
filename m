From: stefan.nickl at gmail.com <stefan.nickl@gmail.com>
Date: Tue, 14 May 2019 22:03:32 +0200
Subject: [Buildroot] [PATCH] package/musl: Make scheduler functions
 Linux-compatible
In-Reply-To: <14271c8c-d9e3-7be3-872b-ef5f1cb57eba@mind.be>
References: <509e7dab95b95c040af26c842e94777b069d6ba5.camel@gmail.com>
 <20190513221341.4150ab0c@windsurf.home>
 <071f102e7135306dfdba3203fbd35bdc07aa185f.camel@gmail.com>
 <20190514183356.50c06a52@windsurf>
 <c9b7162513ee169da4b9e7e73d66288c083e4a7a.camel@gmail.com>
 <00138043-5f6e-ef40-37e4-21368c24c82a@mind.be>
 <0b86f826cd3f48839e74dcb3dde3a4b69b80f701.camel@gmail.com>
 <14271c8c-d9e3-7be3-872b-ef5f1cb57eba@mind.be>
Message-ID: <db160fbf9100e03d489a9f067e836ad6de5a256e.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2019-05-14 at 21:38 +0200, Arnout Vandecappelle wrote:
> 
> On 14/05/2019 20:54, stefan.nickl at gmail.com wrote:
> > On Tue, 2019-05-14 at 20:04 +0200, Arnout Vandecappelle wrote:
> > >  As Thomas wrote, the patch as it is is not upstreamable since
> > > musl
> > > considers
> > > this a feature.
> > > 
> > >  However, it is possible that Rich can be convinced to actually
> > > read
> > > the POSIX
> > > spec and decide that linux behaviour is correct (except for the
> > > fact
> > > that it
> > > sched_setscheduler() should return the previous scheduling policy
> > > rather than 0,
> > > but that can be approximated (in a racy way) by calling
> > > sched_getscheduler()
> > > first). So it might be worth trying to push the patch upstream.
> > 
> > Hi Arnout,
> > 
> > I think upstreaming is out of the question since Rich has actually
> > *undone* it before 
> > https://git.musl-libc.org/cgit/musl/commit/?id=1e21e78bf7a5
> > 
> > Also asked on #musl a couple days ago whether they might be willing
> > to
> > at least #ifdef it, and only got suggestions for application side
> > fixes. So, no dice it seems.
> 
>  Yes, but has the argument "Linux does in fact implement POSIX" been
> used already?

I haven't used that argument and I'm not aware of anyone that has.

This comes pretty close though: 
https://github.com/MusicPlayerDaemon/MPD/issues/218

And just recently Rich managed to convince even the glibc developers of
the opposite, so I certainly don't feel up to arguing that position ;-)
https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=c70824b9a4645c0ecd049da8cfdb2c28ae7ada23

Cheers,
Stefan
