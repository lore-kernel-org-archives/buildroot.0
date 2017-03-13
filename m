From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Mar 2017 17:33:06 +0100
Subject: [Buildroot] [PATCH] fakeroot: bump version to 1.21-2
In-Reply-To: <216f6108-da26-92cc-8177-07117d20092c@andin.de>
References: <20161004115320.647-1-maxime.hadjinlian@gmail.com>
 <20161004163555.7c8af28f@free-electrons.com>
 <CAGduivwqAtheOrr_J0XWXR-9rjWNwPC9Y0dFCqKyBua+bir0ww@mail.gmail.com>
 <d5b7097f-1af5-1130-21b2-fb3c1278a646@andin.de>
 <20170313133220.62892a21@free-electrons.com>
 <216f6108-da26-92cc-8177-07117d20092c@andin.de>
Message-ID: <20170313163306.GA3680@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2017-03-13 16:23 +0100, Andreas Naumann spake thusly:
> Am 13.03.2017 um 13:32 schrieb Thomas Petazzoni:
> >Hello,
> >
> >On Mon, 13 Mar 2017 11:43:49 +0100, Andreas Naumann wrote:
> >
> >>I have another reason to bump to 1.21, but experience the same
> >>difficulties in getting the configure step right. What would be a
> >>sensible way to avoid depending on autoconf/automake?
> >
> >Is your reason to depend on automake/autoconf still the same as what it
> >was in Maxime's patch?
> I think so, but in order test it I used FAKEROOT_AUTORECONF instead of
> running the bootstrap script. However, that does create the same dependency
> on automake/autoconf right?

I had a look at the diff between 1.20.2 (which we have right now) and
1.21, and the only noticeable delta is the change of a bufgfer size in
mesage.h, the rest of the delta being the removal of the generated
autostuff.

So we can quite safely backport that single change.

I'll send a patch in a moment.

Regards,
Yann E. MORIN.

>  If so, then we can patch Makefile.in instead of
> >Makefile.am. We normally don't like that very much, but I personally
> >prefer this solution over having fakeroot depending on
> >automake/autoconf.
> There is no Makefile.in, only .am and a configure.ac. Wouldnt a patch need
> to add configure + the contents of build-aux as well? Can you point out a
> package that I can use as an example?
> 
> 
> regards,
> Andreas
> 
> 
> >
> >Best regards,
> >
> >Thomas
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
