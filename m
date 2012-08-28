From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Aug 2012 01:19:33 +0200
Subject: [Buildroot] [PATCH v2] barebox: fix license information
In-Reply-To: <20120828225431.791a7aec@skate>
References: <1346138387-4344-1-git-send-email-spdawson@gmail.com>
 <20120828144426.483cd251@skate> <503D0458.2020700@mind.be>
 <20120828225431.791a7aec@skate>
Message-ID: <503D5205.30306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/28/12 22:54, Thomas Petazzoni wrote:
> Le Tue, 28 Aug 2012 19:48:08 +0200,
> Arnout Vandecappelle<arnout@mind.be>  a ?crit :
>
>>> Also, uboot.mk mentions that the license is GPLv2+, but the U-Boot
>>> COPYING file says:
>>>
>>>     U-Boot is Free Software.  It is copyrighted by Wolfgang Denk and
>>> many others who contributed code (see the actual source code for
>>> details).  You can redistribute U-Boot and/or modify it under the
>>> terms of version 2 of the GNU General Public License as published by
>>> the Free Software Foundation.  Most of it can also be distributed,
>>> at your option, under any later version of the GNU General Public
>>> License -- see individual files for exceptions.
>>>
>>> So I guess that formally speaking U-Boot is GPLv2 only, and not GPLv2+.
>>
>>    Given the large number of special cases we've encountered in the licensing
>> support, I propose that we require one or two Acks on all licensing patches.
>> And for new packages, the Acks should explicitly mention that it Acks the
>> license information.  Failing the Acks, it could still be committed with
>> a flag that it needs review, e.g. "GPLv2+ (needs review)".
>>
>>    I think for the legal-info, we should really be conservative. Now that it
>> exists, people will rely on it.  And if they rely on the wrong information,
>> they could be in trouble.
>
> Well, this means having to wait even more before being able to commit a
> new package, I'm not sure I like to see more "bureaucracy" when it
> comes to getting patches applied. Instead, getting things in movement
> usually encourages people to react when something looks wrong. I.e, if
> I had left out the barebox and u-boot patches from Simon, maybe nobody
> would have commented on them... The fact that I took action by
> committing them got the discussion started, we fixed the problems, and
> we're good.

  That's why I say: commit it with (needs review).  That will attract more
reviews than having it either without legal-info, or with the wrong
legal-info.


>>    OTOH, the trouble would probably just be from your own legal department...
>> Copyright holders who create complex, inconsistent licenses are very
>> unlikely to try to enforce them.  And also the FSFE and similar organisations
>> will just go for the obvious GPL violations.  So maybe I'm just being
>> unnecessarily paranoid here...
>
> Just like we don't provide any guarantees of the proper functioning of
> Buildroot, we don't provide any guarantees of the correctness of the
> license information. Now, of course, it's up to us as a community to
> ensure that Buildroot works fine (it builds what you need) and has the
> most correct licensing information as possible, but we're not trying to
> provide 100% guarantees here.

  The difference is that buildroot users are likely to test the resulting
rootfs, but are very unlikely to look a second time at the output of
legal-info.  It's very difficult to "test" the legal-info - all you have
is "code review". For me, the wrong information in legal-info is an order
of magnitude worse than no legal-info at all.


  That said, none of my dozens of customers ever gave a whit about licenses.
The most they'd do is verify that there's no GPL linked against the app.
So after this post I'll shut up about it.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
