From: William Wagner <will_wagner@carallon.com>
Date: Sat, 23 Apr 2011 21:46:02 +0100
Subject: [Buildroot] barking up a different tree
In-Reply-To: <8762q4aejn.fsf@macbook.be.48ers.dk>
References: <BANLkTi=EYF+b=d-LdM=bPXzaZ-7oZh-87A@mail.gmail.com>
	<8762q4aejn.fsf@macbook.be.48ers.dk>
Message-ID: <4DB33A8A.1000609@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/04/2011 21:38, Peter Korsgaard wrote:
>>>>>> "Charles" == Charles Krinke<charles.krinke@gmail.com>  writes:
>   Charles>  Maybe I am barking up the wrong tree.
>
>   Charles>  Being able to do "make clean" and *not* have to re-compile the
>   Charles>  uclibc toolchain would get buildroot to an acceptable point
>   Charles>  for the uclibc part of my project.
>
> Just build it once somewhere (E.G. set BR2_HOST_DIR to /opt/toolchain or
> whatever), and then just configure BR to use it as an external
> toolchain.

Peter,

I know that your solution works and it's what you say to everybody who 
asks that question. However I feel it is the worst feature of buildroot 
and the things that most often puts people off when I explain it. Why 
not change it so that buildroot normally does a build as if to a 
different location and then automatically uses that for the actual build 
as we clearly have support for copying the correct bits. I can't really 
see any disadvantage of this over the current system and it would 
finally allow users to get back to a clean target build but still with 
the toolchain built. I would attempt this myself to submit as a patch 
but I've not had to hack around with the toolchain much, however if 
others can give me some pointers I'd happily look at it, otherwise if 
someone else tried it I'd certainly test it.

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
