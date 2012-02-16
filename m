From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Thu, 16 Feb 2012 11:45:28 +0100
Subject: [Buildroot] Illegal instruction Built bcc
In-Reply-To: <201202152155.08608.arnout@mind.be>
References: <4F3BF8DC.6080608@labri.fr> <201202152155.08608.arnout@mind.be>
Message-ID: <4F3CDE48.2030605@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 15/02/2012 21:55, Arnout Vandecappelle a ?crit :
> On Wednesday 15 February 2012 19:26:36 Jigar SOLANKI wrote:
> 
>> Hi all,
> 
>>
> 
>> I'm trying to compile and run :
> 
>>
> 
>> #include <stdlib.h>
> 
>>
> 
>> int main(){
> 
>> return 0
> 
>> }
> 
>>
> 
>> on a Leon3/Sparc+Linux architecture.
> 
>>
> 
>> When I compile it with the toolchains binaries provided by Gaisler, it
> 
>> works well (sparc-linux-gcc) it works well
> 
>> Whereas when I compile it with a toolchain that I have built using the
> 
>> BCC sources, I get an illegal instruction when trying to run it.
> 
>>
> 
>>
> 
>> Where does that come from please ?
> 
> 
Thanks for your answer.

Actually, I use the buildroot package provided by Gaisler on their
website to build a Linux for the Leon3 architecture.
They provide toolchains binaries as well and also the bcc sources.

So what I have is a working Leon3+Linux architecture on a Virtex5 FPGA card.
What I'm trying to do is to compile and run a test program on the Linux.
Then comes the issue : when I compile this test code with the cross
compiler binary provided, it compiles and runs well on the Linux.

But, when I try to compile it with a cross compiler that I have built
using the bcc sources, it fails with the illegal instruction trap.

Here is the output of both -v :


Provided cross compiler : sparc-linux-gcc -v

Using built-in specs.
Target: sparc-leon-linux-gnu
Configured with:
/home/eiselekd/linux-build-dir/linuxbuild/build-ct/ct/leon_multilib_basic/targets/src/gcc-4.4.2/configure
--build=i686-build_pc-linux-gnu --host=i686-build_pc-linux-gnu
--target=sparc-leon-linux-gnu
--prefix=/opt/sparc-linux-4.4.2-toolchains/multilib
--with-sysroot=/opt/sparc-linux-4.4.2-toolchains/multilib/sparc-leon-linux-gnu//sys-root
--enable-languages=c,c++,fortran --enable-multilib --with-cpu=
--with-pkgversion=crosstool-NG- --enable-__cxa_atexit
--disable-libmudflap --with-host-libstdcxx='-static-libgcc
-Wl,-Bstatic,-lstdc++,-Bdynamic -lm'
--with-gmp=/home/eiselekd/linux-build-dir/linuxbuild/build-ct/ct/leon_multilib_basic/targets/sparc-leon-linux-gnu/build/static
--with-mpfr=/home/eiselekd/linux-build-dir/linuxbuild/build-ct/ct/leon_multilib_basic/targets/sparc-leon-linux-gnu/build/static
--with-ppl=/home/eiselekd/linux-build-dir/linuxbuild/build-ct/ct/leon_multilib_basic/targets/sparc-leon-linux-gnu/build/static
--with-cloog=/home/eiselekd/linux-build-dir/linuxbuild/build-ct/ct/leon_multilib_basic/targets/sparc-leon-linux-gnu/build/static
--enable-threads=posix --enable-target-optspace
--with-local-prefix=/opt/sparc-linux-4.4.2-toolchains/multilib/sparc-leon-linux-gnu//sys-root
--disable-nls --enable-symvers=gnu --enable-c99 --enable-long-long
Thread model: posix
gcc version 4.4.2 (crosstool-NG-)


and Built cross compiler (which is what I do need) sparc-elf-gcc -v :
sparc-elf-gcc -v
Reading specs from
/opt/sparc-elf-3.4.4-1.0.38/bin/../lib/gcc/sparc-elf/3.4.4/specs
Configured with: ../gcc-3.4.4/configure --target=sparc-elf
--prefix=/opt/sparc-elf-3.4.4 --with-gnu-as --with-gnu-ld --verbose
--enable-languages=c,c++ --disable-shared --disable-nls
--with-pkgversion=BCC 3.4.4 release 1.0.38 --with-newlib --with-cpu=leon
Thread model: single
gcc version 3.4.4


(I also tried with a 4.4.2 too : same illegal instruction issue).

> Most likely you configured buildroot for a subarchitecture that is not
> 
> supported by your platform. You can run the working cross-compiler with
> 
> the -v option; in the long list of configure options you'll see something
> 
> like '--with-cpu=sparcsfleon'. That is the subarchitecture you should
> 
> use for buildroot too.
> 
> 
> Regards,
> 
> Arnout
> 
> 
> -- 
> 
> Arnout Vandecappelle arnout at mind be
> 
> Senior Embedded Software Architect +32-16-286540
> 
> Essensium/Mind http://www.mind.be
> 
> G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
> 
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> 
> GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> 
> 


-- 
Jigar SOLANKI

LaBRI - UMR 5800
Universit? Bordeaux 1
351 Cours de la Lib?ration
F-33405 Talence Cedex
Phone : (+33) 5 4000 24 87
Fax   : (+33) 5 4000 66 69
Web   : http://www.labri.fr/perso/solanki

* Please do not print this e-mail unless it's really necessary *
---


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 554 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120216/cab5a660/attachment.asc>
