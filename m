From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Aug 2017 18:04:57 +0200
Subject: [Buildroot] [PATCHv2] fs/squashfs: honour the number of
 parallel jobs
In-Reply-To: <7f6220fd-6c9d-72a7-8364-d76b3065f18f@mind.be>
References: <20170806154102.24807-1-yann.morin.1998@free.fr>
 <CANn-YGRT2J1GuHu0efq6OhGCoJ9v0PyzmrcSRTfXkRoKyQkD-g@mail.gmail.com>
 <7f6220fd-6c9d-72a7-8364-d76b3065f18f@mind.be>
Message-ID: <20170808160457.GA3441@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-08-08 16:09 +0200, Arnout Vandecappelle spake thusly:
> On 07-08-17 16:33, Clayton Shotwell wrote:
> > Yann,
> > 
> > On Sun, Aug 6, 2017 at 10:41 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >>
> >> By default, mksquashfs uses all the CPUs available, like us with
> >> BR2_JLEVEL=0.
> > 
> > This ends up using the number of CPUs available plus 1. I tested this on my
> > machine and it worked. I do still see the extended attributes issue
> > that I posted
> > in https://bugs.busybox.net/show_bug.cgi?id=10141.
> > 
> >> However, by setting BR21_JLEVEL to non-zero, a user volutarily limits
> >> the number of jobbs allowed to run concurrently (for various reasons,
> >> like this is not a priority task on the machine; or like the
> >> autobuilders, to spread the load accross multiple runs without
> >> overloading the machine).
> >>
> >> So, propagate tthe parallelisn settings down to mksquashfs, to repect
> >> the user's will.
> >>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > 
> > Tested-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

Thanks!

>  Thanks. I'm not sure if I should apply this to next or to master. It doesn't
> really fix anything, so I'm inclined to put it in next...

Yes, next is good.

>  For the real mksquashfs issue, do we have a way to find out what goes wrong
> exactly? From what I've read, it's not even clear if it's mksquashfs or fakeroot
> that is at fault...

So, the first analysis points toward highly-parallel situations.

I'll do some experimentation...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
