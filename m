From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jul 2014 15:04:21 +0200
Subject: [Buildroot] [PATCH 20/20 v3] package/xserver_xorg-server: needs
 libudev, not a udev daemon
In-Reply-To: <20140727143111.7f5091a0@free-electrons.com>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
 <7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.1998@free.fr>
 <XnsA3777C2F4BB23berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20140727143111.7f5091a0@free-electrons.com>
Message-ID: <20140727130421.GC3895@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-27 14:31 +0200, Thomas Petazzoni spake thusly:
> On Sun, 27 Jul 2014 12:12:29 +0200, Bernd Kuhls wrote:
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> > news:7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.199
> > 8 at free.fr:
> > 
> > > xserver_xorg-server is happy enough with just a libudev, and does
> > > not require a udev daemon.
> > 
> 
> > although it is true that xserver_xorg-server compiles with libudev alone it 
> > segfaults at runtime when checking for video hardware without udev daemon:
> 
> That's the kind of thing that worries me about the idea of allowing
> only libudev to be installed without the udev daemon running. I believe
> libudev and the udev daemon are meant to be used together, and we're
> likely to fall into various issues by allowing libudev to be installed
> separately from the udev daemon.

Well, I was a bit overzealous when converting the xserver_xorg-server
package, on purpose. I wanted to stirr some questionning about it.

Ditto for other packages in the series.

The reasonning was: if we do not switch them over to using libudev and
we would never switch those packages. On the other hand, if we switch
all packages to use libudev (except those we know require udev), then
users will report breakage, and we can revert back.

So, I should not switch this package to use libudev, now we have a
report it is broken. I'll remove it from the series.

But, as Bernd stated, there *are* packages that work very well with kust
libudev and no udev daemon. And in some cases, an udev daemon may not be
wanted (for different reasons.) So we must be able to just provide
libudev if at all possible.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
