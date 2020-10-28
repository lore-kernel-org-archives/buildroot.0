From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Oct 2020 18:56:01 +0100
Subject: [Buildroot] [PATCHv2] infra: add the transient download
 mechanism
In-Reply-To: <d0ecce82-e718-9309-ffb6-9cc93a317b79@mind.be>
References: <20200930173030.2461586-1-yann.morin.1998@free.fr>
 <20200930214530.6b964a45@windsurf.home>
 <20200930201303.GU11621@scaer>
 <d0ecce82-e718-9309-ffb6-9cc93a317b79@mind.be>
Message-ID: <20201028175601.GK2805@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2020-10-06 20:43 +0200, Arnout Vandecappelle spake thusly:
> On 30/09/2020 22:13, Yann E. MORIN wrote:
> > On 2020-09-30 21:45 +0200, Thomas Petazzoni spake thusly:
> >> On Wed, 30 Sep 2020 19:30:30 +0200
> >> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > [--SNIP--]
> >>> +  obvious being the *lack of reproducibility*. Besides, it has its own
> >>> +  pitfalls that one must be aware of as well:
> >>> +  ** when two builds are running in parallel on the same machine, there
> >>> +     is a TOCTOU race for each build to download and extract the archive,
> >>> +     so each build may not get what it downloaded, but what the other
> >>> +     build did download;
[--SNIP--]
> > But now consider the following scenario:
> >   - I push my branch, a pipeline is triggered;
>  Here your reasoning is wrong: this feature should *NOT* be used for triggering
> a build on push to some repo. For that use case, OVERRIDE_SRCDIR is much more
> suitable, because that *will* use the exact sources that correspond to the trigger.

But OVERRIDE_SRCDIR can *also* be used for the CI part, so why are we
even looking at this transient thing, then?

When transient is available, people are going to use it, even for cases
it was been designed for. And the use-case I describe is really one such
(un)expected scenario transient is made for.

>  What this feature is meant for is to do actual continuous integration, i.e.
> people are developing code in different repos, and a regularly triggered (or
> continuous) build brings all these repos together. It sounds insane to do
> something like that, but it is the way that some projects work [1].

Insane what people can come up with once they have some feature at hand!
;-)

But I am no longer interested in pushing this (mis)feature anyway.
Remember I am initially opposed to it to begin with...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
