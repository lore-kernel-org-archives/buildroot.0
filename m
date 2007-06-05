From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Tue, 05 Jun 2007 07:01:47 +0100
Subject: [Buildroot] {Spam?} Re: buildroot-20070604.tar.bz2 dont compile
 under	redhat9
In-Reply-To: <4694D9AB90E944668197DA69C981360F@zsn1976>
References: <4694D9AB90E944668197DA69C981360F@zsn1976>
Message-ID: <4664FC4B.8080101@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zhangsn98 wrote:
> Hi,
>   How are you!
>   I'm first time use buildroot under redhat9(kernel:2.4.20.8;gcc:3.2.2).
>   I use the default(i386) in buildroot complier.then run"make";
>
>
>   the following message show:
>
> ///////////////////////////////////////////////////////////////////
>   mkdir -p /usr/src/buildroot/buildroot/build_i686/root
> if [ -d "target/generic/target_skeleton" ] ; then \
>         cp -fa target/generic/target_skeleton/* /usr/src/buildroot/buildroot/build_i686/root/; \
> fi;
> touch /usr/src/buildroot/buildroot/build_i686/staging_dir/.fakeroot.00000
> find /usr/src/buildroot/buildroot/build_i686/root -type d -name CVS | xargs rm -rf
> find /usr/src/buildroot/buildroot/build_i686/root -type d -name .svn | xargs rm -rf
> if [ ! -e "/usr/src/buildroot/buildroot/toolchain_build_i686/bin/sed" ] ; then \
>         mkdir -p "/usr/src/buildroot/buildroot/toolchain_build_i686/bin"; \
>         rm -f "/usr/src/buildroot/buildroot/toolchain_build_i686/bin/sed"; \
>         ln -sf "/bin/sed" "/usr/src/buildroot/buildroot/toolchain_build_i686/bin/sed"; \
> fi
>
> Checking build system dependencies:
> CC clean:                                       Ok
> CXX clean:                                      Ok
> CPP clean:                                      Ok
> CFLAGS clean:                                   Ok
> INCLUDES clean:                                 Ok
> CXXFLAGS clean:                                 Ok
> which installed:                                Ok
> sed works:                                      Ok (/bin/sed)
> GNU make version '3.79.1,':                     Ok
> C compiler '/usr/bin/gcc'
> C compiler version '3.2.2':                     Ok
> C++ compiler '/usr/bin/c++'
> C++ compiler version '3.2.2':                   Ok
> bison installed:                                Ok
> flex installed:                                 Ok
> gettext installed:                              Ok
> makeinfo installed:                             Ok
> Build system dependencies:                      Ok
>
> (cd /usr/src/buildroot/buildroot/build_i686/linux-2.6.20.4 ; \
>  make -j1 ARCH=i386 CC="gcc" \
>         INSTALL_HDR_PATH=/usr/src/buildroot/buildroot/toolchain_build_i686/linux headers_install ; \
> )
> make[1]: Entering directory `/usr/src/buildroot/buildroot/build_i686/linux-2.6.20.4'
>   CHK     include/linux/version.h
> make[2]: `scripts/unifdef' is up to date.
> make[2]: *** No rule to make target `|', needed by `asm-generic'.  Stop.
> make[1]: *** [headers_install] Error 2
> make[1]: Leaving directory `/usr/src/buildroot/buildroot/build_i686/linux-2.6.20.4'
> make: *** [/usr/src/buildroot/buildroot/toolchain_build_i686/linux/.configured] Error 2
>
> /////////////////////////////////////////////////////////////////
>
>
> What wrong? How i do with this?Shall I send this in the maillist or bug tracking?
>
> Rgds
> zhangsn
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>   
Zhangsn,

I have seen this error message lots of times when trying to compile 
build-root on RHE 3.0 it turns out that the make program you are using 
is too old to work with build-root you need at least 3.80 your version 
is returned as 'GNU make version '3.79.1,'
This appears to me not to be a bug.

Regards,
Rod Boyce
