From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Oct 2015 11:20:53 +0200
Subject: [Buildroot] Issues with the toolchain wrapper applied to the
 internal toolchain
In-Reply-To: <20151014105828.54391fb9@free-electrons.com>
References: <20151011120859.7e786a73@free-electrons.com>
 <561AC198.9070206@mind.be> <20151014105828.54391fb9@free-electrons.com>
Message-ID: <561E1E75.9000106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-10-15 10:58, Thomas Petazzoni wrote:
> Arnout,
> 
> On Sun, 11 Oct 2015 22:07:52 +0200, Arnout Vandecappelle wrote:
> 
>>  One solution for both issues would be to deal with buildroot-built toolchains
>> explicitly in the toolchain wrapper, i.e. detect the existence of .real and exec
>> that one directly. Would that be an acceptable solution?
> 
> I think there are other situations where a .real file could exist, for
> example for FLAT toolchains, there is often a wrapper that will call
> elf2flt, and the real compiler is also called <something>.real, if I
> remember correctly.

 If that is the case, it will be an issue for the internal toolchain wrapper as
well, since it will just overwrite the .real...

 But of course, we don't have an internal toolchain for Blackfin anymore, so
I'll try to create an ARM FLAT toolchain and see how far I get...

> 
> So maybe we need to adjust this to .buildroot-real or something that is
> less likely to cause any sort of mis-detection?

 Doesn't look great but it would work.

 Another option is to move it to a subdirectory:
$(HOST_DIR)/usr/bin/toolchain-binaries or something like that.

 Regards,
 Arnout

> 
> Thomas
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
