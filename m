From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 23:41:22 +0200
Subject: [Buildroot] [PATCH 1/1 v2] qdecoder : new package
In-Reply-To: <18590DF726304B8A9132C34717060A98@JohanW7>
References: <1398155122-6872-1-git-send-email-sagaert.johan@skynet.be>
 <20140422162711.7b4d0c17@skate>
 <18590DF726304B8A9132C34717060A98@JohanW7>
Message-ID: <20140422234122.778f4392@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Tue, 22 Apr 2014 17:07:01 +0200, Sagaert Johan wrote:

> I did a quick check on :
> http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full-nothread.config
> 
> But this seem to fail on my build machine:
> .....snip
> make[2]: Leaving directory `/home/brcpy/support/kconfig'
> BR2_DEFCONFIG='' KCONFIG_AUTOCONFIG=/home/brcpy/output/build/buildroot-config/auto.conf
> KCONFIG_AUTOHEADER=/home/brcpy/output/build/buildroot-config/autoconf.h
> KCONFIG_TRISTATE=/home/brcpy/output/build/buildroot-config/tristate.config BR2_CONFIG=/home/brcpy/.config
> BR2_EXTERNAL=support/dummy-external /home/brcpy/output/build/buildroot-config/conf --silentoldconfig Config.in
> make[1]: Leaving directory `/home/brcpy'
> >>> toolchain-external undefined Extracting
> mkdir -p /home/brcpy/output/host/opt/ext-toolchain
> bzcat /home/johan/dl/br-arm11-full-nothread-2014.02-rc1.tar.bz2 | tar --strip-components=1 --exclude='usr/lib/locale/*' -C
> /home/brcpy/output/host/opt/ext-toolchain  -xf -
> >>> toolchain-external undefined Patching
> >>> toolchain-external undefined Configuring
> Cannot execute cross-compiler '/home/brcpy/output/host/opt/ext-toolchain/bin/arm-linux-gcc'
> 
> Is the x64 code ? I am on a 32 bit VM (debian 6).

Hum, correct, the toolchain is 64 bits. Weird, I was pretty sure to
build them in a 32 bits chroot, maybe that's no longer the case.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
