From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Tue, 13 Jan 2009 12:40:29 +0100
Subject: [Buildroot] arch support
In-Reply-To: <496C5906.6080309@sonycom.com>
References: <87ljtgj44z.fsf@macbook.be.48ers.dk>	<496B5427.6040103@sonycom.com>	<87iqokh9mt.fsf@macbook.be.48ers.dk>
	<496C5906.6080309@sonycom.com>
Message-ID: <496C7DAD.5060907@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Guthrie wrote:
> Hi,
>> Strange - Are you building in a clean tree? What host are you using?
>>
> 
> Yes, building against a clean tree. I have tried this on 4 different 
> build hosts:
> 
> 1) Centos 5.0 i386: gcc4.1.2 - FAIL
> 2) Debian Etch i386: gcc4.1.2 - FAIL
> 3) Ubuntu 7.04 i386: gcc4.1.2 - FAIL
> 4) Ubuntu 8.10 i386: gcc4.3.2 - PASS
> 
> For all of the failures, the appropriate part of the config.log file is 
> as follows:
> 
> configure:2567: checking for suffix of object files
> configure:2588: 
> /tmp/br/powerpc/toolchain_build_powerpc/gcc-4.3.2-initial/./gcc/xgcc 
> -B/tmp/br/powerpc/toolchain_build_powerpc/gcc-4.3.2-initial/./gcc/ 
> -B/tmp/br/powerpc/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/bin/ 
> -B/tmp/br/powerpc/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/lib/ 
> -isystem 
> /tmp/br/powerpc/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/include 
> -isystem 
> /tmp/br/powerpc/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/sys-include 
> -c -g -Os  conftest.c >&5
> /tmp/br/powerpc/toolchain_build_powerpc/gcc-4.3.2-initial/./gcc/cc1: 
> error while loading shared libraries: libmpfr.so.1: cannot open shared 
> object file: No such file or directory

It looks like you are missing libmpfr which is used by gcc compilation process.
Buildroot should compile libmpfr for you before building gcc, I'm not sure
what is wrong.. Maybe some config setting is missing.
One solution would be to install the missing libmpfr on the host machine via
emerge/apt-get/or-whatever-you-use (after all it is used only on host machine,
right?).

HTH,
Hinko

-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si
