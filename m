From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 11:14:02 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/libbluray: add optional
 support for libudfread
In-Reply-To: <27o5nhx5eu.ln2@ID-313208.user.individual.net>
References: <20210515070141.396977-1-bernd.kuhls@t-online.de>
 <20210515161529.GT2506__39571.1449951463$1621095355$gmane$org@scaer>
 <27o5nhx5eu.ln2@ID-313208.user.individual.net>
Message-ID: <20210516091402.GX2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-15 22:40 +0200, Bernd Kuhls spake thusly:
> Am Sat, 15 May 2021 18:15:29 +0200 schrieb Yann E. MORIN:
> 
> > Bernd, All,
> > 
> > On 2021-05-15 09:01 +0200, Bernd Kuhls spake thusly:
> >> Signed-off-by: Bernd Kuhls
> >> <bernd.kuhls@t-online.de>
> > 
> > In fact, this is fixing a hidden optional dependency, so I've applied to
> > master. Thanks!
> 
> Hi Yann,
> 
> this is a bad idea because libbluray-1.2.1 contains a bug detecting 
> libudfread so I sent the patch for the -next branch which contains the 
> bump to the fixed libbluray version 1.3.0.

Ah, I was afraid of that. But then, what guarantees, on master, that
libudfread is never built before libbluray?

> My original patch from February also contained a backported patch to fix 
> the problem for libbluray-1.2.1: http://patchwork.ozlabs.org/project/
> buildroot/patch/20210221172307.289368-1-bernd.kuhls at t-online.de/

Ah, yes, I remember that patch, now. OK, so the bug is that, even if
libudfread is present, libbluray will not find it, because it is not
looking for the correct name.

> So for the master branch, which is broken atm w.r.t. to the detection of 

In fact, it is not more broken than before: libbluray was never going to
detect libudfread becasue it is not looking for the correct name.

> udfread by libbluray, we have three choices:
> 
> - revert this commit

Right, I will do that, and apply it to next.

> - apply the full patch http://patchwork.ozlabs.org/project/buildroot/
> patch/20210221172307.289368-1-bernd.kuhls at t-online.de/
> - bump libbluray to 1.3.0

Thanks for the heads up! :-)

> Regards, Bernd
> 
> PS: @Yann:
> I did not sent this mail CC to you because all mails I try to send are 
> bouncing for years now:
> 
> <yann.morin.1998@free.fr>: host mx1.free.fr[212.27.48.7] said: 451 too 
> many
>     errors from your ip (194.25.134.83), please visit
>     http://postmaster.free.fr/ (in reply to DATA command)

This error means just that: the MX server for free.fr has detected too
many errors from your IP (presumably someone at your ISP caused some
black list to include that IP...)

I have no lever on how free.fr or t-online manage their servers... :-/

Regards,
Yann E. MORIN.

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
