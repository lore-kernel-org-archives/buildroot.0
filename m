From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Mar 2017 22:00:32 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-05
In-Reply-To: <20170306072844.3738B206EB@mail.free-electrons.com>
References: <20170306072844.3738B206EB@mail.free-electrons.com>
Message-ID: <20170306210032.GC3976@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2017-03-06 08:28 +0100, Thomas Petazzoni spake thusly:
> Detail of failures
> ===================
> 
>          arm |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/48c35bac7cf674e2bc55f9bd53b905ad5e212258

This is again caused by a mismatch between types defined by Khronos and
those in odroid-mali.

>         i686 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/e29a22a2d9c81c87d271c2a6e7d041d36c370adc
>         sh4a |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/6cc1212728248d5443fe9a367b4aeb3807ce623e

EGL not found...

>      powerpc |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/ab3565f6585e47573bcb62ef5e7250986c90d8e3

Static linking issue: polarssl build a 'benchmark' utility that links
with -lcrypto, which uses symbols fron libz, but libz is not pulled in
in a static build.

>          arm |                     putty-0.68 | NOK | http://autobuild.buildroot.net/results/3ade64119e327cc810282c1bcd89a8e7d229a73f
>          arm |                     putty-0.68 | NOK | http://autobuild.buildroot.net/results/3c26267f46f0653f2d40e03e5e4212e58e7ce177

Should be fixed by:
    https://git.buildroot.org/buildroot/commit/?id=18275a0420fd39817ea01e30f5d815c78dc72cc0

>         i686 |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/5a685a307678bbcfd87c6f1bd44b5648b4d397f9

error: 'struct timex' has no member named 'tai'

uClibc toolchain: fields missing? Not available in uClibc?

>          arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/29aa34c4e3b10739a13db6d86b3f0691668480e9

error: failure memory model cannot be stronger than success memory model
for '__atomic_compare_exchange'
  return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 0, __m1, __m2);

Some atomic issue?

>      powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/8ac322af1293eb195f2eab80bdfe1b87931948b6

Static linking issue, again missing -lz.

>          arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/2e214d6b2de1008858f4129e8000dd1202302117

This is caused by the ARC Synopsys toolchain which has a uClibc without
support for quota.

>          arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/256ffb34fa890bae23ff39783006e0741e2abc49

undefined reference to `tputs'

Static linking issue, needs to link against ncurses.

>          arm | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/16a7c30f0627c51b171ec71b2e7f24444e38526d

undefined reference to `libintl_bindtextdomain'

Static linking issue, needs -lintl.

>          arm |     xserver_xorg-server-1.19.2 | NOK | http://autobuild.buildroot.net/results/4c24477f96c9eab8cfd8cce38eea630d738e29a5

Download issue due to certificate error. Ignore.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
