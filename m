From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 30 Apr 2009 08:37:22 +0200
Subject: [Buildroot] Broken u-boot 2009.x, undeprecate u-boot 2008.10
In-Reply-To: <d6cda7730904292328h7a48188ao9012ae0dd5dda91e@mail.gmail.com>
References: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
	<20090430073104.684a701c@hcegtvedt.norway.atmel.com>
	<d6cda7730904292328h7a48188ao9012ae0dd5dda91e@mail.gmail.com>
Message-ID: <20090430083722.247d3380@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Apr 2009 03:28:08 -0300
Thiago A. Corr?a <thiago.correa@gmail.com> wrote:

<snipp>

> >> ? ?Should we deal with 2009.03 and 2009.01 in any special way?
> >> (Drop them, comment as broken JFFS2?)
> >>
> >
> > At least make 2008.10 available, and lets hope 2009.05 can make us
> > dump all the previous ones.
> >
> 
> Done. But I wonder if we should take more steps in this regard. One
> thing is to have packages that don't build, another is a package that
> builds but fails at run time with known upstream bugs. Being the
> bootloader, it could brick boards from unaware users without a JTAGICE
> mkII.
> 

Hmmm, indeed, you are not able to erase and reprogram a new bootloader
either. You could boot Linux and program the bootloader there though.

There is a flash-upgrade [1] tool, but that will only work on AVR32
hooked up to Atmel flash devices.

1: http://avr32linux.org/twiki/bin/view/Main/FlashUpgrade

-- 
Best regards,
Hans-Christian Egtvedt
