From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Sep 2011 09:36:38 +0200
Subject: [Buildroot] Q
In-Reply-To: <808391316157931@web42.yandex.ru>
References: <808391316157931@web42.yandex.ru>
Message-ID: <201109160936.39670.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 16 September 2011 09:25:31, ????????? wrote:
> If i upload BuildRoot to my embedded board, support isa,usb and other
> interface drivers available?

 That depends on your Linux kernel configuration.  Do a 'make linux26-
menuconfig' and enable the drivers you require.

 On embedded systems, the distro-style of enabling all possible drivers in the 
kernel often doesn't work.  So the kernel configuration is typcally rather 
minimal.  However, for many evaluation kets a board-specific defconfig exists 
in the kernel.  You can select it with the BR2_LINUX_KERNEL_DEFCONFIG 
buildroot configuration option.  Some evaluation kits also have a predefined 
buildroot setup: look in the configs/ directory.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
