From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 17 May 2016 23:06:11 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <CAGm1_ks=dA8dd=rmHx2-dEBhvzrhEwH7c9Oq9YuAtxBxowzaCQ@mail.gmail.com>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
 <CAGm1_ks=dA8dd=rmHx2-dEBhvzrhEwH7c9Oq9YuAtxBxowzaCQ@mail.gmail.com>
Message-ID: <CAGm1_ku=nEwxU+AhqBL-gKu7+LwnvV_8o0n88d27LoDYdbNS+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 17, 2016 at 11:03 PM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Tue, May 17, 2016 at 3:36 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> Rodrigo, Geoff, Gustavo, Vicente, Gwenhael, Samuel, Yegor, Ben,
>> Clayton, Bernd, please see below, there are questions/issues for you.
>>
>> Note to others: there are also plenty of build failures below with
>> nobody assigned. Feel free to pick some of them and investigate. Thanks!
>>
>> On Tue, 17 May 2016 08:30:22 +0200 (CEST), Thomas Petazzoni wrote:
>>
>>>        sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d0b84c6b512f530c30a917b2f5abd2bc9dadd112/
>>>        sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d3099b8fd163772d5601a081c8125a59d186e8cd/
>>>       xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3c2aaab721a29399e9a945c3a7645c54b3e90410/
>>>      powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ce9c0d25448cddc29c398f408a7c5a238451b179/
>>>      powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b17b75bb211d0a0ff2dbc75756809775b17d5637/
>>
>> Those would all be fixed by applying
>> http://patchwork.ozlabs.org/patch/622247/.
>>
>>> microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0b9db4c5cfd80d75eb620dbf7a6201faed7230a1/
>>>        nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9b8c5d2cd31d63ae70b41d1434868c83e65b8423/
>>
>> Fixed by
>> https://git.buildroot.net/buildroot/commit/?id=f01f2cde09527319c079d1a076143334411912a3.
>>
>>>          arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/31ec8fed2390b8fece70ec7168019c736fe66b01/
>>
>> This is a long-standing issue of static linking with chocolate-doom, it
>> forgets to link with libstdc++. Rodrigo, you contributed this package,
>> and already fixed some static linking issues with it. Can you look at
>> this one, or alternatively decide that we don't want to support static
>> linking for chocolate-doom?
>>
>>>          arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/80a75aaebd55fca1220048d1d4dfb434ce4d9804/
>>>       x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/ae1e3a33a1c2b7433ca7a04659467e2017756b00/
>>
>> Gustavo, any solution in sight for this collectd problem?
>>
>>>       x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/12c91b8ae633112504c5aead84301b3107c23ac6/
>>
>> I guess this is a musl build issue. I don't think we have a patch
>> pending for this one. Contributions welcome.
>>
>>>          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a72771300d817ba8d411abd4fa1d232911422f5e/
>>>          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a8e7bb8f7616aedbf71e7c653004c6ffe00c0790/
>>>          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/fe5e5e4a46007150692cbbc6652a6f2c3a1ee6b7/
>>
>> Those would be fixed by applying
>> http://patchwork.ozlabs.org/patch/622248/.
>>
>>>          arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/a8b7208ef9068866365843b11b99d24183d4c7ea/
>>
>> This one would be fixed by applying
>> http://patchwork.ozlabs.org/patch/622682/.
>>
>>>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/0f30c6dbf2186af5bfda7fe051db385a389b2251/
>>>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/ee836d09aadf7fb43f25d59bdcd0658f55844083/
>>
>> Vicente, could you help with this one?
>>
>>> microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/3f44a1f30a88dbe4a3a83055267b472b58769e15/
>>> microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/fc2446484d4167c4f99c4aeccf3532d021d02046/
>>
>> I've started a build with gcc 6.x on Microblaze to see if the problem
>> still exists. If it does, I will report a bug to the gcc developers and
>> send a patch to mark this package as not available on Microblaze.
>>
>>>       x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6664189a6f3a815978e8d0a1d7ef408ca47e2874/
>>
>> Geoff, can you look into this one?
>>
>>>      powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/163fbc2ccd88282be2f5d5354b125429bfb4ff4b/
>>
>> Gustavo, another _restgpr_29_x issue, and this is with a Buildroot
>> toolchain, so we can't blame an old CT-NG or Sourcery toolchain here :)
>>
>>>       x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/714019031fb8c8f70c1838aa18e4ec1e4abf165e/
>>
>> internal compiler error: Segmentation fault
>>
>> Gwenhael, can you look into this problem?
>>
>>>          arc |       host-gdb-arc-2015.12-gdb | NOK | http://autobuild.buildroot.net/results/c6d9ee66842fbb2457277d02d241c439b43bd568/
>>
>> Missing dependency on flex it seems. Probably we need to do like we do
>> for binutils, and depend on host-flex when the gdb version is fetched
>> from Git.
>>
>>>          arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/42a8d07101d8d954511d1c884ecb66e8d861899e/
>>
>> error: #warning requested reentrant code
>>
>> Geoff, in fact it seems like host-go itself needs thread support in the
>> target toolchain to build properly, so our plan to have only the Go
>> packages depend on BR2_TOOLCHAIN_HAS_THREADS does not work.
>>
>> Can you cook a solution for this?
>>
>>>          arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9e68e8bf8b51c7d8fc0a2aff1ac617dfaa36b648/
>>
>> Musl build issue.
>>
>>>     mips64el |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/43ca1b103434ae582fdf93cb5912b311960f303b/
>>>          arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/415e2100dc59d35e58646c07f7cdccabecdda966/
>>>          arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/65edaf15180135b4a30b72ea92c35ae16f001a59/
>>>         i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/391e71a988250ea66ec4dbee6f60fdce9eaf2766/
>>
>> Fixed by
>> https://git.buildroot.net/buildroot/commit/?id=b7b9426ccc9bc854e337fec8bcfdda150762bcf6.
>>
>>>       mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/ac7c9b3ad2e52abfe6b79a80045e4218eeb87175/
>>>       mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/1a778bbcc72a8f0df3b0d25a49c03a25db1b440d/
>>
>> SSP issue with the MIPS toolchains. Vicente?
>>
>>>     mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/1482e2702553f083a500c055c2ef8e6ae2a85182/
>>
>> src/math/src/poly.findroots.c:305:9: error: non-floating-point argument in call to function '__builtin_isnan'
>>
>> Vicente?
>>
>>>         i686 |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/37b5fdc0fa320aad98493f7ae7d4e70a84852266/
>>>         sh4a |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/81e9bfc79d6b4ebba7ead62b7abac68bd9968e88/
>>
>> ld: cannot find -llirc
>>
>> Weird, needs investigation. Parallel build issue, maybe?
>>
>>>          arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/0d247c58f788282f92112ac1afb616fa2631c32c/
>>
>> checking for uuid_create in -lc... no
>> configure: error: Cannot find libuuid uuid_generate nor libc uuid_create. Use LDFLAGS=-Ldir to specify their location.
>>
>> No config.log has been saved. Samuel, can you have a look?
>>
>>>          sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/78e898689c3de1549d92f00b0d39cc0771417027/
>>>          sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/7982e81a850f579d51021f620cd3c1e8bd641771/
>>>          sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/bf45e609befd6a1c00dc75578f4c363657958380/
>>>          arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/97491961a9a04de03119c08ac21e127971c1202a/
>>
>> Some of these will be fixed by the Buildroot toolchains rebuild that
>> was deployed today. Let's wait and see if we still have build failures.
>>
>>>         bfin | mtr-66de3ecbab28b054b868a73... | NOK | http://autobuild.buildroot.net/results/e05632e0b160ee995ce46aaf3ceddf46d3658adf/
>>
>> Uses fork(), needs a dependency on BR2_USE_MMU.
>>
>>>          sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/a5a32e8b18583f0c40da22e735ef5e2ed1e415a6/
>>
>> Toolchain issue:
>>
>> /tmp/ccF0zot6.s: Assembler messages:
>> /tmp/ccF0zot6.s:19767: Error: pcrel too far
>>
>> Samuel, can you retry with the latest gcc/binutils version on SH4 and
>> see if it fixes the problem?
>>
>>> microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/1fd1eff35d7945f352561d0eb9bb5d7360942a42/
>>
>> operf_utils.cpp: In function 'void OP_perf_utils::op_get_kernel_event_data(mmap_data*, operf_record*)':
>> operf_utils.cpp:1412:6: error: 'rmb' was not declared in this scope
>>   rmb();
>>
>> Architecture not supported it seems.
>>
>>>          arm |                     php-5.6.21 | NOK | http://autobuild.buildroot.net/results/c67d00b19da8bcb2e6070d3f048931b36d5ad467/
>>
>> Forgets to link with pthread. Gustavo?
>>
>>>       x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/32bab29b2ed19ebf18d34f7dc3324161c89dbda9/
>>
>> Musl build issue. Anyone to look into this?
>>
>>>       mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/382094c3dedfdb3e2489851d8fb1255e440ce39c/
>>
>> SSP MIPS toolchain issue...
>>
>>>         sh4a |             qt5serialbus-5.6.0 | NOK | http://autobuild.buildroot.net/results/6176a24799b5d80312be954089efbbb498fa1571/
>>
>> Seems like this package needs a dependency on some recent enough kernel
>> headers. Yegor, since you added this package, can you have a look?
>
> CANFD_MTU stuff seems to be added in kernel 3.5. How can I express
> this in Buildroot dependency terms?

