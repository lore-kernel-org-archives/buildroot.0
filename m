From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Oct 2013 00:23:18 +0200
Subject: [Buildroot] [PATCH 06/11] package/weston: fix configure.ac to
 check for wayland-scanner
In-Reply-To: <20131009001515.0358a990@skate>
References: <cover.1381269937.git.yann.morin.1998@free.fr>
 <301b21c6f968c2964560af77536057f6c90ebc95.1381269937.git.yann.morin.1998@free.fr>
 <20131009001515.0358a990@skate>
Message-ID: <20131008222318.GE3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-10-09 00:15 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Wed,  9 Oct 2013 00:09:52 +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > configure whines while checking for wayland-scanner.
> > 
> > wayland-scanner is used to generate the protocol parser C files from
> > the protocol definition XML files.
> > 
> > weston has a hard-dependency on wayland-scanner, so it can regenerate
> > its shell/mouse/keyboard/... "handlers".
> > 
> > Since we're using a tarball, those protocol files are already generated
> > and up-to-date, but the check is hard-coded and unconditional. If
> > wayland-scanner is missing, configure fails.
> > 
> > wayland-scanner is provided by wayland, so we'd have to have a
> > host-wayland if we want wayland scanner.
> > 
> > We could well patch away this check, but we'd have to carry and maintain
> > it probably for ever.
> > 
> > Better to fix it, and introduce a host-wayland. Make weston depend on
> > host-wayland. Add a patch from upstream weston to fix configure whining.
> 
> Huh? wayland.mk does build wayland-scanner with the native compiler
> before starting the build itself. It doesn't work anymore with 1.2.x ?

He! I did not even check... Yes, it does.
I basically did not expect wayland to build host tools.

I'll rework the series so wayland installs wayland-scanner to $(HOST),
and use that instead of host-wayland.

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
