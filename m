From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Jul 2020 21:01:04 +0200
Subject: [Buildroot] [PATCH 1/4 v4] package/dbus-broker: new package
In-Reply-To: <20200706173416.GK2273@scaer>
References: <cover.1593944605.git.yann.morin.1998@free.fr>
 <c3acda1646617e0642559d2586e2801961a665b5.1593944605.git.yann.morin.1998@free.fr>
 <CADYdroMfyP9rbtEWTOwoGnPe4qKES+f4=Sg7Zm6ZKkjPorzJ0A@mail.gmail.com>
 <20200706173416.GK2273@scaer>
Message-ID: <20200706190104.GL2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-06 19:34 +0200, Yann E. MORIN spake thusly:
> On 2020-07-06 01:21 +0200, Norbert Lange spake thusly:
> > Am So., 5. Juli 2020 um 12:23 Uhr schrieb Yann E. MORIN
> > <yann.morin.1998@free.fr>:
[--SNIP--]
> > > dbus-broker code does not have a provision, like the original dbus has,
> > > to specify the user to run as, and does not interpret the <user>
> > > directive in the system.conf file. Since running the bus daemon as root
> > > is not so safe, we create a systemd unit drop-in to complement the unit
> > > provided by the package and defione the user to run as.
> > I thought we both agreed last time that dbus-broker does read the config and
> > switch to the uid  (you did convince me of that ! ;) ) ? see [1]
> So I too was pretty much surprised by this, because that was indeed what
> I remembered. But the run time test did not work. Maybe it was too late
> in the night again, so I'll double check once more to be extra sure.

So thanks for having me double-and-triple check: this drop-in to specify
the user is not needed, indeed. I'll drop it in a followup respin.

Not sure what hapenned; probably late-at-night hacking is not good
anymore for me...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
