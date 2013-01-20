From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 20 Jan 2013 09:54:04 -0300
Subject: [Buildroot] [PATCH RFC] Fix avr32 build using internal toolchain
In-Reply-To: <CAHt8ZCOH9FgqzkB2KHJSSBc3k76-07iYNfsQ_rjzQCzOFGLEAg@mail.gmail.com>
References: <1358460970-2081-1-git-send-email-spdawson@gmail.com>
 <20130119113852.6d35aa94@skate>
 <CAHt8ZCOH9FgqzkB2KHJSSBc3k76-07iYNfsQ_rjzQCzOFGLEAg@mail.gmail.com>
Message-ID: <50FBE8EC.6060602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/2013 08:01 AM, Simon Dawson wrote:

> Yes, I understand that the avr32 toolchain is in a bit of a mess. I'm
> using host gcc version 4.6 without problems; from memory, I think it's
> 4.7 that doesn't work --- I might have misremembered 'though...

With gentoo's 4.6.3 it fails for me in the same way as described at
Atmel's site http://www.atmel.no/buildroot/buildroot-issues.html
(Error: invalid register list)

> Yes, I think we discussed this briefly at the Buildroot Developer Days
> in Barcelona. My understanding is that avr32 is regarded
> semi-officially as an end-of-life architecture. Atmel technical
> support are, for the time being, still dealing with support queries
> for avr32.

Do you know if the UC3 microcontrollers are in the same boat?
If they aren't there may still be some hope for the toolchain (at least
binutils/gcc, not much for uclibc/linux).

> From my own perspective, I'd rather keep the avr32 support in
> Buildroot for now. I don't know how many other people are using the
> architecture --- not that many, I suspect. Would that be a major
> problem?

Testing and fixing is an issue on the toolchain side when there's no
upgrade path possible.
I wouldn't like to stick to old and potentially vulnerable versions of
packages (example: gnutls) because the toolchain is too old to handle
it, it's problematic.
And dragging arch-specific patches isn't fun either.
Maybe we can keep it and start marking broken packages as !BR2_avr32 ?
That may be a rough ride though with all the dependencies.
Regards.
