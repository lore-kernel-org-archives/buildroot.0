From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Mar 2009 22:21:16 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
In-Reply-To: <d6cda7730903060956r6a3c5fe8ra2ee09251ce81d61@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Fri\, 6 Mar 2009
	14\:56\:38 -0300")
References: <20090303220951.E40FB7626F@busybox.osuosl.org>
	<d6cda7730903060956r6a3c5fe8ra2ee09251ce81d61@mail.gmail.com>
Message-ID: <878wnie4ab.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 >> + ? ? ? ? ? ? ? depends on BR2_DEPRECATED
 >> ? ? ? ? ? ? ? ?depends on BR2_EXT_BINUTILS_VERSION_2_18
 >> ? ? ? ? ? ? ? ?bool "binutils 2.18"
 >> 

 Thiago> This breaks AVR32 external toolchain thing. I tried to make it:
 Thiago> depends on BR2_DEPRECATED if !BR2_avr32

 Thiago> but it didn't work, looks like kconfig doesn't accept ! logic
 Thiago> with depends

I think depends on BR2_DEPRECATED || BR2_avr32 works.

Sorry, I keep on forgetting about avr32 being so special.

I'll fix it.

 Thiago> Is there a way around? Right now I've removed that line from
 Thiago> my local repository to keep things working.

How's avr32 support for newer binutils/gcc going?

-- 
Bye, Peter Korsgaard
