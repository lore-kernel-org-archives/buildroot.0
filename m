From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 00:15:15 +0200
Subject: [Buildroot] [PATCH 06/11] package/weston: fix configure.ac to
 check for wayland-scanner
In-Reply-To: <301b21c6f968c2964560af77536057f6c90ebc95.1381269937.git.yann.morin.1998@free.fr>
References: <cover.1381269937.git.yann.morin.1998@free.fr>
 <301b21c6f968c2964560af77536057f6c90ebc95.1381269937.git.yann.morin.1998@free.fr>
Message-ID: <20131009001515.0358a990@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  9 Oct 2013 00:09:52 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> configure whines while checking for wayland-scanner.
> 
> wayland-scanner is used to generate the protocol parser C files from
> the protocol definition XML files.
> 
> weston has a hard-dependency on wayland-scanner, so it can regenerate
> its shell/mouse/keyboard/... "handlers".
> 
> Since we're using a tarball, those protocol files are already generated
> and up-to-date, but the check is hard-coded and unconditional. If
> wayland-scanner is missing, configure fails.
> 
> wayland-scanner is provided by wayland, so we'd have to have a
> host-wayland if we want wayland scanner.
> 
> We could well patch away this check, but we'd have to carry and maintain
> it probably for ever.
> 
> Better to fix it, and introduce a host-wayland. Make weston depend on
> host-wayland. Add a patch from upstream weston to fix configure whining.

Huh? wayland.mk does build wayland-scanner with the native compiler
before starting the build itself. It doesn't work anymore with 1.2.x ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
