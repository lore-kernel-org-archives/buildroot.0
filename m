From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 10:02:46 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <497A3649.7050005@free.fr> (Cyril HAENEL's message of "Fri\,
	23 Jan 2009 22\:27\:37 +0100")
References: <87skn9iv5w.fsf@macbook.be.48ers.dk> <497A3649.7050005@free.fr>
Message-ID: <87vds5gjpl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

 Cyril> Compilation problem for me :

 Cyril> tar jxvf buildroot-2009.02-rc2.tar.bz2
 Cyril> cd buildroot-2009.02-rc2
 Cyril> make menuconfig + Exit + Save
 Cyril> make at91sam9260dfc_defconfig

That one seems to have BR2_ENABLE_LOCALE enabled.

 Cyril> make

 -> I answer N at all questions
 -> I answer 3 for the memory type question (Nand flash 2KB page and
 Cyril> 128KB block)

 Cyril> After 2 or 3 minutes :

 Cyril>  LN include/sys/procfs.h
 Cyril>  LN include/sys/ucontext.h
 Cyril>  LN include/sys/user.h
 Cyril>  HOSTCC extra/locale/gen_wc8bit
 Cyril> extra/locale/gen_wc8bit.c: In function 'main':
 Cyril> extra/locale/gen_wc8bit.c:356: warning: array subscript is above array
 Cyril> bounds
 Cyril> extra/locale/gen_wc8bit.c:415: warning: array subscript is above array
 Cyril> bounds
 Cyril> extra/locale/gen_wc8bit.c:481: warning: array subscript is above array
 Cyril> bounds
 Cyril>  GEN extra/locale/codesets.txt
 Cyril>  GEN extra/locale/c8tables.h
 Cyril> setlocale(LC_CTYPE,"en_US.UTF-8") failed!

And your host doesn't seem to have the en_US.UTF-8 locale which seems
to be a requirement for this.

I don't know the finer details about the locale generation in uclibc,
and if en_US.UTF-8 really should be required, for that you better ask
the uclibc list.

-- 
Bye, Peter Korsgaard
