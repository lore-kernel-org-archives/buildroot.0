From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 14:19:44 +0100
Subject: [Buildroot] [PATCH v2 05/23]
 toolchain-external-blackfin-uclinux: new package
In-Reply-To: <20161030181700.GC18077@free.fr>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-6-git-send-email-romain.naour@gmail.com>
 <20161030164752.GA18077@free.fr>
 <20161030183734.26f568d4@free-electrons.com>
 <20161030181700.GC18077@free.fr>
Message-ID: <20161101141944.01daf548@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 19:17:00 +0100, Yann E. MORIN wrote:

> > The virtual package should be named "toolchain-external", which clashes
> > with the existing "toolchain-external" package that you remove in step
> > (5). So you can't do your step (2) before doing your step (5), unless
> > of course you name the packages differently.  
> 
> A virtual package is but a generic package, so nothing prevents it from
> having its own _CMDS macros; it can download, configure and build stuff
> of its own.
> 
> Alternatively, you can have the toolchain-external package depend on
> each of the new toochain-external-foo when it is added, as a kind of
> manually-handled virtual package, before eventually converting it to a
> real virtual package once everything as been split out to individual
> providers.

So when the series if half applied, you have:

 - The toolchain-external package infrastructure, which is used by some
   of the toolchains

 - The toolchain-external package, which depending on the toolchain,
   either:

   - Implements itself the logic (for toolchains not yet converted)

   - Depends on another package, toolchain-external-foo, that
     uses the toolchain-external package infrastructure ?

So at some point, if you have two times the code to handle the external
toolchain logic. But I agree that this can work.

Romain, what do you think?

> > With this in mind, going for one option
> > or another really doesn't make much difference. And knowing how painful
> > it is to keep this series up-to-date, I'm personally happy with the
> > current way things are introduced.  
> 
> Since when is "maintaining this series is painful" a rationale for
> applying said series?
> 
> I've known (and maintained and still maintain) series that were (are)
> more difficukt to maintain than this one. And yet, you rarely if ever
> argued those series should be applied just because they were hard to
> maintain...  (And I'm not speaking only for my own series, far from
> it.)

A series that is painful to maintain is definitely a very good
rationale for applying that series quickly *if* people agree that
the series is generally going in the right direction.

What happened with some of your series is that they clearly wasn't a
consensus that we wanted what you were proposing. For example, the
multi-br2-external stuff must have been a real pain to maintain for you
for this long time. But the consensus around it clearly took a long
time to exist, because people were not very enthusiastic about the
additional complexity.

So, yes, the painfulness of maintaining a series is definitely a good
reason to apply it quickly, as long as there is a general consensus
that the stuff proposed by this series is what we want.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
