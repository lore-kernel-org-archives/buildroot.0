From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Aug 2012 19:48:08 +0200
Subject: [Buildroot] [PATCH v2] barebox: fix license information
In-Reply-To: <20120828144426.483cd251@skate>
References: <1346138387-4344-1-git-send-email-spdawson@gmail.com>
 <20120828144426.483cd251@skate>
Message-ID: <503D0458.2020700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/28/12 14:44, Thomas Petazzoni wrote:
> Le Tue, 28 Aug 2012 08:19:47 +0100,
> spdawson at gmail.com a ?crit :
>
>> +BAREBOX_LICENSE = GPLv2 with exceptions
>>   BAREBOX_LICENSE_FILES = COPYING
>
> U-Boot has a similar exception, so shouldn't we be doing the same?
>
> Also, uboot.mk mentions that the license is GPLv2+, but the U-Boot
> COPYING file says:
>
>    U-Boot is Free Software.  It is copyrighted by Wolfgang Denk and
> many others who contributed code (see the actual source code for
> details).  You can redistribute U-Boot and/or modify it under the
> terms of version 2 of the GNU General Public License as published by
> the Free Software Foundation.  Most of it can also be distributed,
> at your option, under any later version of the GNU General Public
> License -- see individual files for exceptions.
>
> So I guess that formally speaking U-Boot is GPLv2 only, and not GPLv2+.

  Given the large number of special cases we've encountered in the licensing
support, I propose that we require one or two Acks on all licensing patches.
And for new packages, the Acks should explicitly mention that it Acks the
license information.  Failing the Acks, it could still be committed with
a flag that it needs review, e.g. "GPLv2+ (needs review)".

  I think for the legal-info, we should really be conservative. Now that it
exists, people will rely on it.  And if they rely on the wrong information,
they could be in trouble.

  OTOH, the trouble would probably just be from your own legal department...
Copyright holders who create complex, inconsistent licenses are very
unlikely to try to enforce them.  And also the FSFE and similar organisations
will just go for the obvious GPL violations.  So maybe I'm just being
unnecessarily paranoid here...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
