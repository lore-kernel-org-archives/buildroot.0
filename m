From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Dec 2015 21:44:16 +0100
Subject: [Buildroot] [PATCH] Handle defconfig as .config in .gitignore
 and distclean.
In-Reply-To: <CABbD_XAgJWoQ5R6-01Enp37CP18i6fNgj6oCRB7uxvrkY4TmRA@mail.gmail.com>
References: <555c49ac.0a64b40a.3499.ffffb3f0@mx.google.com>
 <530190200.250863.1432112666116.JavaMail.root@openwide.fr>
 <CABbD_XAgJWoQ5R6-01Enp37CP18i6fNgj6oCRB7uxvrkY4TmRA@mail.gmail.com>
Message-ID: <20151227204416.GK3483@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

K?roly, All,

I'm trying to review the oldest patches still pending, and here's it's
the turn of your patch. ;-)

On 2015-05-20 13:13 +0200, K?roly Kasza spake thusly:
> people are told to work with a clone of buildroot and adding defconfig
> >  to gitignore means that ther is a high chance of not adding it to git
> > and loosing it...
> 
> You are right in this context, but .config is also in .gitignore, which
> also shouldn't be there if a custom repo is used.
> I think .gitignore should be tuned to the git repo currently used -
> buildroot's own repo in the vanilla BR case.

Unlike Jeremy, I'm perfectly fine with defconfig in .gitignore. It's the
distclean part I'm more concerned with.

On the one hand, it does make sense to remove it like we do remove
.config. After all, the user is king, and if he wants to remove
everything, why should we keep it? ;-)

On the other hand, I would see defconfig as really the quintessence of
the configuration, which the user explicitly saved. They could get quite
surprised if we now remove that file.

So, I'm a bit skeptical either way: keep it or remove it, I am unsure.
Let's lean toward the safe side, and ket's just keep it, for users that
were used to that behaviour, OK?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
