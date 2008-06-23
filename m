From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 23 Jun 2008 16:48:39 +0200
Subject: [Buildroot] cris
In-Reply-To: <20080623130657.GC8920@mx.loc>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc> <485BAFF8.8090604@cetrtapot.si>
	<20080620141152.GG12682@mx.loc> <485F507D.5070801@cetrtapot.si>
	<485F63D8.2050809@cetrtapot.si> <20080623130657.GC8920@mx.loc>
Message-ID: <485FB7C7.2090908@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Mon, Jun 23, 2008 at 10:50:32AM +0200, Hinko Kocevar wrote:
>> Hinko Kocevar wrote:
>>> Bernhard Fischer wrote:
>>>> [I'm changing the subject to something more suitable]
> 
>>>> I don't see this. Is that uClibc-trunk or something else?
>>> Me too, will rebuild with and wo sysroot as I suspect to meka a difference..
>> No difference. In other words, I can't install binutils 2.18 wo using sysroot.
> 
> Ah right, i don't do non-sysroot (there is simply no point in it)
> anymore. It's better to just have a properly relocatable cross-compiler
> anyway.
> 
>> But using gcc 4.2.3 instead of 4.3.1 does not generate the error!
> 
> You would have to look if these old gcc versions are treated separately
> and adjust the new accordingly (in gcc-uclibc-3.x.mk, i.e. the
> non-sysroot makefile; but you really don't want these).
> 

I've misread the sysroot comment in the buildroot (I thought it was optionally to use it), but without it the buildroot tries to put resulting cross compiled binutils into /usr, which is not what I want.

Maybe finding the 'latest' known working compiler for cris would be the starting point and the move on to the newer versions. Axis has originally ported cris architecture to gcc 3.2.1 and I'm not aware if they are even trying to keep up with the gcc/glibc/uClibc/binutils mainstream changes in order to provide latest tools..

Thanks.

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
