From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Aug 2014 13:33:47 +0200
Subject: [Buildroot] [PATCH 05/14 v4] package/eudev: split udev/libudev
In-Reply-To: <XnsA391CED782357berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <cover.1406765723.git.yann.morin.1998@free.fr>
 <e0bec013e8bb144c5208518c39011b1b47f63d17.1406765723.git.yann.morin.1998@free.fr>
 <XnsA391CED782357berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140824113347.GB3778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-22 20:20 +0200, Bernd Kuhls spake thusly:
> for eudev-1.10 one additional command is necessary to build libudev due to
> https://github.com/gentoo/eudev/commit/b1ac60946d1625e14029ea9b7fa3aa4c06e079
> 5f:
> 
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:e0bec013e8bb144c5208518c39011b1b47f63d17.1406765723.git.yann.morin.1998
> @free.fr:
> 
> > +define EUDEV_BUILD_CMDS
> 
> $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/shared
> 
> > +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/libudev
> > +endef

Not only that, but it requires linux/btrfs.h which means it needs to
depend on an _AT_LEAST_X_Y kernel headers version.

I'll tackle this.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
