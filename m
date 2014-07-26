From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jul 2014 12:23:45 +0200
Subject: [Buildroot] tzdata when using a custom seleton
In-Reply-To: <CANxTyt6Kew54xGwwRxQnHaeZ-CH4-SbKoMgkwSMKytRX9Z-mmA@mail.gmail.com>
References: <CANxTyt6Kew54xGwwRxQnHaeZ-CH4-SbKoMgkwSMKytRX9Z-mmA@mail.gmail.com>
Message-ID: <20140726102345.GC3939@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2014-07-25 18:34 -0400, Danomi Manchego spake thusly:
> I recently started to update our buildroot at work from 2013.02 to
> 2014.05, and ran into a tzdata issue - still present with the latest
> today.  I am using a custom skeleton.  Previously, I was able to use
> the tzdata package to get time zone files into my rootfs.  It seems
> like I can't do that anymore because those options are shown only when
> using the default skeleton.
> 
> I think that this comes from commit
> d6a37917dde1293f6e25d87801283e098c22d580, "system: make the zoneinfo
> list a system option", when the timezone list moved from
> tzdata/Config.in to system/Config.in, changing names along the way.
> 
> Is it intentional that configurations using custom skeletons can no
> longer install time zone files?  Or is it just a side effect of where
> the moved settings are in system/Config.in?

When I did that, yes, that was intentional. My reasoning was that, if
the user provides his own skeleton, he's responsible for setting it up,
like the root password, getty config et al.

But what I overlooked at that time was the fact that the tz-providing
packages are ptrompt-less, and are enabled whenever the tz config needs
them.

So, when using a custom skeleton, the user has no way to enable those
packages, indeed.

I'll tackle this later today, unles you beat me to it. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
