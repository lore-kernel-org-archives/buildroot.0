From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Mar 2011 13:08:55 -0300
Subject: [Buildroot] Buildroot toolchain for arm
In-Reply-To: <AANLkTi=o3wKS3BhnGrN+g1emwedgsnN3GtEbMYz4x560@mail.gmail.com>
References: <AANLkTi=o3wKS3BhnGrN+g1emwedgsnN3GtEbMYz4x560@mail.gmail.com>
Message-ID: <4D8A1B17.3030201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/23/11 08:50, Chia-Hung Chou wrote:

> I want to build the toolchain to compile into fully thumb
> instruction. In the menuconfig, I add the "--with-mode=thumb" into gcc
> options.
> After I make the buildroot, there are some Errors : 
>     make[5]: *** [libmudflap.la <http://libmudflap.la>] Error 1
>     make[5]: Leaving directory
> '/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.5-final/arm-unknown-linux-uclibic/libmudflap'
>     make[4]: *** [all-recursive] Error 1
>     make[4]: Leaving directory
> '/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.5-final/arm-unknown-linux-uclibic/libmudflap'
>     make[3]: *** [all] Error 2
>     make[3]: Leaving directory
> '/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.5-final/arm-unknown-linux-uclibic/libmudflap'
>     make[2]: *** [all-target-libmudflap] Error 2
>     make[2]: Leaving directory
> '/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.5-final'
>     make[1]: *** [all-target-libmudflap] Error 2
>     make[1]: Leaving directory
> '/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.5-final'
>     make: ***
> [/home/chiahung/buildroot-2011.02/output/toolchain/gcc-4.4.4.5-final/.compiled]
> Error 2
>  I try a lot of ways but I still can't solve it. Is there any way to
> solve or to build a toolchain that could compile code into fully thumb
> instruction??
> 
> thanks~

Yes, you might want to use "-mthumb" in BR2_TARGET_OPTIMIZATION.
See the gcc manpage.
Regards.
