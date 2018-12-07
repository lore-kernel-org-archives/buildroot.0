From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Dec 2018 21:53:53 +0100
Subject: [Buildroot] Submodule granularity instead of LIB_GIT_SUBMODULES
In-Reply-To: <20181206083245.GC2561@scaer>
References: <ea-mime-5bfeb41d-7336-2fa4e677@www-6.netcourrier.com>
 <8f33142c-71ad-24c6-bad4-deea26f05ce6@mind.be>
 <20181206083245.GC2561@scaer>
Message-ID: <20181207205353.GK2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Louis-Paul, Arnout, All,

On 2018-12-06 09:32 +0100, Yann E. MORIN spake thusly:
> On 2018-12-03 17:40 +0100, Arnout Vandecappelle spake thusly:
> > On 28/11/2018 16:28, lpdev at cordier.org wrote:
> > > compilation. I was wondering if there is a way to specify _GIT_SUBMODULES to no,
> > > but still get the submodule1, without breaking buildroot's download philosophy.
> >  No, there's no simple way to do that. And adding the infrastructure to do that
> > would lead us way too far.
> Actually, it would be rather easy, as 'git submodule init' accepts a
> list of paths to initialise (it has accepted that since submodules were
> introduced in 2007).
> See (totally untested):
>     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/git-submodules&id=6a4f7c504e04dfe8dd6d5f8540a6cbc81e3758ae
> Arnout, like you, I am not sure we would want such a feature. However,
> I don't have a strong opinion against it either, as it's pretty easy to
> do...

Well, I take that back. It is not easy, in fact.

My proposal only accounts for first-level submodules, and doers not
works for sub-submodules and below. Handling them would not be trivial.

So, I side with Arnout: we can't support that, as that would lead us way
too far, especially since our git wrapper is already complex...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
