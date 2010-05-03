From: Andy Gibbs <andyg1001@hotmail.co.uk>
Date: Mon, 3 May 2010 17:31:15 +0200
Subject: [Buildroot] Buildroot 2010.05-rc1 released
References: <876335dpke.fsf@macbook.be.48ers.dk>
Message-ID: <BLU0-SMTP19DC56EDFAA0FC2DE3399FE7F20@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thank you for the latest release; apart from one issue it is working well.

Unfortunately it can fail to build correctly with toolchain locale support 
enabled on systems without en_US.UTF-8.  I believe this may be more a 
problem within uclibc itself, rather than with buildroot, but the patch is 
simple (2 lines!), so would it be possible to get it into v2010.05 anyway??? 
(the link to the patch is below).

The error message I get under the current RC1 is as follows:...

  HOSTCC extra/locale/gen_wc8bit
extra/locale/gen_wc8bit.c: In function 'main':
extra/locale/gen_wc8bit.c:374: warning: array subscript is above array 
bounds
extra/locale/gen_wc8bit.c:433: warning: array subscript is above array 
bounds
extra/locale/gen_wc8bit.c:499: warning: array subscript is above array 
bounds
  GEN extra/locale/codesets.txt
  GEN extra/locale/c8tables.h
make[1]: *** [extra/locale/c8tables.h] Error 1
make[1]: Leaving directory 
`.../buildroot-2010.05-rc1/output/toolchain/uClibc-0.9.31'
make: *** 
[.../buildroot-2010.05-rc1/output/toolchain/uClibc-0.9.31/.configured] Error 
2


Interestingly, the actual error message is not shown.  Compare with the same 
error on v2010.02:

  HOSTCC extra/locale/gen_wc8bit
extra/locale/gen_wc8bit.c: In function 'main':
extra/locale/gen_wc8bit.c:379: warning: array subscript is above array 
bounds
extra/locale/gen_wc8bit.c:438: warning: array subscript is above array 
bounds
extra/locale/gen_wc8bit.c:504: warning: array subscript is above array 
bounds
  GEN extra/locale/codesets.txt
  GEN extra/locale/c8tables.h
could not find a UTF8 locale ... please enable en_US.UTF-8
make[1]: *** [extra/locale/c8tables.h] Error 1
make[1]: Leaving directory 
`.../buildroot-2010.02/output/toolchain/uClibc-0.9.30.2'
make: *** 
[.../buildroot-2010.02/output/toolchain/uClibc-0.9.30.2/.configured] Error 2


The patch to fix this build problem, I previously posted to the uclibc 
mailing list at:

http://lists.uclibc.org/pipermail/uclibc/2010-April/043972.html

Thanks

Andy


----- Original Message ----- 
From: "Peter Korsgaard"
Newsgroups: gmane.comp.lib.uclibc.buildroot
Sent: Monday, May 03, 2010 4:31 PM
Subject: Buildroot 2010.05-rc1 released


> Hi,
>
> Buildroot 2010.05-rc1 is released - Go download it at:
>
> http://buildroot.net/downloads/buildroot-2010.05-rc1.tar.gz
>
> or
>
> http://buildroot.net/downloads/buildroot-2010.05-rc1.tar.bz2
>
> Or get it from Git:
>
> git://git.buildroot.net/buildroot
>
> Please give it a spin and report any problems to the mailing list or bug
> tracker. Many thanks to the people contributing to this release:
>
> git shortlog -s -n 2010.02..
>   220  Paulius Zaleckas
>   123  Thomas Petazzoni
>   220  Paulius Zaleckas
>   123  Thomas Petazzoni
>    92  Peter Korsgaard
>    26  Will Wagner
>    22  Gustavo Zacarias
>    14  Lionel Landwerlin
>     3  Darius Augulis
>     3  H Hartley Sweeten
>     3  Josh.Wu
>     3  Yann E. MORIN
>     2  Alexander Clouter
>     2  Kelvin Cheung
>     2  Luca Ceresoli
>     2  Richard van Paasen
>     1  Chris Seawood
>     1  Frederik Vannoote
>     1  Grant Edwards
>     1  Johan Thelin
>     1  Laine Walker-Avina
>     1  Michael Roth
>     1  Mike Crowe
>     1  Paul Jones
>     1  Thomas Brandstetter
>
>>From now on the tree is closed for new features until after the 2010.05
> release (expected at end of month).
>
> -- 
> Bye, Peter Korsgaard 
