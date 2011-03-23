From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 Mar 2011 19:16:08 +0200
Subject: [Buildroot] Compiling Apache
In-Reply-To: <4D898F3C.8010603@michaelburghart.de>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
	<4D88F97B.4060605@michaelburghart.de>
	<20110322195502.GA8662@tarshish>
	<4D88FFC6.1010404@michaelburghart.de>
	<20110322200337.GB8662@tarshish>
	<4D8904BF.5060503@michaelburghart.de>
	<4D898F3C.8010603@michaelburghart.de>
Message-ID: <20110323171608.GC3225@nataf.siach.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

On Wed, Mar 23, 2011 at 07:12:12AM +0100, Michael Burghart wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi and good morning...
> 
> Am 22.03.2011 21:21, schrieb Michael Burghart:
> > Hi Baruch,
> > 
> > Am 22.03.2011 21:03, schrieb Baruch Siach:
> > 
> >> Another possibility is that one of the shared libraries that this executable
> >> depends on is missing. What is the output of 'ldd dftables'?
> > 
> > ./dftables: not an ELF file.
> > 
> > puzzles me even more...
> > 
> > Thanks for your help btw!!
> 
> mb at einstein:/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre> /LFS/buildroot-2011.02/output/host/usr/bin/file
> dftables
> dftables: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
> dynamically linked (uses shared libs), not stripped
> 
> mb at einstein:/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre> /LFS/buildroot-2011.02/output/host/usr/bin/ldd
> dftables
> dftables: not an ELF file.
> 
> I do not understand. file tells me the info about the file and ldd tells
> me its not an ELF  file whereas file says "ELF 32 bit" (which is correct).
> 
> What did I do wrong?

Do you have 32bit libraries on your host machine?

What is the output of 'sh -x /usr/bin/ldd dftables'?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
