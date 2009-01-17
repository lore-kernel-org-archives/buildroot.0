From: Frank Hoeflich <frankhoeflich@yahoo.com>
Date: Sat, 17 Jan 2009 14:38:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <451083.90600.qm@web56906.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shinya:

    I believe you will find messages similar to the following in your config.log:

/tmp/br/powerpc/toolchain_build_powerpc/gcc-4.3.2-initial/./gcc/cc1: error while loading shared libraries: libmpfr.so.1: cannot open shared object file: No such file or directory

I had a similar problem building for an ARM target with a Fedora Core 6 host using gcc 4.1.1 as my *host* compiler, a clean tree and Peter's br-build-ARCH.sh script.  Hamish's post of 1/13/09 with the subject "Re: [Buildroot] arch support" seemed to indicate that this failure always occurs with host gcc 4.1.2 but could work with a host gcc 4.3.2.  I repeated the build on a clean unpack of the same tree in Fedora 9 (which has gcc 4.3.0 out of the box) and this problem went away.  If you have a downrev host gcc, try upgrading it - the rc1 candidate should build.

    If the BR tools aren't going to flag this sort of downrev host tool issue explicitly, there should at least be a note in the docs about it somewhere (e.g. host gcc version 4.1.1-2 is known to be too old to build this BR release, use at least 4.3.0-2).

--Frank

>From: "Peter Korsgaard" <jacmet@uclibc.org>
>To: "Shinya Kuribayashi" <skuribay@ruby.dti.ne.jp>
>Cc: buildroot at uclibc.org
>>>>> "Shinya" == Shinya Kuribayashi <skuribay@ruby.dti.ne.jp> writes:

>>> -    default BR2_GCC_VERSION_4_2_4 if !BR2_avr32
>>> +    default BR2_GCC_VERSION_4_3_2 if !BR2_avr32
>>> default BR2_GCC_VERSION_4_2_3 if BR2_avr32
>>> help
>>> Select the version of gcc you wish to use.
>
>Shinya> GCC 4.3.2 bootstrap failed;  mips, mips4 and o32 on Ubuntu 8.04.01.
>
>Strange, mips worked here (Debian)
>
>uclibc.org/~jacmet/br/mips.log
>
>And 4.2.4 works for you?
>
>-- 
>Bye, Peter Korsgaard


      
