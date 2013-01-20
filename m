From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 15:21:52 +0100
Subject: [Buildroot] [PATCH RFC] Fix avr32 build using internal toolchain
In-Reply-To: <CAHt8ZCOH9FgqzkB2KHJSSBc3k76-07iYNfsQ_rjzQCzOFGLEAg@mail.gmail.com>
References: <1358460970-2081-1-git-send-email-spdawson@gmail.com>
 <20130119113852.6d35aa94@skate>
 <CAHt8ZCOH9FgqzkB2KHJSSBc3k76-07iYNfsQ_rjzQCzOFGLEAg@mail.gmail.com>
Message-ID: <20130120152152.31628abb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Sun, 20 Jan 2013 11:01:30 +0000, Simon Dawson wrote:

> Yes, I'm using Buildroot for the continued development of a system
> based on the Atmel ap7000. This system will be under
> development/support for at least the next few years, I would imagine.

Ok.

> Yes, I think we discussed this briefly at the Buildroot Developer Days
> in Barcelona. My understanding is that avr32 is regarded
> semi-officially as an end-of-life architecture. Atmel technical
> support are, for the time being, still dealing with support queries
> for avr32.
> 
> > Therefore, I'm wondering if we shouldn't mark this architecture as
> > deprecated.
> 
> From my own perspective, I'd rather keep the avr32 support in
> Buildroot for now. I don't know how many other people are using the
> architecture --- not that many, I suspect. Would that be a major
> problem?

Long term it is a problem to have a gcc 4.2.x only toolchain and an old
uClibc version. Some packages will fail to build because gcc is too
old, we'll start depending on some uClibc features that the old uClibc
version does not have, etc.

> I don't know how much effort would be involved in migrating to newer
> gcc, binutils and uClibc; have you any idea?

I know OpenWRT has some AVR32 support patches for more recent gcc
versions (maybe gcc 4.5 or something, I don't remember). I tried once
using them, but it wasn't straightforward, and I didn't want to spend
too much time on AVR32, honestly :)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
