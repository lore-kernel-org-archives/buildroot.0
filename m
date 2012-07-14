From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 Jul 2012 23:37:48 +0200
Subject: [Buildroot] Buildroot and top-level parallel make
In-Reply-To: <CA+wH297K1Fh6cgFaHo2dd=ihgujo_nMkyicJLnOvAm9jnonBcQ@mail.gmail.com>
References: <CA+wH296drhV6yie5+79Y38qLmo_5cE1=3qaOrw5jbyCJ5mEMog@mail.gmail.com>
 <CA+wH296VRn4UY+cLAZUPjcprVcuZY9AHNw5QsEscvJ0oSszunw@mail.gmail.com>
 <CA+wH297K1Fh6cgFaHo2dd=ihgujo_nMkyicJLnOvAm9jnonBcQ@mail.gmail.com>
Message-ID: <5001E6AC.2040501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/13/12 12:34, Alex Bradbury wrote:
> On 4 July 2012 13:20, Alex Bradbury<asb@asbradbury.org>  wrote:
>> >  On 28 June 2012 13:34, Alex Bradbury<asb@asbradbury.org>  wrote:
>>> >>  I was wondering what the outcome of experiments to allow top-level
>>> >>  parallelism were? What are the major barriers to allowing this? Is it
>>> >>  still something seen as feasible to add to buildroot, or is it looking
>>> >>  like it would add too much complexity?
>> >
>> >  Thomas, I was wondering if you'd been able to recall what issues your
>> >  initial experiments with top-level parallel make faced?
> I hate to be a pain...but ping?

  I guess Thomas doesn't remember :-)

  I believe the main problem is in the non-package targets, e.g.
target-generic-hostname.  They are just added to TARGETS without
further dependencies.  Same is true for the toolchain: it is just
prepended to TARGETS.

  Changing that requires careful thinking about how the TARGETS work,
and is not easy to verify because there are a lot of corner cases involved.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
