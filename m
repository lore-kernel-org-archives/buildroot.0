From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Nov 2013 09:10:50 +0100
Subject: [Buildroot] Make Acked/Reviewd/Tested-by tags visible
In-Reply-To: <20131112075831.5d00efd8@skate>
References: <20131111215435.GC3510@free.fr> <52817846.2080301@ozlabs.org>
 <20131112075831.5d00efd8@skate>
Message-ID: <5281E28A.5080503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/13 07:58, Thomas Petazzoni wrote:
> Dear Jeremy Kerr,
>
> On Tue, 12 Nov 2013 08:37:26 +0800, Jeremy Kerr wrote:
>
>>> We would like to suggest that the web GUI and the pwclient CLI both
>>> display such tags besides each patch, a bit like (hypotetical output of
>>> pwclient):
>>>
>>>      ID     Tags State       Subject
>>>      123456 ART  New         Wonderfull patch to apply quickly
>>
>> I've been looking to implement this for a while, but didn't have any
>> good ideas about how to present this in the UI. I love your proposal
>> here with the flags, it's simple and I think would work well for the
>> majority of cases.
>>
>>> Since patchwork already inserts those tags to the commit log (eg.
>>> pwclient view PATCH-ID), I hope it would be easy enough to also display
>>> it in the patch list.
>>
>> It's easy enough to pull these out of the comment at patch-display time,
>> but a little more tricky with list views (without some horrible SQL
>> joining). I'll work out a nice way to to this; I think it'll involve
>> applying these flags when the follow-up comment is parsed.
>>
>> Other projects have different policies for their tagging (some require 3
>> acks, for example), which will introduce a little complexity there too,
>> but that's not insurmountable either.
>
> Another thing that comes to mind is that not all Acked-by or Tested-by
> are equal, I believe. An Acked-by from a well-known long-time
> contributor will not be seen with the same level of trust that an
> Acked-by from an unknown newcomer. Do we want to add a mechanism of
> "rating"? But that would mean the project maintainer would have to
> "rate" developers, which is not nice. Or maybe just a list of e-mails
> that the project's maintainer considers as trustworthy, and only those
> ones would be taken into account when displaying the ART flags?
>
> Or maybe it doesn't matter too much, since in the vast majority of
> cases, only well-known long-time contributors are doing reviews/acks.

  I think the ART flags in the patch list should never be used blindly 
anyway. Instead, it's an indicator of which patches are interesting to 
look at in more detail. Right?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
