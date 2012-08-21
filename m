From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Aug 2012 23:30:39 +0200
Subject: [Buildroot] [PATCH] libpng: bump version and add apng support
 (required by firefox)
In-Reply-To: <5024D8B5.2020605@petroprogram.com>
References: <50240DDE.4000901@petroprogram.com>
 <20120810090232.7ca6f885@skate> <5024D8B5.2020605@petroprogram.com>
Message-ID: <5033FDFF.7090704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/10/12 11:47, Stefan Fr?berg wrote:
> Good morning Thomas
>
> 10.8.2012 10:02, Thomas Petazzoni kirjoitti:

[snip]
>>   (3) Is this apng feature something that is being integrated in the
>>       upstream version of libpng? In Buildroot, we don't like carrying
>>       patches that add features to packages. Imagine we later want to
>>       bump libpng to version 1.5.10 or 1.5.11, we'd have to refresh the
>>       patch, which becomes complicated if we accumulate many large
>>       patches.
>
> That's a good guestion.
>
> I had to check from http://en.wikipedia.org/wiki/APNG
> and it says the following:
>
> "The PNG group officially rejected APNG as an official extension on
> April 20, 2007.[3]
> There have been several subsequent proposals for a simple animated
> graphics format based on PNG using several different approaches.[4]
>
> Mozilla Firefox added support for APNG in version 3 trunk builds on
> March 23, 2007.[5]
> However, because libpng is the PNG Group's reference implementation of
> the official specification,
> APNG support can never be supported in the main libpng distribution so
> long as it remains
> unratified by the Group. Iceweasel 3 now supports APNG by using
> Mozilla's unofficial variant of libpng."

  The most logical solution for me seems to be to add a libapng package
that uses the Mozilla code base.  Of course, that introduces the same
variants mess we have for expat/libxml2 and lua/luajit.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
