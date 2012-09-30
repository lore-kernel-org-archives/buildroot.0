From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Sep 2012 16:22:06 +0200
Subject: [Buildroot] [PATCH] pkg-infra: produce legal info for
 proprietary packages
In-Reply-To: <CAAXf6LVi1SKx9ZTDuROYxkP=r62fr=SpMnNxYc-Q=_bz+7Snsg@mail.gmail.com>
References: <20120928121758.GA2362@mail.sceen.net>
 <1348834801-2672-1-git-send-email-rbraun@sceen.net>
 <20120928142314.4810033e@skate>
 <CAAXf6LUF1bOSTGyMtC2OEbQSOeDiMphktpxtSZHmLj4ms9c+yQ@mail.gmail.com>
 <20120928190526.79db5cde@skate>
 <CAAXf6LVi1SKx9ZTDuROYxkP=r62fr=SpMnNxYc-Q=_bz+7Snsg@mail.gmail.com>
Message-ID: <5068558E.4070005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/09/12 20:52, Thomas De Schampheleire wrote:
>
> Op 28 sep. 2012 19:05 schreef "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com
> <mailto:thomas.petazzoni@free-electrons.com>> het volgende:
>>
>>  Thomas,
>>
>>  On Fri, 28 Sep 2012 18:40:04 +0200, Thomas De Schampheleire wrote:
>>
>>  > Additionally, it would be nice to get some context. Why do you need this?
>>  > What its the use case?
>>  >
>>  > The proprietary packages are not in the current legal info, precisely
>>  > because you wouldn't distribute them.
>>  > If you have a package that you distribute under a non open-source license,
>>  > I think it makes more sense to provide a real name to the license.
>>
>>  There are things like firmware, or DSP blobs or other stuff that are
>>  just provided in binary form, but their license allows free
>>  redistribution. Should we mark those as PROPRIETARY, or should we have
>>  a different license name for those?
>>
>>  Basically, the context is the intel-microcode package, which bundles a
>>  binary-only firmware for some Intel hardware. Which license
>>  informations should we attach to it?
>
> I think we need a specific category for those packages that are not intended for distribution. That is, when you
> generate the legal info, these packages are not included.
>
> Next to that, I can understand that there is another category of 'packages' that may be proprietary, but are intended
> for redistribution. I think we should keep this separate.

  Agreed.

> Now, whether we use the name 'proprietary' for the first or second category is an open question.

  The word "proprietary" implies that it's not for redistribution. [1]
Something like 'Intel microcode license' would be appropriate however.

  Two packages should only use the same license name if they have the same
terms of use and redistribution (although the exact wording or the exact
conditions may be different, cfr. various BSD-3c versions or exceptions in
GPLv2 licenses).

  If we want to make it explicit that this is not an open source package, we
could make it 'Intel microcode license (non-free)'.

  Regards,
  Arnout

[1] http://en.wiktionary.org/wiki/proprietary


> I'm not familiar with the microcode example that you give. I assume that they have some kind of legal text associated
> with them? Can we really assume that two such proprietary packages from different vendors have the exact same
> redistribution conditions? My gut says no, in which case there'd be a separate term for each variant. In Gentoo Linux
> there it's such a mechanism. In order to install a given package, you have to agree to the specific license, e.g. an
> Adobe Flash one.

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
