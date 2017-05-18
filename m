From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 May 2017 17:57:58 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-17
In-Reply-To: <20170518063152.500E82080B@mail.free-electrons.com>
References: <20170518063152.500E82080B@mail.free-electrons.com>
Message-ID: <20170518175758.6fb2c43d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

>       successes : 206
>        failures : 8  

Wowo!

On 8 failures, we have:

 - 5 already fixed
 - 1 with a patch in progress
 - 2 that need investigation

Looks good!

On Thu, 18 May 2017 08:31:52 +0200 (CEST), Thomas Petazzoni wrote:

>         bfin |                       icu-58.2 | NOK | http://autobuild.buildroot.net/results/4828d9fc18283bda4c07af2c67f8ca9490dca28d | ORPH

Toolchain issue:

  bfin-buildroot-linux-uclibc/bin/ld: LINKER BUG: .rofixup section size mismatch

Waldemar, do you have an idea? Is this a recent regression?

>     mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/c29d2ffffe960c5d3e565ff00706ca6fd7622f1d |     

Still working on the patch. Hopefully sent today/tomorrow.

>       xtensa |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/94c111c8014aa98998efa0af2ed726002b7fdca6 |     
> microblazeel |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/fb7f7cb3bd903d90c9d9bd97a49acbfb6d137f29 |     

Both fixed by
https://git.buildroot.org/buildroot/commit/?id=2677210f545c3f3e8c52c973e08c3a460c521e5b

>          arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/501101000e36ea17deab198b12f9f611641f43fd |     

/home/test/autobuild/run/instance-3/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/EGL/eglplatform.h:125:22: fatal error: X11/Xlib.h: No such file or directory

Apparently my fix
https://git.buildroot.net/buildroot/commit/package/mpv?id=4b72b54fd3b0074864e5ad36ec2fdcd30f4d58eb
is not sufficient.

>       x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/8dbaaca8d894bb335bc876a9f36a874364dd34f4 |     

Fixed by https://git.buildroot.org/buildroot/commit/?id=f884abe4de72b942406ca16c4f54e02a0c57cce4.

>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/3e15dad9ee4803cf465277b999dca69318fda09d |     

Fixed by https://git.buildroot.org/buildroot/commit/?id=beb6524225f12549a216183abc07745f8d36e764

>      powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/ea140fa600616f20e282902f25899f600741b123 |     

It's the rabbitmq-c static failure, identical to the previous one. Not
sure why the log file doesn't end in a normal way (which has prevented
the autobuild infra from finding out the reason of the build failure).


-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
