From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Aug 2015 00:05:27 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <87zj1dx0g0.fsf@dell.be.48ers.dk>
References: <20150823163653.3989f210@free-electrons.com>
 <20150823153737.GD3729@free.fr>
 <20150823205857.1625a64f@free-electrons.com>
 <55DB7994.8080509@mind.be> <87vbc3xgcq.fsf@dell.be.48ers.dk>
 <20150826170933.4501e3e8@free-electrons.com>
 <87bnduxe0t.fsf@dell.be.48ers.dk>
 <20150826193251.02c382a3@free-electrons.com>
 <20150826184747.GA1934@free.fr> <87zj1dx0g0.fsf@dell.be.48ers.dk>
Message-ID: <20150826220527.GB1934@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-08-26 22:24 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Yes, it's a pity we can't get the Qt non-free packages. But especially
>  > with Qt, they are such a critical piece of a project that I would not
>  > want we tell users hat we have such support in Buildroot. That would
>  > just be blatantly lying.
> 
>  > OTOH, *one* way to which I *may* agree is to add something like
> 
>  > In Build options ---> Advanced --->
> 
>  >     config UNSUPORTED_NON_PUBLIC_PACKAGES
>  >         bool "Show unsupported non-public packages"
>  >         help
>  >           Some packages do not have publicly accessible source
>  >           code, either require registration, manual download...
> 
>  >           Buildroot has recipes for building those packages, but
>  >           given that their sources ar enot freely available, there
>  >           is not guarantee they do work as expected, not even build
>  >           at all.
> 
>  >           Use at your own risk. Do not report problems to the
>  >           Buildroot developpers. Sending patches to fix them might
>  >           be accepted.
> 
> Another alternative is that somebody maintains a set of BR2_EXTERNAL
> packages for this kind of stuff. I'm not sure what the best solution is,
> perhaps this is something to discuss during the dev days?

Yes, that would be an option. We could provide those extra packages as a
br2-external tree.

But then, given the current state of br2-external, if a user wants to
use those packages, he can no longer provide his own br2-external tree.
Or he'd have to manage his customisations in branches in that tree,
which gets him back to square one, that is, not being able to manage
location customisations (local configs, local packages...) in a
completely separate tree.

*But* there is hope!

I do have a series that adds support for using multiple br2-external
trees at once. And your proposal above is just one more excuse for me
to push for that series to be applied!

My evil plan is coming to fruition! :-]

Muhahaha!
https://www.youtube.com/watch?v=ulEAMKhemx8

/me is adding these to the topics for the next DevDays.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
