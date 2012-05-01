From: Eial Czerwacki <eial@scalemp.com>
Date: Tue, 01 May 2012 11:45:19 +0300
Subject: [Buildroot] enabling libc.a generation
In-Reply-To: <4F9F9EBE.2070303@mind.be>
References: <4F9F819C.80509@scalemp.com> <4F9F9EBE.2070303@mind.be>
Message-ID: <4F9FA29F.90309@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/2012 11:28 AM, Arnout Vandecappelle wrote:

> On 05/01/12 08:24, Eial Czerwacki wrote:
>> I have a little issue, while trying to compile a small file within a
>> buildroot generated env, I get this:
>> /usr/lib/gcc/i686-unknown-linux-uclibc/4.2.4/../../../../i686-unknown-linux-uclibc/bin/ld:
>>
>> cannot find -lc
>> collect2: ld returned 1 exit status
> 
>  It would help if you at least specified the command you used to start
> the link.  You can also add the -v option to gcc to see the exact
> parameters of the call to ld, including the search path.
> 
>  libc.a and libc.so should be present in output/staging/usr/lib.  But I
> see you're calling a gcc in /usr...  Is this a compiler running on the
> target?  In that case, you should have libc.so and libc.a in /usr/lib.
> 
>  Regards,
>  Arnout


Hello Arnout,

I have chroot which was created using buildroot, I'm chrooting into it
an run a simple compilation, e.g sh-4.1# gcc test.c -o test

here is the output gcc -v:
Using built-in specs.
Target: i686-unknown-linux-uclibc
Configured with:
/home/envdev/buildroot/output/toolchain/gcc-4.2.4/configure
--prefix=/usr --build=i686-pc-linux-gnu --host=i686-unknown-linux-uclibc
--target=i686-unknown-linux-uclibc --enable-languages=c
--with-gxx-include-dir=/usr/include/c++ --disable-__cxa_atexit
--enable-target-optspace --disable-libgomp --with-gnu-ld
--disable-libssp --disable-multilib --enable-tls --enable-shared
--disable-nls --enable-threads --with-arch=i686 --with-tune=i686
--disable-largefile
Thread model: posix
gcc version 4.2.4

as for libc.so, here is the relevant output:
sh-4.1# find . -name "libc*"
./lib/libcrypt.so.0
./lib/libc.so.0
./lib/libcrypt-0.9.32.so
./usr/include/bits/libc-lock.h
./usr/lib/libcurses.a
sh-4.1# ls -l ./lib/libc.so.0
lrwxrwxrwx    1 root     root            19 Apr 30 23:57 ./lib/libc.so.0
-> libuClibc-0.9.32.so

Eial.
