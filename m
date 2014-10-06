From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 6 Oct 2014 15:20:45 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-05
In-Reply-To: <1412626268.2656.6.camel@abrodkin-8560l.internal.synopsys.com>
References: <20141006063013.D7B26101723@stock.ovh.net>
 <20141006094333.211d8a76@free-electrons.com>
 <CANQCQpYH7XGPbR_p2-wZqrhLMu_-GyR0HBqiwEEtgK9GX60QVg@mail.gmail.com>
 <20141006214408.2af48bbb@free-electrons.com>
 <CANQCQpaPvCgGzzukyUAASZqO9-d28Q7UwUemsjvc9xtJ5TTeKg@mail.gmail.com>
 <1412626268.2656.6.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <CANQCQpYo55QJoGPNcg7ZfEq5O+9qQO9f-G5wocD+NDDj=HuBRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Mon, Oct 6, 2014 at 3:11 PM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> Hi Matthew,
>
>
> On Mon, 2014-10-06 at 14:47 -0500, Matthew Weber wrote:
>> Thomas, Gustoavo,
>
>> They actually cleaned up the library and now default to the GCC
>> provided generics.  So in the case of PPC it doesn't even need a
>> definition in this file.  However.....  These powerpc builds use a gcc
>> 4.5 compiler which doesn't provide the generic atomicops
>> implementation which is only exposed if GCC >= 4.7.  I looked at the
>> BR2_ARCH_HAS_ATOMICS option as a possible dependency
>> to fix this but it seems like that option is always set if the ARCH
>> supports it.  Not necessarily based on if a toolchain provides a
>> generic.  Thoughts?
>
> Well it's not necessary hard-coded for particular arches.
> For example on ARC
> http://git.buildroot.net/buildroot/tree/arch/Config.in.arc we have an
> ability to select if toolchain will be built with atomics enabled or
> not. And then according to this selection BR2_ARCH_HAS_ATOMICS will be
> used for filtering packages that require atomics.
>
> Still this topic of atomics requires more love and discussions to
> follow.
>
> -Alexey

Ok, good point. I wonder if it's something that could be set by
default during the toolchain detection based on GCC >= 4.7 and
existence of atomicops.h?

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
