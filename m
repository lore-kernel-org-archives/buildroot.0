From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 08 Nov 2012 12:05:59 +0100
Subject: [Buildroot] [PATCH v2] package: add bcusdk
In-Reply-To: <509B8EF7.9090809@calao-systems.com>
References: <1352192728-4816-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352192728-4816-2-git-send-email-gregory.hermant@calao-systems.com>
 <509B6EA8.3090605@mind.be> <509B8EF7.9090809@calao-systems.com>
Message-ID: <509B9217.5040107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/08/12 11:52, Gr?gory Hermant wrote:
>>> >>  +    select BR2_PACKAGE_LIBPTHSEM
>> >
>> >    ... and the architecture dependencies of libpthsem...
> Could you please enlighten me on this point ?

  As I wrote in the review of libpthsem, pth doesn't work on a number
of the architectures we support.  Since libpthsem is a fork of pth,
it's likely that it doesn't work in libpthsem either.  Therefore, it
is likely that libpthsem requires some
depends on !BR2_microblaze && !BR2_...
which have to be inherited by the packages that select libpthsem.

  (Thomas Petazzoni reported that pth doesn't work on arm-glibc, for
instance...).

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
