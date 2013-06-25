From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jun 2013 00:01:10 +0200
Subject: [Buildroot] [Q] Buildroot vs uCLinux
In-Reply-To: <CALF0-+Wpm=JN0jOk8mu4QgaEvRvvbOw1mM4T6W8mYLMtSh2qSg@mail.gmail.com>
References: <CALF0-+Wpm=JN0jOk8mu4QgaEvRvvbOw1mM4T6W8mYLMtSh2qSg@mail.gmail.com>
Message-ID: <20130626000110.0bbb80cc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Mon, 24 Jun 2013 14:57:08 -0300, Ezequiel Garcia wrote:

> I'm working on a project where the customer has decided to use uCLinux
> as the base distribution on a MMU platform.

On a platform that has a MMU? Using uClinux-dist doesn't seem like a
very wise choice in this case. Which CPU architecture is this platform
using?

> Can anyone give me any insights on what would be the differences between
> this choice, and choosing buildroot instead?
> 
> AFAIK, they're both source-oriented, uclibc-based distributions.

Buildroot is not limited to uClibc. It can use glibc or eglibc
toolchains just fine, and build systems with those C libraries.

> uCLinux seems more
> biased towards MMU-less platforms, but since this is not the case, I'd
> like to know
> if there's something I'm missing, before I suggest my customer to try
> Buildroot instead.

As Stephan mentions, uClinux-dist stores the complete source tree of
most packages directly in the uClinux-dist code base, which makes it
quite huge. Buildroot instead always downloads the upstream tarball or
Git repository, and only stores in its source tree a few patches for
some packages, when needed to make them cross-compile properly. I
believe this, by itself, already makes Buildroot a bit more convenient
to use.

Being on the uclinux-dist-dev and uclinux-dev mailing list since about 3
years or so, I can also say that the amount of e-mails about
uClinux-dist is very very low, almost inexistent. Maybe those are no
longer the right mailing lists for uClinux-dist development, I'm not
sure. There is some regular traffic on those lists, but it's only about
Linux kernel support for non-MMU architectures, not the uClinux-dist
build system.

There are apparently some not too old releases of uClinux-dist (october
2012), but I'm not sure where the development is happening since the
CVS repository reference on the project web site seems to contain only
very old stuff.

I believe that one good indication is that Analog Devices was using
uClinux-dist as the build system offered to their Blackfin customers,
and last year, they have switched to use Buildroot instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
