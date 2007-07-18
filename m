From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Wed, 18 Jul 2007 15:29:25 +0530
Subject: [Buildroot] Buildroot compilation errors (libintl) in cygwin.
Message-ID: <C03A3C267DDF184EA523BBAB577BF924C22D88@blrexsr1.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Naren,
 
I had the same issue for gettext not taking files of libintl. there is
update in the latest snapshot for gettext & libintl may be u can
download it & try.
also u may be getting errors related libxml2. u can check the latest
buildroot mailing list for update on the same.
 
Regards
Gururaja

________________________________

From: Gabbar Singh [mailto:gabbar_singh_new at yahoo.com] 
Sent: Wednesday, July 18, 2007 2:08 AM
To: Gururaja Hebbar K R; buildroot at uclibc.org
Subject: Re: [Buildroot] Buildroot compilation errors (libintl) in
cygwin.


Hi,
Thanks for the quick reply. But my makefile.in already has that patch. I
am using the latest buildroot. In fact I downloaded it on monday, july
16.
I have libintl_gettext installed on my cygwin but still these errors
keep on popping up.
Any info will be helpful.

Regards,
Naren

Hebbar <gururajakr@sanyo.co.in> wrote: 


	This is an error due a small bus in a make file. the patch is
already been
	set. u can use the latest version to solve it. Also make sure u
have gettext
	installed
	
	check this link for solution
	
	
http://www.nabble.com/-PATCH--Critical-typo-in--Makefile-tf4073315.html
	
	Regards
	Gururaja
	
	
	
	Gabbar Singh wrote:
	> 
	> Hi,
	> I am trying to build a rootfs for arm9 using buildroot.
	> I am getting this error repeatedly. I couldnt find any helpful
info on
	> googling. could anybody please help me out with this.
	> 
	> $ make
	> if [ ! -e "/home/buildroot/toolchain_build_arm/bin/sed" ] ;
then \
	> mkdir -p "/home/buildroot/toolchain_build_arm/bin"; \
	> rm -f "/home/buildroot/toolchain_build_arm/bin/sed"; \
	> ln -sf "/usr/bin/sed" "/home/buildroot/toolchain_build_arm
	> /bin/sed"; \
	> fi
	> 
	> Checking build system dependencies:
	> CC clean: Ok
	> CXX clean: Ok
	> CPP clean: Ok
	> CFLAGS clean: Ok
	> INCLUDES clean: Ok
	> CXXFLAGS clean: Ok
	> which installed: Ok
	> sed works: Ok (/usr/bin/sed)
	> GNU make version '3.81': Ok
	> C compiler '/usr/bin/gcc'
	> C compiler version '3.4.4': Ok
	> C++ compiler '/usr/bin/g++'
	> C++ compiler version '3.4.4': Ok
	> bison installed: Ok
	> flex installed: Ok
	> gettext installed: Ok
	> makeinfo installed: Ok
	> Build system dependencies: Ok
	> 
	> set -x && make MAKE="make -j1" -C
/home/buildroot/toolchain_build_arm/uCli
	> bc-0.9.29 \
	> PREFIX=/home/buildroot/toolchain_build_arm/uClibc_dev/ \
	> DEVEL_PREFIX=/usr/ \
	> RUNTIME_PREFIX=/home/buildroot/toolchain_build_arm/uClibc_
	> dev/ \
	> HOSTCC="/usr/bin/gcc" \
	> pregen install_dev
	> + make 'MAKE=make -j1' -C
/home/buildroot/toolchain_build_arm/uClibc-0.9.2
	> 9 PREFIX=/home/buildroot/toolchain_build_arm/uClibc_dev/
DEVEL_PREFIX=/usr
	> /
RUNTIME_PREFIX=/home/buildroot/toolchain_build_arm/uClibc_dev/ HOSTCC=/u
	> sr/bin/gcc pregen install_dev
	> /bin/sh: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc: No
such file or di
	> rectory
	> make[1]: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc:
Command not found
	> make[1]: Entering directory
`/home/buildroot/toolchain_build_arm/uClibc-0.
	> 9.29'
	> make[1]: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc:
Command not found
	> make[1]: Entering directory
`/home/buildroot/toolchain_build_arm/uClibc-0.
	> 9.29'
	> make[1]: Entering directory
`/home/buildroot/toolchain_build_arm/uClibc-0.
	> 9.29'
	> /bin/sh: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc: No
such file or di
	> rectory
	> make[2]: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc:
Command not found
	> make[2]: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc:
Command not found
	> /usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="" -DLOCALE 
	> conf.
	> o zconf.tab.o -o conf
	> conf.o:conf.c:(.text+0xb2): undefined reference to
`_libintl_gettext'
	> conf.o:conf.c:(.text+0xc6): undefined reference to
`_libintl_gettext'
	> conf.o:conf.c:(.text+0xda): undefined reference to
`_libintl_gettext'
	> conf.o:conf.c:(.text+0xf2c): undefined reference to
`_libintl_gettext'
	> conf.o:conf.c:(.text+0x10c5): undefined reference to
`_libintl_gettext'
	> conf.o:conf.c:(.text+0x116f): more undefined references to
	> `_libintl_gettext' fo
	> llow
	> collect2: ld returned 1 exit status
	> make[2]: *** [conf] Error 1
	> make[1]: *** [extra/config/conf] Error 2
	> make[1]: Leaving directory
`/home/buildroot/toolchain_build_arm/uClibc-0.9
	> .29'
	> make: ***
[/home/buildroot/toolchain_build_arm/uClibc-0.9.29/.configured]
	> Error 2
	> 
	> 
	> Thanks and Regards,
	> Naren
	> 
	> 
	> ---------------------------------
	> Need Mail bonding?
	> Go to the Yahoo! Mail Q&A for great tips from Yahoo! Answers
users.
	> _______________________________________________
	> buildroot mailing list
	> buildroot at uclibc.org
	> http://busybox.net/mailman/listinfo/buildroot
	> 
	
	-- 
	View this message in context:
http://www.nabble.com/Buildroot-compilation-errors-%28libintl%29-in-cygw
in.-tf4101102.html#a11662767
	Sent from the BuildRoot mailing list archive at Nabble.com.
	
	_______________________________________________
	buildroot mailing list
	buildroot at uclibc.org
	http://busybox.net/mailman/listinfo/buildroot
	


________________________________

Get the Yahoo! toolbar and be alerted to new email
<http://us.rd.yahoo.com/evt=48225/*http://new.toolbar.yahoo.com/toolbar/
features/mail/index.php> wherever you're surfing. 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070718/511a7e82/attachment-0001.htm 
