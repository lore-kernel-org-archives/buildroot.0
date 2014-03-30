From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 30 Mar 2014 13:59:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-03-28
In-Reply-To: <20140329175452.5c711852@skate>
References: <20140329073011.D16F2101349@stock.ovh.net>
 <20140329175452.5c711852@skate>
Message-ID: <CAGm1_kuaabmOkyg60eU+PkWuwOgCQ3Kci3yX=8SXdG=jjnaeqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 29, 2014 at 5:54 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Aaron, Sonic, Anton, Waldemar, William, Spenser, Yegor, Gustavo, Baruch, Marcelo,
>
> Below, some analysis of the build failures, amongst which certain
> problems need your attention. Could you have a look at the list below
> and look for your name?
>
> Thanks!
>
> On Sat, 29 Mar 2014 08:30:11 +0100 (CET), Thomas Petazzoni wrote:
>
>>    aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/25cfb126c01aa70f4666709dddbff298813b5c69/
>
> Fixed by
> http://git.buildroot.net/buildroot/commit/?id=3b44149a2251081d9180651ae5f8a184705e3835.
>
>>       i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/06b4f2ee7fdd7cbd893c91c761270640b747a23b/
>>        arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/1fe1f874b1d4dddd1139e62c125c80ad62298e76/
>>   mips64el |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/bf82bc565985410445d9cea1db3f622bede5c1d1/
>
> This is waiting on Samuel series:
> http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/79108/
>
>>       bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/41cf01e1908ec820e3587454758fee5ca44f3a2d/
>
> This is a Blackfin failure. Sonic, Aaron, can you have a look ?
>
> {standard input}: Assembler messages:
> {standard input}:4: Error: syntax error. Input text was _compat.elfutils_0.122.dwarf_bytesize.
> {standard input}:4: Error:
> make[4]: *** [dwarf_bytesize.os] Error 1
>
>>      nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/7da32ca8178aa6bada06dfaea38e9e693fba0db2/
>
> fallocate64() problem. Ezequiel, can you have a look?
>
>>     mipsel |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/1e3d486e7ad2a90bf116ba1879cfc6119fc5bec4/
>>       i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/4113d2684b7991862f7dfa93d741891f295a5ad9/
>>     x86_64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/e971d07f0f1ad32ba04f2784bc3cc0e5e541d130/
>
> Samuel's series needed.
>
>>        arc |            imagemagick-6.8.8-9 | NOK | http://autobuild.buildroot.net/results/2139bf93a528780904db4258c04636916931621c/
>
> ARC compiler error. Anton?
>
>   CC       magick/magick_libMagickCore_6_Q16_la-cipher.lo
> magick/cipher.c: In function 'IncrementCipherNonce.constprop.2':
> magick/cipher.c:535:1: internal compiler error: Segmentation fault
>  }
>  ^
>
>>       bfin |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/65329510868baba49147c206d50c7f5b0c602806/
>
> Aaron, Sonic, the build error is caused by the uClibc configuration in
> Blackfin toolchain being different than the one used by default in
> Buildroot. Possible options are:
>
>  * You change the uClibc configuration in the Blackfin toolchain for
>    the future releases, so that this problem will disappear.
>
>  * We disable this package for Blackfin external toolchains.
>
> cftoken.l: In function 'yycf_switch_buffer':
> cftoken.l:729: error: 'GLOB_TILDE' undeclared (first use in this function)
> cftoken.l:729: error: (Each undeclared identifier is reported only once
> cftoken.l:729: error: for each function it appears in.)
>
>>        arc |                  lcdproc-0.5.6 | NOK | http://autobuild.buildroot.net/results/a3a6cd0ce6bb48a5d9ef7c411630fea0014479df/
>
> Anton ?
>
> /home/test/test/2/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld: bayrad.so: hidden symbol `__fini_array_end' isn't defined
> /home/test/test/2/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld: final link failed: Bad value
> collect2: error: ld returned 1 exit status
>
>> microblazeel |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/025cca687e4a2f848d77031c2e50135f137b7767/
>
> Waldemar, William, Spenser, can you help us fix this problem? The only
> thing needed to fix it is to know whether the stack is growing downward
> or upward on the Microblaze architecture.
>
>>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/fd8fef776e079600ae0f8ded2763cd3fca39ebee/
>>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/11c352d0f676fc7737ba3a35747474a93ff01d4b/
>>     x86_64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/df805da50cdfea4ccee112f8b3c65655d1e5eee8/
>>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/00532a8356143baa308c4f832775d8ee28e27e66/
>>     x86_64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/f90465c77540308d7807dde4308e5ebff07ec9ba/
>>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/497f31a2147cd7ce136ca86a4bdc033088b8272f/
>>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/960cd673632fb4ae598ea6b278cb9664c6dc1ad0/
>
> Yegor, can you have a look ?

I'll do next week. I've made a quick test with the first failed
config. I've stripped it down to build settings and libuci, but it
didn't fail on Ubuntu 13.10.

Yegor
