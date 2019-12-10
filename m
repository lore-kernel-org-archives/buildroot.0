From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 10 Dec 2019 15:20:45 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-12-09
In-Reply-To: <20191210071814.D362187B3D@hemlock.osuosl.org>
References: <20191210071814.D362187B3D@hemlock.osuosl.org>
Message-ID: <CAJ4jsaceHWQxOBT=mCgLF1YFhp=BMjCJAs-Vnobs+=PSuAeFTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 10, 2019 at 4:18 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

>     arm      |      modem-manager-1.12.0      | NOK | http://autobuild.buildroot.net/results/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a |

This should have been solved by

    https://patchwork.ozlabs.org/patch/1186596/

which was left behind.

Even with that patch applied it fails with

2019-12-10T15:13:20 Making all in test
2019-12-10T15:13:20 CCLD     mmsmspdu
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
../src/.libs/libhelpers.a(mm-modem-helpers.o): in function
`mm_3gpp_cesq_response_to_signal_info':
2019-12-10T15:13:20 mm-modem-helpers.c:(.text+0x3e38): undefined
reference to `mm_signal_new'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3e44): undefined reference to
`mm_signal_set_rssi'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3e5c): undefined reference to
`mm_signal_new'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3e68): undefined reference to
`mm_signal_set_rscp'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3e88): undefined reference to
`mm_signal_new'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3e98): undefined reference to
`mm_signal_set_ecio'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3eb0): undefined reference to
`mm_signal_new'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3ebc): undefined reference to
`mm_signal_set_rsrq'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3edc): undefined reference to
`mm_signal_new'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3eec): undefined reference to
`mm_signal_set_rsrp'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
../src/.libs/libhelpers.a(mm-modem-helpers.o): in function
`mm_parse_cclk_response':
2019-12-10T15:13:20 mm-modem-helpers.c:(.text+0x7484): undefined
reference to `mm_network_timezone_new'
2019-12-10T15:13:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x7494): undefined reference to
`mm_network_timezone_set_offset'
2019-12-10T15:13:20 collect2: error: ld returned 1 exit status
2019-12-10T15:13:20 make[4]: *** [Makefile:541: mmsmspdu] Error 1
2019-12-10T15:13:20 make[3]: *** [Makefile:509: all-recursive] Error 1
2019-12-10T15:13:20 make[2]: *** [Makefile:441: all] Error 2
2019-12-10T15:13:20 make[1]: *** [package/pkg-generic.mk:260:
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/build/modem-manager-1.12.0/.stamp_built]
Error 2
2019-12-10T15:13:20 make: *** [Makefile:23: _all] Error 2

-- 
Carlos Santos <unixmania@gmail.com>
