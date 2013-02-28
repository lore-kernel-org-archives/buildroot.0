From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 16:21:57 +0100
Subject: [Buildroot] Help needed with cross-compiling libotr
In-Reply-To: <512F71F7.20409@petroprogram.com>
References: <512F71F7.20409@petroprogram.com>
Message-ID: <20130228162157.37abbe84@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Thu, 28 Feb 2013 17:04:23 +0200, Stefan Fr?berg wrote:

> I have been trying to cross-compile libotr package that makes it possible,
> with the help of pidgin-otr plugin, to send encrypted messages with
> Pidgin IM software
> (which I already have successfully cross-compiled for buildroot and plan
> to submit soon).

I'd like to state my feeling on this: I believe that packaging
desktop-level software like Pidgin or the Network-Manager Applet in
Buildroot is useless. I don't think Buildroot is appropriate to build a
full-blown desktop distro, and even though Stefan is doing good work
with all those packages, I fear that once Stefan's work is over, those
packages will bit rot.

Stefan, are you sure that Buildroot is appropriate for what you're
trying to achieve? Have you looked at something like Gentoo? It builds
from source like Buildroot, has a package management system, and
gazillions of desktop-level software already packaged. Since you're
targeting x86, you don't need cross-compilation, which would have been
the reason for using Buildroot in the first place.

And don't tell me you use Buildroot because of uClibc: when you're
doing a full-blown desktop environment, using glibc or uClibc doesn't
make *any* difference, be it from a size perspective or a performance
perspective.

What do others think about this?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