Something like this I suppose :-)

depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5

Will send a patch.

>>
>>>          arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/08b5fa07c85e38a771f7d52e2e09fb62901e156c/
>>>       xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/abb2e06d0b19922627d9a76c75858b86eca1cc2d/
>>
>> configure: error: in `/home/buildroot/autobuild/run/instance-0/output/build/rsyslog-8.9.0':
>> configure: error: PgSQL library is missing
>>
>> Anyone to look into this?
>>
>>>      sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/99728d80caf490ad2cba78b9c50ec5385c5e6601/
>>>      sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/9134c246e451061b2ad42d0508d073f18f19961a/
>>>      sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/c22585c193c48cb1d2ad3bb7ecde73620562d7c8/
>>
>> This should be fixed by https://git.buildroot.net/buildroot/commit/?id=08fe324b8b0e12a2ada22db8ee268a99cdde4322.
>>
>>>        sparc |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/5859b8e0a1775ecd6afa13132549966080739837/
>>
>> ../../src/libstrongswan/.libs/libstrongswan.so: undefined reference to `__atomic_fetch_sub_4'
>> ../../src/libstrongswan/.libs/libstrongswan.so: undefined reference to `__atomic_compare_exchange_4'
>> ../../src/libstrongswan/.libs/libstrongswan.so: undefined reference to `__atomic_fetch_add_4'
>>
>> Gustavo?
>>
>>>          arc |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/67f574af0cc4348ffe2bce026c44766e49c29124/
>>
>> Forgets to link with pthread. Ben, since you added this package, can
>> you have a look?
>>
>>>     mips64el |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/b047bfa84af0e88f4efa5e1ed7ea5639d120b947/
>>
>> Network issue, Peter has already added the file to sources.b.o to avoid
>> the problem in the future.
>>
>>>          arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/cebfd7e29a6521ae7ba4c229586a3ef662aa9de1/
>>
>> libustr-debug-1.0.so.1': File exists
>>
>> Gah, smells like parallel installation issue. Clayton, since you added
>> this package, can you have a look?
>>
>>>     mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/a1168399adb9fd549d610e4d18aa024d9c8bcbff/
>>>     mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/61eb30d455cf767f4317b0898c2219b2ab695fc0/
>>
>> Vicente?
>>
>>>          arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/1a7893c13f6144e0ecd9f37f2f047c596ccedd35/
>>
>> ld: cannot find -lGL
>>
>> Bernd?
>>
>>>         bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/0a5d32f0fa28ecdd540e100951b116708feec6b5/
>>>         bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/75286a0319094a82934eebeeda6ac4f0b0f36743/
>>
>> I've looked into this, it's the infamous _ prefix issue on Blackfin. It
>> should be relatively easy to fix, I'll send a patch.
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
