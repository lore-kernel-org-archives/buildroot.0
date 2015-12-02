From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Dec 2015 23:36:31 +0100
Subject: [Buildroot] [PATCH 2/2 for 2015.11.x] package/gawk: do not use
 readeline ormpfr in host variant
In-Reply-To: <87r3j4eayb.fsf@dell.be.48ers.dk>
References: <cover.1449008170.git.yann.morin.1998@free.fr>
 <9cd7b6bdd9790d4105829b278c0e6acba9f103f3.1449008170.git.yann.morin.1998@free.fr>
 <20151201232249.57de6d15@free-electrons.com>
 <20151202221602.GK5773@free.fr> <87r3j4eayb.fsf@dell.be.48ers.dk>
Message-ID: <20151202223631.GL5773@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-12-02 23:34 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
> >> > -# We don't have a host-busybox
>  >> > +# We don't have a host-busybox, and we don't want to use mpfr
>  >> 
>  >> Is the comment really important, especially when it talks about mpfr
>  >> but not about readline ?
> 
>  > Or just append 'or readline' to the comment.
> 
> But we _DO_ have a host-readline?

Yes, but we do not need it for the our host-gawk (or glibc would have
been broken quite a long time ago). And since it is a host package, we
do not usually enable unneeded features.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
