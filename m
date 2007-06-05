From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Tue, 05 Jun 2007 17:13:52 +0100
Subject: [Buildroot] {Spam?} Re: buildroot-20070604.tar.bz2 dont compile
 under	redhat9
In-Reply-To: <CD8593C30F4B4CDCBFF78D40E9795B20@zsn1976>
References: <4694D9AB90E944668197DA69C981360F@zsn1976>	<4664FC4B.8080101@teamboyce.co.uk>
	<CD8593C30F4B4CDCBFF78D40E9795B20@zsn1976>
Message-ID: <46658BC0.7050002@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zhangsn,

It seems that your Linux box does not have all the packages need to 
build.  With fedora you should try 'yum install texinfo' as root.  On 
Red Hat 9 you are going to need to download and install the texinfo 
package.  This is also getting a bit off topic for build-root so I 
suggest you reinstall whatever you favorite Linux distro is and make 
sure you install all the packages and not just the default settings.

This again is not a build root issue but a generic Linux issue.

Regards,
Rod Boyce
zhangsn98 wrote:
> Boyce:
>     Yes, you are right. Thank you for your reply.
> I update the "make".It pass through the last error.
>
> But new errors comeout. I want to know what
> type linux can let the newest buildroot run smoothly.
> It is ubt,der,fedora or debain?Where has a Step-by-Step?
>
>
> new error message as follows:
>
> rm -rf $backupdir; exit $rc
> WARNING: `makeinfo' is missing on your system.  You should only need it if
>          you modified a `.texi' or `.texinfo' file, or any other file
>          indirectly affecting the aspect of the manual.  The spurious
>          call might also be the consequence of using a buggy `make' (AIX,
>          DU, IRIX).  You might want to install the `Texinfo' package or
>          the `GNU make' package.  Grab either from any GNU archive site.
> make[4]: *** [/usr/src/buildroot/buildroot/toolchain_build_i686/binutils-2.17/bfd/doc/bfd.info] Error 1
> make[4]: Leaving directory `/usr/src/buildroot/buildroot/toolchain_build_i686/binutils-2.17-build/bfd/doc'
> Making info in po
> make[4]: Entering directory `/usr/src/buildroot/buildroot/toolchain_build_i686/binutils-2.17-build/bfd/po'
> make[4]: Nothing to be done for `info'.
> make[4]: Leaving directory `/usr/src/buildroot/buildroot/toolchain_build_i686/binutils-2.17-build/bfd/po'
> make[4]: Entering directory `/usr/src/buildroot/buildroot/toolchain_build_i686/binutils-2.17-build/bfd'
> make[4]: Nothing to be done for `info-am'.
> make[4]: Leaving directory `/usr/src/buildroot/buildroot/toolchain_build_i686/binutils-2.17-build/bfd'
> make[3]: *** [info-recursive] Error 1
> make[3]: Leaving directory `/usr/src/buildroot/buildroot/toolchain_build_i686/binutils-2.17-build/bfd'
> make[2]: *** [all-bfd] Error 2
> make[2]: Leaving directory `/usr/src/buildroot/buildroot/toolchain_build_i686/binutils-2.17-build'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory `/usr/src/buildroot/buildroot/toolchain_build_i686/binutils-2.17-build'
> make: *** [/usr/src/buildroot/buildroot/toolchain_build_i686/binutils-2.17-build/binutils/objdump] Error 2
>
> Rgds
> zhangsn
>
>
>
>
> ----- Original Message ----- 
> From: "Rod Boyce" <buildroot@teamboyce.co.uk>
> To: <buildroot@uclibc.org>
> Sent: Tuesday, June 05, 2007 2:01 PM
> Subject: Re: [Buildroot] {Spam?} Re: buildroot-20070604.tar.bz2 dont compile under redhat9
>
>
>   
>> zhangsn98 wrote:
>>     
>>> Hi,
>>>   How are you!
>>>   I'm first time use buildroot under redhat9(kernel:2.4.20.8;gcc:3.2.2).
>>>   I use the default(i386) in buildroot complier.then run"make";
>>>
>>>
>>>   the following message show:
>>>
>>> ///////////////////////////////////////////////////////////////////
>>>   mkdir -p /usr/src/buildroot/buildroot/build_i686/root
>>> if [ -d "target/generic/target_skeleton" ] ; then \
>>>         cp -fa target/generic/target_skeleton/* /usr/src/buildroot/buildroot/build_i686/root/; \
>>> fi;
>>> touch /usr/src/buildroot/buildroot/build_i686/staging_dir/.fakeroot.00000
>>> find /usr/src/buildroot/buildroot/build_i686/root -type d -name CVS | xargs rm -rf
>>> find /usr/src/buildroot/buildroot/build_i686/root -type d -name .svn | xargs rm -rf
>>> if [ ! -e "/usr/src/buildroot/buildroot/toolchain_build_i686/bin/sed" ] ; then \
>>>         mkdir -p "/usr/src/buildroot/buildroot/toolchain_build_i686/bin"; \
>>>         rm -f "/usr/src/buildroot/buildroot/toolchain_build_i686/bin/sed"; \
>>>         ln -sf "/bin/sed" "/usr/src/buildroot/buildroot/toolchain_build_i686/bin/sed"; \
>>> fi
>>>
>>> Checking build system dependencies:
>>> CC clean:                                       Ok
>>> CXX clean:                                      Ok
>>> CPP clean:                                      Ok
>>> CFLAGS clean:                                   Ok
>>> INCLUDES clean:                                 Ok
>>> CXXFLAGS clean:                                 Ok
>>> which installed:                                Ok
>>> sed works:                                      Ok (/bin/sed)
>>> GNU make version '3.79.1,':                     Ok
>>> C compiler '/usr/bin/gcc'
>>> C compiler version '3.2.2':                     Ok
>>> C++ compiler '/usr/bin/c++'
>>> C++ compiler version '3.2.2':                   Ok
>>> bison installed:                                Ok
>>> flex installed:                                 Ok
>>> gettext installed:                              Ok
>>> makeinfo installed:                             Ok
>>> Build system dependencies:                      Ok
>>>
>>> (cd /usr/src/buildroot/buildroot/build_i686/linux-2.6.20.4 ; \
>>>  make -j1 ARCH=i386 CC="gcc" \
>>>         INSTALL_HDR_PATH=/usr/src/buildroot/buildroot/toolchain_build_i686/linux headers_install ; \
>>> )
>>> make[1]: Entering directory `/usr/src/buildroot/buildroot/build_i686/linux-2.6.20.4'
>>>   CHK     include/linux/version.h
>>> make[2]: `scripts/unifdef' is up to date.
>>> make[2]: *** No rule to make target `|', needed by `asm-generic'.  Stop.
>>> make[1]: *** [headers_install] Error 2
>>> make[1]: Leaving directory `/usr/src/buildroot/buildroot/build_i686/linux-2.6.20.4'
>>> make: *** [/usr/src/buildroot/buildroot/toolchain_build_i686/linux/.configured] Error 2
>>>
>>> /////////////////////////////////////////////////////////////////
>>>
>>>
>>> What wrong? How i do with this?Shall I send this in the maillist or bug tracking?
>>>
>>> Rgds
>>> zhangsn
>>>
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at uclibc.org
>>> http://busybox.net/mailman/listinfo/buildroot
>>>   
>>>       
>> Zhangsn,
>>
>> I have seen this error message lots of times when trying to compile 
>> build-root on RHE 3.0 it turns out that the make program you are using 
>> is too old to work with build-root you need at least 3.80 your version 
>> is returned as 'GNU make version '3.79.1,'
>> This appears to me not to be a bug.
>>
>> Regards,
>> Rod Boyce
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>     
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   
