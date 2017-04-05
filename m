From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Apr 2017 21:16:10 +0200
Subject: [Buildroot] [PATCH 0/7 v4] support/test-pkg: fixes and
 enhancements
In-Reply-To: <b39f073b-f6fb-d0e4-9977-31dc8c4d51e1@mind.be>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
 <b39f073b-f6fb-d0e4-9977-31dc8c4d51e1@mind.be>
Message-ID: <20170405191610.GA3609@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On 2017-04-05 16:37 +0200, Arnout Vandecappelle spake thusly:
> On 15-02-17 22:44, Yann E. MORIN wrote:
> > Hello All!
> > 
> > This series brings a few fixes and improvements to the test-pkg script.
> 
>  I was going to modify test-pkg to use the toolchains from configs/toolchains,
> but then I noticed this series was still not committed. It obviously conflicts
> heavily with what I'm going to do, so I'm taking this over, OK?

As you wish.

The latest version (which I did not yet post, did I?) is available, as
usual, on my git tree:

    git://git.busybox.net/~ymorin/git/buildroot   yem/test-pkg

> > ----------------------------------------------------------------
> > Yann E. MORIN (7):
> >       docs/manual: document the test-pkg script
> 
>  I'll include Thomas's feedback, plus some more fixes from me.

I think I already addresses Thomas' comments in the latest version.

Regards,
Yann E. MORIN.

> >       support/test-pkg: add option to use an alternate list of toolchains
> 
>  I'll drop this, since we're not going to get toolchains from a URL anymore. IMO
> the same feature can easily be achieved by having a directory with toolchain
> configs inside the tree (or inside an external tree).

Well, as long as I can specify a list of toolchains, that is not the
default, that's fine. If I just have to do a wget to have a local file,
I'm OK with that.

But I *want* to be able to use a custom list of toolchains.

> >       support/test-pkg: print number of toolchain and progress
> >       support/test-pkg: the list of toolchains really contains URLs
> 
>  With the toolchain URLs gone, this is not true anymore.

Well, I am not sure what you meant: we can't have a list of remote
config files to use anymore? That is sad... :-(

> >       support/test-pkg: cannonicalize paths early
> 
>  With the toolchain URLs gone, this is not relevant anymore.
> 
> >       support/test-pkg: create build dir from caller
> 
>  Took me a while to figure out what this patch was doing, so I'll reword the
> commit message.

Ah yes, sorry, the commit log is a bit terse... :-/

Please note that there is another patch on the series now:

    support/test-pkg: run legal-info

    https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/test-pkg&id=8a9fec1b939caad8ad282a94e6049c748eff5336

Regards,
Yann E. MORIN.

> 
>  Regards,
>  Arnout
> 
> >       support/test-pkg: run legal-info
> > 
> >  docs/manual/adding-packages-tips.txt |  91 +++++++++++++++++++++++++++++++
> >  support/scripts/test-pkg             | 101 +++++++++++++++++++++++------------
> >  2 files changed, 159 insertions(+), 33 deletions(-)
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
