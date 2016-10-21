From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Oct 2016 10:57:28 +0200
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <20161021102556.10d9a5e6@free-electrons.com>
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
 <20161021102556.10d9a5e6@free-electrons.com>
Message-ID: <51578cf5-58ba-38ce-6fee-6535784bd150@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-10-16 10:25, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 20 Oct 2016 18:39:37 +0200, Arnout Vandecappelle wrote:
> 
>>  Turns out that it will be slightly more complicated than this. For MIPS, the
>> -mmsa option to enable SIMD processing MUST NOT be used in kernel and bootloader
>> builds. Therefore we cannot add it to TARGET_WRAPPER_CFLAGS. Instead, we'll have
>> a TARGET_EXTRA_CFLAGS that does not get added to the wrapper but does get added
>> to TARGET_CFLAGS and therefore passed to package buidls.
>>
>>  The kernel and bootloaders don't use TARGET_CFLAGS, so those are safe. Also, it
>> is possible to link libraries built with -mmsa with programs that are built
>> without that option, so even if build systems ignore TARGET_CFLAGS it should be OK.
> 
> That's a bit annoying because it then moves away from the idea "all
> architecture variant, ABI, floating point, etc. options are encoded in
> the wrapper", which was the key part of our discussion during the
> meeting.
> 
> However, I don't really see a good way around it.
> 
> That being said, what matters to me is that we improve the code to make
> it clear which flags go in the wrapper and which flags do not. Having a
> TARGET_WRAPPER_CFLAGS separate from TARGET_EXTRA_CFLAGS will make this
> very clear, which TARGET_CFLAGS being set to $(TARGET_WRAPPER_CFLAGS)
> $(TARGET_EXTRA_CFLAGS).

 +1 to the naming. Although I think I'll call it TARGET_FLAGS because we will
use them for LDFLAGS and CXXFLAGS and FCFLAGS as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
