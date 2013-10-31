From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Oct 2013 08:45:04 +0100
Subject: [Buildroot] Fwd:  ubuntu 13.10 prerequisites
In-Reply-To: <CALdGskJvKLuV_uhq+pHBS8QgUydnOe6NuZ=0ao7=ANjJBMVH-A@mail.gmail.com>
References: <CALdGskJ6kQnW2GrRxoojk5Og_sOwrm9bmCOVX2nk7bkFp-nadw@mail.gmail.com>
 <20131030221459.474bc3eb@skate>
 <CALdGskJMhqCFkORg5zRf7rVWnt6irH5me=2utHOptA+221-03Q@mail.gmail.com>
 <CALdGskJvKLuV_uhq+pHBS8QgUydnOe6NuZ=0ao7=ANjJBMVH-A@mail.gmail.com>
Message-ID: <20131031084504.07cc96e0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Thu, 31 Oct 2013 08:32:30 +0200, Olivier Schonken wrote:

> You are correct, only the libc:i386 is necessary to start a build. (If the
> 64-bit versions of gcc, binutils and g++ are installed)

Well, libc:i386 is only needed if you use a pre-built external
toolchain, or some other pre-built tool. Otherwise, it shouldn't be
needed at all.

Moreover, for the specific case of pre-built external toolchain,
Buildroot does a check before starting the build, and if the 32 bits C
library (libc:i386) is not installed, it aborts with an error message.

It would be good to know if the problem you had was related to
pre-built external toolchains, or to some other thing.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
