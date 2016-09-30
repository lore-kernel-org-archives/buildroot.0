From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Oct 2016 00:51:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-09-28
In-Reply-To: <20160930112705.GQ1947@waldemar-brodkorb.de>
References: <20160929063048.6633A1049F9@stock.ovh.net>
 <20160930060433.GO1947@waldemar-brodkorb.de>
 <20160930084255.07d4833e@free-electrons.com>
 <20160930112705.GQ1947@waldemar-brodkorb.de>
Message-ID: <1483d15b-1aed-f8b8-fc43-7c810af6b44b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-09-16 13:27, Waldemar Brodkorb wrote:
> Hi Thomas,
> Thomas Petazzoni wrote,
> 
>> Hello,
>>
>> On Fri, 30 Sep 2016 08:04:33 +0200, Waldemar Brodkorb wrote:
>>
>>> Thomas Petazzoni wrote,
>>>
>>>>         m68k |                    nload-0.7.4 | NOK | http://autobuild.buildroot.net/results/b0d10b82f2308a92a8d6c8ac768c9efa2c1770b7  
>>>
>>> This should be fixed by the update to uClibc-ng 1.0.18.
>>> Tested here with the internal toolchain.
>>
>> OK. Should I rebuild just the m68k toolchains with uClibc-ng 1.0.18, or
>> are there potentially fixes or patches affecting other architectures as
>> well?
> 
> I would prefer rebuilding all uClibc-ng toolchains as we get then a
> good overview about the quality of the 1.0.18 release.
> Furthermore all static/no-thread builds for other architectures are
> affected by this release, a lot of issues regarding pthread_mutex_*
> should be resolved. (libarchive issues,..)
> 
> May be the linker script fix should be applied before that.
> I will sent the patch today.

 I think it would be wise to always update the toolchains when something changed
in the packages that generate them. That way they get maximum testing.

 That would also give an early warning when something is wrong with a bump: you
would have noticed the locale issue while building the toolchains, I think.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
