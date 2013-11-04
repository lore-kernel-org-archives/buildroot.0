From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Nov 2013 07:40:27 +0100
Subject: [Buildroot] [PATCH] util-linux: disable fallocate for avr32
In-Reply-To: <20131103121711.4c67418f@skate>
References: <1383472585-1876-1-git-send-email-spdawson@gmail.com>
 <20131103113407.2b5cf76c@skate> <20131103110613.GB3615@free.fr>
 <20131103121711.4c67418f@skate>
Message-ID: <5277415B.10202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/13 12:17, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
>
> On Sun, 3 Nov 2013 12:06:13 +0100, Yann E. MORIN wrote:
>
[snip]
>> My preference would be to remove feature-patches, but that is really
>> gonna hurt newcomers (and may bite long-timers as well).
>
> I believe the only reasonable solutions are (alternatively, and the
> choice can be made differently per-package) :
>
>   (1) Add patches to the package to avoid usage of unimplemented uClibc
>       features (when possible)
>
>   (2) Mark the packages as depends on !UCLIBC

  If I may throw in yet another alternative: depend on a version of 
uClibc. We can call our patched uClibc version 0.9.34. At least, this 
still applies when there's a finally a uClibc release: we would then need 
a mechanism to mark a package to depend on the new uClibc.

  On second thought, this is probably still difficult to maintain and 
equally difficult for user to use a buildroot-generated toolchain as an 
external toolchain.

  Regards,
  Arnout

>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
