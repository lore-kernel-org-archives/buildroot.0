From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Jun 2014 19:57:45 +0200
Subject: [Buildroot] [PATCH v2 0/3] WIP: package/eudev: Split libudev
 and daemon
In-Reply-To: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140611175745.GD3472@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-11 19:41 +0200, Bernd Kuhls spake thusly:
> in order to support a growing number of packages[1] depending on libudev,
> even when /dev is not managed by systemd/eudev, it is necessary to
> provide libudev as a stand-alone solution for systems which have
> BR2_ROOTFS_DEVICE_CREATION_STATIC=y.
> 
> This patch series
> - bumps eudev to 1.7
> - integrates my older libudev package into eudev
> - fixes mesa3d build error

> Still to be discussed:
> - should we keep BR2_PACKAGE_HAS_UDEV which now means libudev, and
> - introduce BR2_PACKAGE_HAS_UDEV_DAEMON for packages needing the daemon, or
> 
> - introduce BR2_PACKAGE_HAS_LIBUDEV and switch many packages over to this option

Nope, the other way around.

We want to keep _HAS_UDEV to still mean "has a udev daemon", to support
legacy .config files.

We can introduce a new _HAS_LIBUDEV however.

And... I am working on this. I know you are present on IRC, but since
you do not seem to look at your IRC client (or it is not notifying you
when we ping you), it's difficult to synchronise with you.

As I said in my reply to your previous libudev patch:
  "I'll have a look at it tonight (UTC+2)." (which is basically "now").
  "I'll see what I can come up with."

Of course, we appreciate your new submission, hopefully it will make my
life easier. ;-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
