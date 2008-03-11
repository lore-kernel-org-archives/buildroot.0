From: Marco Lazzarotto <m.lazzarotto@robox.it>
Date: Tue, 11 Mar 2008 17:57:48 +0100
Subject: [Buildroot] Trying to build parted
In-Reply-To: <47D69674.9060504@robox.it>
References: <47D69674.9060504@robox.it>
Message-ID: <47D6BA0C.2040307@robox.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I did reconfigure regexp support in uclibc, but did not compile... blame me!

I did it, with the files attached here (all in package/parted/) and the 
modification to e2fsprogs makefile that I sent before.
Is of interest of anybody, to add it to buildroot?

bye
	Marco Lazzarotto

I wrote:
> Hi all,
> 
> I'm trying to compile GNU parted without success.
> Did someone try it?
> 
> I created the directory package/parted with the attached files Config.in 
> and parted.mk
> 
> After modifying package/e2fsprogs/e2fsprogs.mk (as included) to install 
> the headers and the librarie for libuuid in $STAGING_DIR i get this error:
> 
> /home/marco/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc 
> -I. -Os -pipe -I/home/marco/buildroot/build_i586/staging_dir/usr/include 
> -I/home/marco/buildroot/build_i586/staging_dir/include 
> --sysroot=/home/marco/buildroot/build_i586/staging_dir/ -isysroot 
> /home/marco/buildroot/build_i586/staging_dir -mtune=i586 -march=i586 
> -Werror -MT regex.lo -MD -MP -MF .deps/regex.Tpo -c regex.c -o regex.o
> In file included from regex.c:61:
> regcomp.c: In function 'init_dfa':
> regcomp.c:867: error: 'MB_CUR_MAX' undeclared (first use in this function)
> regcomp.c:867: error: (Each undeclared identifier is reported only once
> regcomp.c:867: error: for each function it appears in.)
> make[3]: *** [regex.lo] Error 1
> make[3]: Leaving directory 
> `/home/marco/buildroot/build_i586/parted-1.8.8/lib'
> make[2]: *** [all] Error 2
> make[2]: Leaving directory 
> `/home/marco/buildroot/build_i586/parted-1.8.8/lib'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/marco/buildroot/build_i586/parted-1.8.8'
> make: *** [/home/marco/buildroot/build_i586/parted-1.8.8/parted] Error 2
> 
> [I tried to #include <stdlib.h> in the file 
> build_i586/parted-1.8.8/lib/regex.c but without success]
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot


-- 
  *------------------------------------------------------------------*
  | Vi preghiamo, se questo messaggio fosse ricevuto per errore,     |
  | di avvisare il mittente e, tenuto conto delle responsabilita'    |
  | connesse all'indebito utilizzo e/o divulgazione del messaggio    |
  | e/o delle informazioni in esso contenute, di cancellare          |
  | l'originale e distruggere le varie copie o stampe. Grazie        |
  *------------------------------------------------------------------*
  | The information in this e-mail is solely for the addressee.      |
  | Please delete this e-mail if you are not the intended recipient. |
  | Do not disclose or distribute the communication in any form.     |
  *------------------------------------------------------------------*
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: parted.mk
Url: http://busybox.net/lists/buildroot/attachments/20080311/487b927f/attachment.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: Config.in
Url: http://busybox.net/lists/buildroot/attachments/20080311/487b927f/attachment-0001.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: parted-001-ui.cast.patch
Url: http://busybox.net/lists/buildroot/attachments/20080311/487b927f/attachment-0002.diff 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: m_lazzarotto.vcf
Type: text/x-vcard
Size: 259 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080311/487b927f/attachment.vcf 
