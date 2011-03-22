From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Mar 2011 22:03:37 +0200
Subject: [Buildroot] Compiling Apache
In-Reply-To: <4D88FFC6.1010404@michaelburghart.de>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
	<4D88F97B.4060605@michaelburghart.de>
	<20110322195502.GA8662@tarshish>
	<4D88FFC6.1010404@michaelburghart.de>
Message-ID: <20110322200337.GB8662@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

On Tue, Mar 22, 2011 at 09:00:06PM +0100, Michael Burghart wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi Baruch,
> 
> Am 22.03.2011 20:55, schrieb Baruch Siach:
> > Quoting the execve(2) man page:
> > 
> >        ENOENT The  file  filename  or  a script or ELF interpreter does not exist, or a
> >               shared library needed for file or interpreter cannot be found.
> > 
> > This means that the format of the executable is wrong. What is the output of 
> > 'file dftables'?
> 
> ./dftables: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
> dynamically linked (uses shared libs), not stripped
> 
> But what is wrong?!

Another possibility is that one of the shared libraries that this executable 
depends on is missing. What is the output of 'ldd dftables'?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
