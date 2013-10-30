From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 30 Oct 2013 08:33:41 +0000
Subject: [Buildroot] State of AVR32 in Buildroot and improving it
In-Reply-To: <20131029202403.2f249f0d@skate>
References: <20131029202403.2f249f0d@skate>
Message-ID: <CAHt8ZCNptkphZ1nC8ui57kytN-_yqAdfdN6u2LrjBMq2=YxwUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

On 29 October 2013 19:24, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Do you think you could help in fixing some of the AVR32 autobuilder
> failures? Note that we don't necessarily want to fix all packages: if
> something is known broken on AVR32 and you don't need it or you're not
> interested in fixing it, we can just mark it as 'depends
> on !BR2_avr32', or another appropriate dependency (such as the gcc
> version, absence of TLS, or other).

Yes, I'm happy to help with this wherever I can. I still need the
avr32 support in Buildroot, unfortunately. Time is a little scarce at
the moment, but I'll try to have a look at some of the most
recent/frequent failures some time over the next week or so.

As I've said before on the mailing list, the internal toolchain
doesn't build a usable root filesystem for me any more. I'm building
my toolchain using a Buildroot forked before commit
8abb5b33c1aae035cf48b1c81104b433ff884c64, which removed support for
uClibc 0.9.31. I'm then using this as an external toolchain with an
up-to-date Buildroot to build my root filesystem.

I'd still like to see support for this older, but usable, toolchain
reinstated. I did submit a patch to kick this off some time ago, but
(quite understandably) there wasn't much enthusiasm for applying it.

> In order to achieve this, I'm proposing to send you a daily e-mail with
> only the AVR32 build failures. This is something we already do with the
> ARC and Blackfin architectures and that we would like to generalize to
> all the "specialized" architectures.

Okay, sounds like a good idea.

> Note that at the Buildroot meeting, one proposal was simply to get rid
> of AVR32 in the autobuilders, but the conclusion was that we do not
> like advertising an architecture as being supported if it's not
> actively tested by our autobuilders.

Yes, agreed.


Simon.
