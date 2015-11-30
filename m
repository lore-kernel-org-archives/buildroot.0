From: Arthur Lambert <lambertarthur22@gmail.com>
Date: Mon, 30 Nov 2015 14:45:32 +0100
Subject: [Buildroot] Compile kernel module within buildroot package
In-Reply-To: <20151119183653.GA1025@arthur-bzh>
References: <20151119183653.GA1025@arthur-bzh>
Message-ID: <CAGpqJgrjA6_k97GEEbzuCNA3Hs=VbhO-dV2ddvevir-XwDbV6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

No one for this problem ?

Thanks,
Arthur.

2015-11-19 19:36 GMT+01:00 Arthur LAMBERT <lambertarthur22@gmail.com>:
> Hi all,
>
> I am currently using the 2015.08 version of buildroot. Kernel module compilation
> is broken :
>
> [arthur] make lttng-modules-rebuild
> rm -f /home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/.stamp_staging_installed
> rm -f /home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/.stamp_target_installed
> rm -f /home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/.stamp_images_installed
> rm -f /home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/.stamp_host_installed
> rm -f /home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/.stamp_built
>>>> lttng-modules 2.6.0 Building
>>>> lttng-modules 2.6.0 Building kernel module(s)
> grep: /.config: No such file or directory
>
> I found a fix here : http://lists.busybox.net/pipermail/buildroot/2015-September/138543.html
>
> next try after applying the fix :
>
> [arthur] make lttng-modules-rebuild
> rm -f /home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/.stamp_staging_installed
> rm -f /home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/.stamp_target_installed
> rm -f /home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/.stamp_images_installed
> rm -f /home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/.stamp_host_installed
> rm -f /home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/.stamp_built
>>>> lttng-modules 2.6.0 Building
>>>> lttng-modules 2.6.0 Building kernel module(s)
> PATH="/home/arthur/work/buildroot/2015_08/output/host/bin:/home/arthur/work/buildroot/2015_08/output/host/sbin:/home/arthur/work/buildroot/2015_08/output/host/usr/bin:/home/arthur/work/buildroot/2015_08/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/gnat/bin:/home/g179168/middleware/tools/bin/" BR_BINARIES_DIR=/home/arthur/work/buildroot/2015_08/output/images /usr/bin/make -j9 -C /home/arthur/work/buildroot/2015_08/output/build/linux-dreem_v2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/arthur/work/buildroot/2015_08/output/target CROSS_COMPILE=" /home/arthur/work/buildroot/2015_08/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-" DEPMOD=/home/arthur/work/buildroot/2015_08/output/host/sbin/depmod  PWD=/home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/. M=/home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/. modules
>   Building modules, stage 2.
>   MODPOST 0 modules
>>>> lttng-modules 2.6.0 Installing to target
>>>> lttng-modules 2.6.0 Installing kernel module(s)
> PATH="/home/arthur/work/buildroot/2015_08/output/host/bin:/home/arthur/work/buildroot/2015_08/output/host/sbin:/home/arthur/work/buildroot/2015_08/output/host/usr/bin:/home/arthur/work/buildroot/2015_08/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/gnat/bin:/home/g179168/middleware/tools/bin/" BR_BINARIES_DIR=/home/arthur/work/buildroot/2015_08/output/images /usr/bin/make -j9 -C /home/arthur/work/buildroot/2015_08/output/build/linux-dreem_v2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/arthur/work/buildroot/2015_08/output/target CROSS_COMPILE=" /home/arthur/work/buildroot/2015_08/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-" DEPMOD=/home/arthur/work/buildroot/2015_08/output/host/sbin/depmod  PWD=/home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/. M=/home/arthur/work/buildroot/2015_08/output/build/lttng-modules-2.6.0/. modules_install
>   DEPMOD  3.14.28
>
>
> Nothing seems to be compile :
>
> [arthur] find output/build/lttng-modules-2.6.0/ -name "*.ko"
> => no result
>
> Do I miss something ?
> Same result with master branch.
>
> Thanks,
> Arthur.
>



-- 
- Arthur LAMBERT
