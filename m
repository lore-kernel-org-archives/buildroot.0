From: Cyril HAENEL <chaenel@free.fr>
Date: Fri, 23 Jan 2009 22:27:37 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <87skn9iv5w.fsf@macbook.be.48ers.dk>
References: <87skn9iv5w.fsf@macbook.be.48ers.dk>
Message-ID: <497A3649.7050005@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Peter Korsgaard a ?crit :
> Hi,
>
> Another week, another release candidate. I have released
> buildroot-2009.02-rc2:
>
> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc2.tar.gz
>
> or
>
> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc2.tar.bz2
>
> Please give it a spin and report back issues to the mailing list or
> the bug tracker.
>
> I think we're pretty well on track to do a final release in 2 weeks.
>
>   
Hi,

Compilation problem for me :

tar jxvf buildroot-2009.02-rc2.tar.bz2
cd buildroot-2009.02-rc2
make menuconfig + Exit + Save
make at91sam9260dfc_defconfig
make

-> I answer N at all questions
-> I answer 3 for the memory type question (Nand flash 2KB page and 
128KB block)

After 2 or 3 minutes :

  LN include/sys/procfs.h
  LN include/sys/ucontext.h
  LN include/sys/user.h
  HOSTCC extra/locale/gen_wc8bit
extra/locale/gen_wc8bit.c: In function 'main':
extra/locale/gen_wc8bit.c:356: warning: array subscript is above array 
bounds
extra/locale/gen_wc8bit.c:415: warning: array subscript is above array 
bounds
extra/locale/gen_wc8bit.c:481: warning: array subscript is above array 
bounds
  GEN extra/locale/codesets.txt
  GEN extra/locale/c8tables.h
setlocale(LC_CTYPE,"en_US.UTF-8") failed!
make[1]: *** [extra/locale/c8tables.h] Erreur 1
make[1]: quittant le r?pertoire ? 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/uClibc-0.9.30 
?
make: *** 
[/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/uClibc-0.9.30/.configured] 
Erreur 2

Its a problem on my laptop ?

Regards,
Cyril HAENEL

-- 

Cyril Haenel
Registered Linux User #332632
