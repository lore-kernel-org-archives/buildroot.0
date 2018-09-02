From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Sep 2018 16:11:52 +0200
Subject: [Buildroot] Analysis of build results for 2018-09-01
In-Reply-To: <20180902060016.0253C2071E@mail.bootlin.com>
References: <20180902060016.0253C2071E@mail.bootlin.com>
Message-ID: <20180902161152.394d55d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Sep 2018 08:00:16 +0200 (CEST), Thomas Petazzoni wrote:

>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  10 |   0 |   0 |  10 |
>    2018.05.x |  16 |   0 |   0 |  16 |
>       master | 158 |   4 |   1 | 163 |

Wow, results over the last few days on the master branch are pretty
amazing: http://autobuild.buildroot.net/stats.php. Four build failures
per day, on a total of 150-170 build successes. Nice!

Let's have a look at the build failures for yesterday.

>          arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/808d1690240a4395cb0d953b77425fe31a85aeaf |     

This is another instance of:

libboost_atomic shouldn't have been installed: missing select in boost/Config.in

This is happening on ARM Cortex-M4. Fabrice: there are still a few
patches on Boost from you in patchwork. Is one of them fixing this ?

>     mips64el |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/9428b0aaae95288cf1d1cce0ca2492ae06b77960 |     

Fixed by:

  https://git.buildroot.org/buildroot/commit/package/domoticz?id=19b04d844277467fcd9c605f6b7ee57d979a630a

>       x86_64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/83ece99f846bbb6398b9f2cf6a4cccbae595e86e |     

Ah, it's the timeout occurring on Julien's machine during the configure
step of this package. Weird.

>         m68k |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/69cf9326539c8df8fa50c5e7acb2ce3bb985ede2 | ORPH

Fixed by:

  https://git.buildroot.org/buildroot/commit/?id=45215ffc8a75377228a477bebbf2ad9c78d40a35

>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fcf04ffdc27bb73fdeca0cc70a0dc09bcf3ec0d5 | ORPH

Fixed by:

  https://git.buildroot.org/buildroot/commit/?id=75f975f8ad7b9f8dee8f1de9ce3243d69763637b

Conclusion: on 4 build failures and one timeout:

 - 3 build failures are already fixed

 - 1 build failure on Boost remains to be fixed

 - the timeout is really mysterious.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
