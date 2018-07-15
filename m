From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jul 2018 21:58:06 +0200
Subject: [Buildroot] [PATCH v3 1/6] tini: new package
In-Reply-To: <CA+h8R2oxXWWnPT8dnn0Bt4UL=JA8SGjDg3vCyZNNchrPCaWJ+w@mail.gmail.com>
References: <20180715010732.21765-1-christian@paral.in>
 <20180715010732.21765-7-christian@paral.in>
 <20180715160129.GF2516@scaer>
 <CA+h8R2oxXWWnPT8dnn0Bt4UL=JA8SGjDg3vCyZNNchrPCaWJ+w@mail.gmail.com>
Message-ID: <20180715195806.GH2516@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2018-07-15 12:26 -0700, Christian Stewart spake thusly:
> Hi Yann,
> On Sun, Jul 15, 2018 at 9:01 AM Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
> 
>   Since you want to do a static build (which I questioned in my previous
>   reply), you should depend on static libs being actually available,
>   i.e.:
> 
>   ? ? depends on !BR2_SHARED_LIBS # Static build
> 
> I went over this with Thomas before the last time I tried to merge a similar series.
> Here are the relevant bits:
[--SNIP--]

Then why did you not add those explanation in the commit log, in this
new iteration?

Personally, I don't care about a commit log that says "hey, let's add a
new package". That is pretty much obvious from the diffstat itself.

What a commit log is here for, is to explain the tricky details of why a
specific technical solution is used, especially when it is not obvious
that it works, and more especially when it runs contrary to the usual
and common knowledge/wisdom.

Then, when we need to look back at the code in the (far!) future, and we
wonder "how on Earth can this even work to begin with?", we can git-blame
or git-log the file and see the corresponding commit and commit log, and
understand that litle detail. Because by then, the post on the mailing
list about a comment on the nth-previous iteration will be long
forgotten.

> Either way, this part of the series is not important. I'm happy to respin it with just the docker-cli and docker-engine split
> (caused originally by trying to upgrade docker-engine).

Yes, please do so: untangle the two and bump them, since this is not very
controversial.

But still, I'd like to understand why we need to have the host provide
an init to the guest, and why can't the guest be responsible for
providing its own init... Sorry if you already replied to that in
another thread... In which case those explanations would have been great
to be repeated in the commit log itself.

Thanks! :-)

Regards,
Yann E. MORIN.

> Best,
> Christian Stewart
> 
> Links:
> 1. mailto:yann.morin.1998 at free.fr

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
