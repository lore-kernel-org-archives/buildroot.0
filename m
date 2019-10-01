From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Oct 2019 19:45:39 +0200
Subject: [Buildroot] [PATCH] package/libkrb5: Bumb to 1.17
In-Reply-To: <07349c8a-b244-5039-78a9-83b3e73e74f1@mind.be>
References: <20190930113931.9654-1-nerv@dawncrow.de>
 <20190930221815.6d06ffcb@windsurf.home>
 <20190930202813.GA10860@scaer>
 <951ab4ba-69ba-bd1c-d324-f110f8dd94ac@mind.be>
 <20191001153319.GB10860@scaer>
 <07349c8a-b244-5039-78a9-83b3e73e74f1@mind.be>
Message-ID: <20191001174539.GC10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-10-01 17:41 +0200, Arnout Vandecappelle spake thusly:
> On 01/10/2019 17:33, Yann E. MORIN wrote:
> > On 2019-10-01 00:13 +0200, Arnout Vandecappelle spake thusly:
> >> On 30/09/2019 22:28, Yann E. MORIN wrote:
> >>>     LIBKRB5_LICENSE = Kerberos license
> >>> and be done with it. Let the user sort the mess on their side...
> >>  IMO it's not *that* difficult to be complete. Licensecheck reports the
> >> following (after pruning a bunch of irrelevant or wrong hits):
> > But how exactly did you conclude those bits are irrelevant or wrong?
> > That's an issue I think, that we inject our own interpretation of the
> > licenses list and conclude of a resulting state.
>  Because it's what we do for all other packages? All autotools packages have a
> GPL config.guess script, but we never mention it. For many packages we don't
> include documentation because it doesn't get built/installed. Etc.
> 
>  If we don't want to do that, we should remove _LICENSE entirely.

Sorry, but we should not be making any claim that _LICENSE variables are in
any way correct or exhaustive. In my opinion, they are set to the best of
our knowledge, but they are not any legal advice.

I do recognise that it should be safe to remove information from the build
files, from the docs, and the likes. It should also be safe to just list
the licenses explicitly listed in the package's own legal info (here,
the file named 'NOTICE', sometimes 'COPYING', or the likes), or in
individual source files.

People that want to make use of the output of 'legal-info' should
carefully review that information, and in case of any ambiguity, consult
with their own legal advisor.

Now, back to this libkrb5 license mess..

As a basis for this analysis (which is not legal advice), let's start
from the README file, which prominently states:

    Copyright (C) 1985-2019 by the Massachusetts Institute of Technology
    and its contributors.  All rights reserved.

    Please see the file named NOTICE for additional notices.

And thus, the NOTICE file contains a long list of various licenses. Some
are easily recognisable, other much less so.

For example, the first identified license looks like a BSD-2-Clause,
with copyright holders the Massachusetts Institute of Technology.

However, it is difficult to identify whether the following blurb is part
of the license text or not:

    Downloading of this software may constitute an export of cryptographic
    software from the United States of America that is subject to the
    United States Export Administration Regulations (EAR), 15 CFR 730-774.
    Additional laws or regulations may apply.  It is the responsibility of
    the person or entity contemplating export to comply with all
    applicable export laws and regulations, including obtaining any
    required license from the U.S. government.

    The U.S. government prohibits export of encryption source code to
    certain countries and individuals, including, but not limited to, the
    countries of Cuba, Iran, North Korea, Sudan, Syria, and residents and
    nationals of those countries.

So, if you happen to live in one of those countries, it would look like
you in fact need an additional license grant from the US government, that
the BSD-2-Clause listed above does not provide.

Now, a bit further down that file, we can see:

    Portions contributed by Matt Crawford "crawdad at fnal.gov" were work
    performed at Fermi National Accelerator Laboratory, which is
    operated by Universities Research Association, Inc., under contract
    DE-AC02-76CHO3000 with the U.S. Department of Energy.

This was part of a contract with the US government (DOE), so I suppose
that the contributions by Matt Crawford are thus in the Public Domain.

And then, what about the copyright claims for src/lib/crypto/builtin/aes,
which do not look like a license I could recognise (although it looks
like a simplified BSD-3-Clause, but I'm not so sure)?

And on and on...

So this is a typical case where the situation is hairy enough that we
should not try to interpret it, IMVHO, and let the user consult with
their legal counsel.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
