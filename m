From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Jan 2016 23:36:24 +0100
Subject: [Buildroot] Error when running make linux-menuconfig
In-Reply-To: <CABi8WTzGpkv+g-cX=w9AXEOu4bz3901q9HPdKYfuMyMvH6B1ug@mail.gmail.com>
References: <CABi8WTzGpkv+g-cX=w9AXEOu4bz3901q9HPdKYfuMyMvH6B1ug@mail.gmail.com>
Message-ID: <56A551E8.80900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-01-16 17:12, FrAnKenStEiN MC wrote:
> I have done 
> make raspberrypi_defconfig
> make menu-config
> make linux-menuconfig
> i got :
> PATH="/home/larbi/PFA/rootBuild/buildroot/output/host/bin:/home/larbi/PFA/rootBuild/buildroot/output/host/sbin:/home/larbi/PFA/rootBuild/buildroot/output/host/usr/bin:/home/larbi/PFA/rootBuild/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:
> /usr/local/games"
> BR_BINARIES_DIR=/home/larbi/PFA/rootBuild/buildroot/output/images /usr/bin/make
> -j5 -C
> /home/larbi/PFA/rootBuild/buildroot/output/build/linux-592503752b6951972f161f04280683c5af38d173
> HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
> INSTALL_MOD_PATH=/home/larbi/PFA/rootBuild/buildroot/output/target
> CROSS_COMPILE="/home/larbi/PFA/rootBuild/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-"
> DEPMOD=/home/larbi/PFA/rootBuild/buildroot/output/host/sbin/depmod bcmrpi_defconfig
> make: ***
> /home/larbi/PFA/rootBuild/buildroot/output/build/linux-592503752b6951972f161f04280683c5af38d173:
> No such file or directory. Stop.
> make[1]: ***
> [/home/larbi/PFA/rootBuild/buildroot/output/build/linux-592503752b6951972f161f04280683c5af38d173/.config]
> Error 2
> make: *** [_all] Error 2
> 
> what's wrong ? thanks


 Looks like there's something wrong (again) with the dependencies in the kconfig
infra. I'll have a look.

 Simple workaround: explicitly call 'make linux-patch' first.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
