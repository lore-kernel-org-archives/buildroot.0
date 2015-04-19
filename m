From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 19:03:21 +0200
Subject: [Buildroot] [PATCH v4 1/1] Added linux drivers backports project
In-Reply-To: <20150419162839.GI4313@free.fr>
References: <1429311670-7831-1-git-send-email-petr.vorel@gmail.com>
 <20150419110326.31c34542@free-electrons.com>
 <5533D5CF.5000305@mind.be> <20150419162839.GI4313@free.fr>
Message-ID: <20150419190321.19200e70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 19 Apr 2015 18:28:39 +0200, Yann E. MORIN wrote:

> Well, I would not be very happy with that, since that would make the
> following use-case a real pain:
> 
>     $ make foo_defconfig
>     $ make linux-menuconfig
> 
> Currently, all it needs is the linux kernel to be extracted and patched,
> and none of its depedencies to be built. Otherwise, it would require the
> toolchain to be built, plus a sh.tload of other stuff (lzo, for one, and
> all its own dependencies).

We could remove the mandatory host-lzo dependency from the linux
package, by adding an option for that. Remember the recent patches also
adding host-xz to the dependencies of linux, which I rejected?

This would leave host-kmod as the only dependency of the linux package
I believe. But well host-kmod as AUTORECONF = YES, so it pulls a whole
bunch of crap.

I agree that being able to do "make <foo>-menuconfig" without waiting
too long is really a great feature.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
