From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 6 Oct 2014 20:11:09 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-05
In-Reply-To: <CANQCQpaPvCgGzzukyUAASZqO9-d28Q7UwUemsjvc9xtJ5TTeKg@mail.gmail.com>
References: <20141006063013.D7B26101723@stock.ovh.net>
 <20141006094333.211d8a76@free-electrons.com>
 <CANQCQpYH7XGPbR_p2-wZqrhLMu_-GyR0HBqiwEEtgK9GX60QVg@mail.gmail.com>
 <20141006214408.2af48bbb@free-electrons.com>
 <CANQCQpaPvCgGzzukyUAASZqO9-d28Q7UwUemsjvc9xtJ5TTeKg@mail.gmail.com>
Message-ID: <1412626268.2656.6.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,


On Mon, 2014-10-06 at 14:47 -0500, Matthew Weber wrote:
> Thomas, Gustoavo,

> They actually cleaned up the library and now default to the GCC
> provided generics.  So in the case of PPC it doesn't even need a
> definition in this file.  However.....  These powerpc builds use a gcc
> 4.5 compiler which doesn't provide the generic atomicops
> implementation which is only exposed if GCC >= 4.7.  I looked at the
> BR2_ARCH_HAS_ATOMICS option as a possible dependency
> to fix this but it seems like that option is always set if the ARCH
> supports it.  Not necessarily based on if a toolchain provides a
> generic.  Thoughts?

Well it's not necessary hard-coded for particular arches.
For example on ARC
http://git.buildroot.net/buildroot/tree/arch/Config.in.arc we have an
ability to select if toolchain will be built with atomics enabled or
not. And then according to this selection BR2_ARCH_HAS_ATOMICS will be
used for filtering packages that require atomics.

Still this topic of atomics requires more love and discussions to
follow.

-Alexey
