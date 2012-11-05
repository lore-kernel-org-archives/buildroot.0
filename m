From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 05 Nov 2012 08:43:00 +0100
Subject: [Buildroot] [PATCH 1/2] Add missing dependency to netatalk
In-Reply-To: <20121105075550.41dbed52@skate>
References: <1352057123-7137-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20121105075550.41dbed52@skate>
Message-ID: <50976E04.4060009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/12 07:55, Thomas Petazzoni wrote:
> Dear Maxime Hadjinlian,
>
> On Sun,  4 Nov 2012 20:25:22 +0100, Maxime Hadjinlian wrote:
>
>> -NETATALK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
>> +NETATALK_DEPENDENCIES = host-pkg-config openssl berkeleydb libgcrypt libgpg-error
>
> host-pkg-config should now be host-pkgconf.
>
> Peter, Arnout, shouldn't we be adding a dummy 'host-pkg-config' target
> in order to avoid breaking all external packages that are using
> host-pkg-config? Didn't we talk about not breaking APIs? :-)

  Seems like a good idea.

  But I would make it issue an error, so people update their .mk files.

  Maybe we can create a top-level Makefile.legacy and Config.in.legacy that
collects all the API-compatibility-warnings-and-errors.  That makes it easier
to remove them later.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
