From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 09:20:41 +0100
Subject: [Buildroot] [RFC v2] linux: add fbtft kernel extension
In-Reply-To: <20141230232807.GD3928@free.fr>
References: <1419969494-9615-1-git-send-email-ps.report@gmx.net>
 <20141230223603.GC3928@free.fr> <20141230232807.GD3928@free.fr>
Message-ID: <20141231092041.2b7cfa41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 31 Dec 2014 00:28:07 +0100, Yann E. MORIN wrote:

> OK, so it seems it will not be possible to biuld it as an out-of-tree
> module, after all. DAmn, that's really, really bad... :-(
> 
> So, here's why: the code uses FB-related functions that are built from
> separate source files, most of them conditionalised to a Kconfig symbol.
> But those symbols are promptless, and can only be selected.
> 
> Thus, unless another frambuffer implementation is enabled, that selects
> them, they wonlt be enabled, and thus the corresponding source files
> will not be built, and the needed functions will not be in the Kernel
> (neither built-in, nor in a module).
> 
> Moreover, one of the symbol, CONFIG_FB_BACKLIGHT, can only be selected
> by PCI-dependent symbols (DRM stuff, like radeon or nouvea), or SuperH
> dependent symbols (for some SuperH framebuffers).
> 
> Almost all needed symbols can be selected by cheating, and selecting the
> virtual framebuffer, but that's not a real sane option. And we'd still
> miss two symbols anyway.

Hum, indeed, that is a very good reason why external modules cannot
work. Thanks for the analysis.

> The proper solution would be to patch the kernel to add a kind of
> "framebuffer library for external FB drivers" (a bit like we have in the
> "Library routines" sub-menu for CRC and a few other functions, that
> would select all the hidden knobs for helper functions, and build them
> (built-in or module), and send that patch upstream.

No the proper solution would be for those fbtft people to submit their
drivers to the upstream kernel. But of course, since those drivers are
developed by RasberryPi folks, they cannot play with the normal
open-source rules of contributing things upstream: they *have* to do
some utter crap and do everything in their own fork.

Sigh. RasberryPi is definitely the worst platform ever when it comes to
learning embedded Linux.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
