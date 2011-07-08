From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2011 19:08:53 +0200
Subject: [Buildroot] [PATCH 04/28] linux: use the defconfig mechanism
 after tuning the config
In-Reply-To: <87pqllpxw5.fsf@macbook.be.48ers.dk>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <505d71eb153b750e7af08640a90e2efec8cbcf39.1309895466.git.thomas.petazzoni@free-electrons.com>
 <87pqllpxw5.fsf@macbook.be.48ers.dk>
Message-ID: <20110708190853.126e7e3a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 07 Jul 2011 23:46:18 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Why don't we just call 'make silentoldconfig' instead?

No, silentoldconfig, despite its name, will ask many questions when
the .config is simply a minimal defconfig. See below:

thomas at skate:~/projets/linux-2.6$ cp ../buildroot/board/qemu/arm-versatile/linux-2.6.38.config .config
thomas at skate:~/projets/linux-2.6$ make ARCH=arm silentoldconfig
scripts/kconfig/conf --silentoldconfig Kconfig
*
* Restart config...
*
*
* Linux/arm 2.6.39 Kernel Configuration
*
Patch physical to virtual translations at runtime (EXPERIMENTAL) (ARM_PATCH_PHYS_VIRT) [N/y/?] (NEW) 
[...]
[...] Lots of questions follow
[...]
thomas at skate:~/projets/linux-2.6$ cp ../buildroot/board/qemu/arm-versatile/linux-2.6.38.config arch/arm/configs/blabla_defconfig
thomas at skate:~/projets/linux-2.6$ make ARCH=arm blabla_defconfig
#
# configuration written to .config
#
thomas at skate:~/projets/linux-2.6$ 

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
