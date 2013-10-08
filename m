From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Oct 2013 00:38:38 +0200
Subject: [Buildroot] [PATCH 06/11] package/weston: fix configure.ac to
 check for wayland-scanner
In-Reply-To: <20131009002525.63b72619@skate>
References: <cover.1381269937.git.yann.morin.1998@free.fr>
 <301b21c6f968c2964560af77536057f6c90ebc95.1381269937.git.yann.morin.1998@free.fr>
 <20131009001515.0358a990@skate> <20131008222318.GE3373@free.fr>
 <20131009002525.63b72619@skate>
Message-ID: <20131008223838.GF3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-10-09 00:25 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Wed, 9 Oct 2013 00:23:18 +0200, Yann E. MORIN wrote:
> 
> > > Huh? wayland.mk does build wayland-scanner with the native compiler
> > > before starting the build itself. It doesn't work anymore with 1.2.x ?
> > 
> > He! I did not even check... Yes, it does.
> > I basically did not expect wayland to build host tools.
> > 
> > I'll rework the series so wayland installs wayland-scanner to $(HOST),
> > and use that instead of host-wayland.
> 
> Well, using a host-wayland package is certainly an alternate approach.
> But at least at the time of wayland 1.1.x, building wayland-scanner
> manually was very easy, so I thought it was the best solution to just
> do it manually in wayland.mk. Should the build process of
> wayland-scanner become too complicated, having a host-wayland package
> would certainly be the appropriate solution.

As discussed on IRC, I'll go for the hand-crafted wayland-scanner
install.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
