From: Quick X <quickx@hotmail.com>
Date: Tue, 23 Dec 2008 12:42:27 -0800
Subject: [Buildroot] at91sam9261ek_defconfig Make Error - uClibc-ctype.h not
	found
Message-ID: <BAY124-W52A29383EC57706F901BA3D2EC0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Grabing the latest revision (R24529).  Executing the following commands, and taking default on everything, results in a make error:
 
make menuconfig
make at91sam9261ek_defconfig
make
 
[[[SNIP]]]
/usr/bin/make locale_headers/bin/sh: /home/user/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc: not foundmake[2]: /home/user/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc: Command not foundmake[2]: /home/user/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc: Command not found/usr/bin/gcc extra/locale/gen_wc8bit.c  -o extra/locale/gen_wc8bit    -O2 -Wall  -D__UCLIBC_GEN_LOCALE -DUCLIBC_CTYPE_HEADER='".//include/bits/uClibc_ctype.h"' -DCTYPE_PACKED=1 -DDO_WIDE_CHAR=1extra/locale/gen_wc8bit.c:21:29: error: .//include/bits/uClibc_ctype.h: No such file or directoryextra/locale/gen_wc8bit.c: In function 'main':extra/locale/gen_wc8bit.c:300: error: '__CTYPE_unclassified' undeclared (first use in this function)extra/locale/gen_wc8bit.c:300: error: (Each undeclared identifier is reported only onceextra/locale/gen_wc8bit.c:300: error: for each function it appears in.)extra/locale/gen_wc8bit.c:302: error: '__CTYPE_digit' undeclared (first use in this function)extra/locale/gen_wc8bit.c:304: error: '__CTYPE_alpha_nonupper_nonlower' undeclared (first use in this function)extra/locale/gen_wc8bit.c:306: error: '__CTYPE_alpha_lower' undeclared (first use in this function)extra/locale/gen_wc8bit.c:308: error: '__CTYPE_alpha_upper_lower' undeclared (first use in this function)extra/locale/gen_wc8bit.c:311: error: '__CTYPE_alpha_upper' undeclared (first use in this function)extra/locale/gen_wc8bit.c:314: error: '__CTYPE_punct' undeclared (first use in this function)extra/locale/gen_wc8bit.c:316: error: '__CTYPE_graph' undeclared (first use in this function)extra/locale/gen_wc8bit.c:318: error: '__CTYPE_print_space_nonblank' undeclared (first use in this function)extra/locale/gen_wc8bit.c:320: error: '__CTYPE_print_space_blank' undeclared (first use in this function)extra/locale/gen_wc8bit.c:323: error: '__CTYPE_space_nonblank_noncntrl' undeclared (first use in this function)extra/locale/gen_wc8bit.c:325: error: '__CTYPE_space_blank_noncntrl' undeclared (first use in this function)extra/locale/gen_wc8bit.c:328: error: '__CTYPE_cntrl_nonspace' undeclared (first use in this function)extra/locale/gen_wc8bit.c:330: error: '__CTYPE_cntrl_space_nonblank' undeclared (first use in this function)extra/locale/gen_wc8bit.c:332: error: '__CTYPE_cntrl_space_blank' undeclared (first use in this function)extra/locale/gen_wc8bit.c:467: warning: pointer targets in assignment differ in signednessextra/locale/gen_wc8bit.c:618: warning: pointer targets in assignment differ in signednessmake[2]: *** [extra/locale/gen_wc8bit] Error 1make[1]: *** [headers] Error 2make[1]: Leaving directory `/home/user/buildroot/toolchain_build_arm/uClibc-0.9.29'make: *** [/home/user/buildroot/toolchain_build_arm/uClibc-0.9.29/.configured] Error 2user at com:~/buildroot$ 
_________________________________________________________________

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20081223/c29ec0e5/attachment-0001.htm 
