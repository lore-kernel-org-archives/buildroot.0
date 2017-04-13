From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Apr 2017 15:29:58 +0200
Subject: [Buildroot] [PATCH 2/2] binutils: add patch for 2.27 that fixes
 elf2flt segfaults
In-Reply-To: <20170413093643.05ffb764@free-electrons.com>
References: <20170410084238.13201-1-arnout@mind.be>
 <20170410084238.13201-2-arnout@mind.be>
 <20170413093643.05ffb764@free-electrons.com>
Message-ID: <579cec15-214a-978c-85ca-1f471f104deb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-04-17 09:36, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 10 Apr 2017 10:42:38 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>>  .../2.27/0011-arm-thumb-fix-elf2flt-segfault.patch | 927 +++++++++++++++++++++
>>  1 file changed, 927 insertions(+)
>>  create mode 100644 package/binutils/2.27/0011-arm-thumb-fix-elf2flt-segfault.patch
> 
> Thanks a lot for doing the bisection! However, this is really a big
> patch. 

 Yes...

> Do we understand what it does? 

 I've tried, but... no. The great thing about this patch is that its purpose is
to add support for entering/exiting Secure Mode on ARMv8. So this really
shouldn't impact a Cortex-M4...

> Do we know if it is safe to
> backport it on 2.27 without other patches?

 Nope :-)

> Isn't there a more minimal fix for binutils 2.27?

 Possibly. Is someone here somewhat familiar with elf2flt? Waldemar?

 Neither the binutils nor the elf2flt code are very accessible... That's why I
started blindly bisecting.

 I could instead try to bisect 2.26..2.27 to find where the problem was
introduced, and perhaps find something that can be reverted.

 Alternatively, I could try to break up this patch in smaller pieces to find
which bit fixes it.

 But really I've given up trying to understand what is going on.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
