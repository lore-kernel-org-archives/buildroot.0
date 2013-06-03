From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Jun 2013 22:15:05 +0200
Subject: [Buildroot] EGL Confusion
In-Reply-To: <CALo-6+g+z8xV9bnzbF6MAB0VUEzO-mkYocHvVM=GziSmyFAk5A@mail.gmail.com>
References: <CALo-6+g+z8xV9bnzbF6MAB0VUEzO-mkYocHvVM=GziSmyFAk5A@mail.gmail.com>
Message-ID: <20130603201505.GB3439@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

On 2013-06-03 13:05 -0700, Charles Krinke spake thusly:
> Either my understanding of buildroot is incomplete (most likely) or
> buildroot is incomplete (least likely), but in either case, I would
> appreciate a bit of advice.
> 
> I am moving a TI AM3517 design from last springs buildroot to the
> lastest buildroot in order to go from Qt-4.8.2 to Qt-5.0.2 and I can
> build a reasonable rootfs unless I try to configure QtDeclarative
> which is grayed out.
> 
> In looking into why it is grayed out, it seems to have to do with
> BR2_PACKAGE_HAS_OPENGL_EGL which is also grayed out as I am not on a
> Raspberry Pi.
> 
> My need is to reference the external EGL supplied by TI in their
> Graphics_SDK and I was hoping that we have a way to get from here to
> there and would appreciate any advice on the path with the least
> problems.
> http://lists.busybox.net/mailman/listinfo/buildroot

You'd have to package the TI stuff, and that package would select the
BR2_PACKAGE_HAS_OPENGL_EGL option, like the packages rpi-userland and
freescale-imx/gpu-viv-bin-mx6q do.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
