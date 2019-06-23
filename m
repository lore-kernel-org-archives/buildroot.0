From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 20:37:54 +0200
Subject: [Buildroot] Generation of locales
In-Reply-To: <a7f64d7d-6e93-3d7b-e1d0-ab77dde72e11@onet.eu>
References: <a7f64d7d-6e93-3d7b-e1d0-ab77dde72e11@onet.eu>
Message-ID: <20190623203754.5e0ff0ba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Witold,

Sorry for the very long delay before this reply.

On Fri, 4 Jan 2019 11:38:01 +0100
WK <sdrb@onet.eu> wrote:

> I noticed that compiling buildroot a few times without "make clean" the 
> size of locale-archive file in $(TARGET_DIR)/usr/lib/locale is increasing.
> 
> The strange thing is that it occures about three times and then it stops 
> increasing.

I was not able to reproduce. I built the following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_GENERATE_LOCALE="fr_FR.UTF-8 en_US.UTF-8"
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

After the first build, the size of output/target/usr/lib/locale was:

$ du -sb output/target/usr/lib/locale/
1678944	output/target/usr/lib/locale/

Then I restarted "make" (without doing "make clean"), and looked at the
size again, and it was exactly the same.

Could you provide a defconfig + scenario that allows to reproduce the
issue, and indicate which version of Buildroot you're using ? We
recently updated localedef, perhaps the behavior changed ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
