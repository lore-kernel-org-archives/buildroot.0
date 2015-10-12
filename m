From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Oct 2015 22:39:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-10-11
In-Reply-To: <20151012063018.81C74101B38@stock.ovh.net>
References: <20151012063018.81C74101B38@stock.ovh.net>
Message-ID: <20151012203929.GE3735@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On 2015-10-12 08:30 +0200, Thomas Petazzoni spake thusly:
> Build statistics for 2015-10-11
>       xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/2bda58abcca8e90a8ff8f53e7222b12708d28d79/
>       xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/63c3d33f65ccabbdafc95071a645fb86b4406695/
>       xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/b59995e4a083a9a4b3f029669cff07ac5ac4afdd/
>       xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/cba1ccf8096b07ef5284964d0c29a07202bd6259/
>       xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/6e28ef0c89ec675f981669dcc924daaeaa00888f/
>       xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/aedfcdf57aba950b8d4727dbfa5cc1bbb106832d/
>       xtensa |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/f0a5936ef251afb5eeb10bb0ba351398d9b3482d/
>       xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/556336602f2c4bab9f0cf122722484a967f468a9/
>       xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/32c79dacb54e052a1af0bc0c38369924ce5d29b9/
>       xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/cffd424ecaac81eba7d6de8924e4c21ef212991b/
>       xtensa |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/b5386052230b5a41d7bda440179e5393bbac564c/
>       xtensa |                   libnl-3.2.26 | NOK | http://autobuild.buildroot.net/results/6f7f25540c603b231db3000275b801a34870bdb7/

All the xtensa build failures are caused by the newly introduced
-mauto-litpools gcc option:

    configure:3511: checking whether the C compiler works
    configure:3533: /ssd1/thomas/autobuild/instance-0/output/host/usr/bin/xtensa-linux-gcc
    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls
    -mauto-litpools  -Os  -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
    -D_FILE_OFFSET_BITS=64  -lm conftest.c  >&5
    xtensa-linux-gcc: error: unrecognized command line option '-mauto-litpools'
    configure:3537: $? = 1
    configure:3575: result: no

I gues that's because our pre-built toolchains do not understand that
option yet.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
