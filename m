From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 20 Jan 2013 11:01:30 +0000
Subject: [Buildroot] [PATCH RFC] Fix avr32 build using internal toolchain
In-Reply-To: <20130119113852.6d35aa94@skate>
References: <1358460970-2081-1-git-send-email-spdawson@gmail.com>
 <20130119113852.6d35aa94@skate>
Message-ID: <CAHt8ZCOH9FgqzkB2KHJSSBc3k76-07iYNfsQ_rjzQCzOFGLEAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 19 January 2013 10:38, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Thanks. I don't remember, do you have a specific interest in the AVR32
> architecture support?

Yes, I'm using Buildroot for the continued development of a system
based on the Atmel ap7000. This system will be under
development/support for at least the next few years, I would imagine.

> The thing is that apparently, the AVR32 gcc version we're using (gcc
> 4.2.x) doesn't build anymore with recent host gcc version (I think
> Gustavo tested with gcc 4.6, and it doesn't build). Generally speaking,
> the fact that we have to use old, patched, versions of gcc, binutils and
> uClibc is severely problematic to support this architecture on the long
> run.

Yes, I understand that the avr32 toolchain is in a bit of a mess. I'm
using host gcc version 4.6 without problems; from memory, I think it's
4.7 that doesn't work --- I might have misremembered 'though...

> Back in November, I got in touch with the people who were active on the
> AVR32 architecture a few years back (Hans-Christian Egtvedt and H?vard
> Skinnemoen), but they no longer work for Atmel and therefore don't know
> what Atmel plans are regarding the AVR32 architecture.

Yes, I think we discussed this briefly at the Buildroot Developer Days
in Barcelona. My understanding is that avr32 is regarded
semi-officially as an end-of-life architecture. Atmel technical
support are, for the time being, still dealing with support queries
for avr32.

> Therefore, I'm wondering if we shouldn't mark this architecture as
> deprecated.

From my own perspective, I'd rather keep the avr32 support in
Buildroot for now. I don't know how many other people are using the
architecture --- not that many, I suspect. Would that be a major
problem?

I don't know how much effort would be involved in migrating to newer
gcc, binutils and uClibc; have you any idea?

Simon.
