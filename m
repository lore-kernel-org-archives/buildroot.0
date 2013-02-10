From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Feb 2013 10:50:18 +0100
Subject: [Buildroot] Buildroot at ELC: review/suggestions needed
In-Reply-To: <201302100047.23872.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 10 Feb 2013 00:47:23 +0100")
References: <20130209195709.323b9f5e@skate>
 <201302100047.23872.yann.morin.1998@free.fr>
Message-ID: <876220fqg5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 Yann> Besides, I've counted packages with:
 Yann>     $ grep -r -E -e '^[^[:space:]]+_VERSION[[:space:]]*:?='   \
 Yann>     | $(find package/ -type f -name '*.mk')                 \
 Yann>     | wc -l
 Yann>     944

I normally just count .mk files under package, which gives a pretty good
estimate:

find package -name \*.mk | wc -l
946


 Yann> Points for those slides (out-of-order, obviously):

Good points.

 Yann> ---8<---
 Yann>     Minimal network-enabled system:   [*]
 Yann>       ARM Raspberry Pi
 Yann>       Pre-built ct-ng toolchain
 Yann>       busybox + not-so-minimal kernel
 Yann>       Build time: 1 minute 55 seconds
 Yann>       Image size: 9.2 MiB (rootfs) + 1.8 MiB (kernel)

Why is the rootfs so big? Kernel modules / glibc? A default rootfs
(internal toolchain, busybox) is less than 1.5MB:

-rw-r--r-- 1 peko peko 1.4M Feb 10 09:49 output/images/rootfs.tar

Around half of that is busybox, other half is uClibc.

-- 
Bye, Peter Korsgaard
