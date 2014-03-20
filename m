From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Mar 2014 07:34:52 +0100
Subject: [Buildroot] Libtool 2.4.3 release
In-Reply-To: <092BD668-BD02-45AB-A97F-D61BCA752A0C@gnu.org>
References: <5329C7C2.4090307@essensium.com>
 <092BD668-BD02-45AB-A97F-D61BCA752A0C@gnu.org>
Message-ID: <532A8C0C.6040101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/03/14 06:07, Gary V. Vaughan wrote:
> 
> On Mar 20, 2014, at 5:37 AM, Arnout Vandecappelle
> <arnout.vandecappelle@essensium.com
> <mailto:arnout.vandecappelle@essensium.com>> wrote:
> 
>> [Please keep me in CC, I'm not on the list]
>>
>> Dear libtool maintainers,
>>
>> Is there a possibility for a new libtool release in the foreseeable future?
> 
> Hi Arnout,
> 
> Yes, absolutely. In fact there are only 2 things ahead of it on my TODO list:
> 
>   1. Figure out why a4ffcdb5e is a regression for test 57
>   2. fix test 120 race condition
> 
> Unfortunately, Libtool is a complex beast, and we are woefully
> undermanned here.

 Complex beast indeed... Which is another reason why we prefer not to
carry patches.

> While everything rests on my shoulders, it will be at least another month
> before I can start work (I'm in the process of emigrating and all that
> entails).
> 
> Patches for those 2 items, or any other as yet unknown issues with git
> master (or http://vaughan.pe/libtool/libtool-2.4.2.458.tar.gz if a
> bootstrapped tarball is easier to work with) are extremely welcome, and
> could lead to an immediate release...

 Unfortunately, none of the buildroot maintainers seem up to the
challenge of attacking ltmain...  We've had issues that are probably best
solved within libtool but where we resort to other workarounds to keep
things simple.

> 
> Most recent test logs here:
> 
>   http://vaughan.pe/libtool/libtool-2.4.2.458.logs/
> 
>> In buildroot, we build all autotools (including libtool) as part of the
>> cross-compilation process. We recently had to add a libtool patch for
>> MIPS n64 support, which is annoying because it means we have to re-run
>> automake etc. to update the autools-generated scripts in libtool.
> 
> Did you patch just config.guess/config.sub and pass that back upstream?
> That is a prerequisite for arriving in the next release.  Otherwise if
> you patched Libtool files, are your changes in upstream already?

 Yes, it's an upstream patch that we back-ported.

> 
>> However, our normal autotools support doesn't work because that creates a
>> circular dependency. So we have to add a few hacks in the libtool build
>> steps to make things work.
>>
>> A release of libtool would help a lot because then we don't need to
>> carry patches and we don't need to generate configure etc.
>>
>> Thank you,
>> Regards,
>> Arnout
>> -- 
>> Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
> 
> Cheers,
> -- 
> Gary V. Vaughan (gary AT gnu DOT org)

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
