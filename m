From: daggs <daggs@gmx.com>
Date: Fri, 5 May 2017 10:07:37 +0200
Subject: [Buildroot] invalid commads passed in compiler line results in
	failure.
Message-ID: <trinity-c9000ae1-4900-4b9d-b1b4-48dcecd9c904-1493971657439@3capp-mailcom-bs14>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I'm trying to add a new pkg what compile a kernel driver for arm, upon compilation, I get these errors:
aarch64-linux-gcc.br_real: error: unrecognized argument in option ?-mabi=apcs-gnu?
aarch64-linux-gcc.br_real: note: valid arguments to ?-mabi=? are: ilp32 lp64
aarch64-linux-gcc.br_real: error: unrecognized command line option ?-mapcs?; did you mean ?--specs??
aarch64-linux-gcc.br_real: error: unrecognized command line option ?-mno-sched-prolog?; did you mean ?-Wno-sign-promo??
aarch64-linux-gcc.br_real: error: unrecognized command line option ?-msoft-float?

asking google suggests that I'm not setting the CROSS_COMPILE var properly but from what I see, there are no problems.
the line I'm using in the mk file is this:
$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)/driver/src/devicedrv/mali/ $(TARGET_CONFIGURE_OPTS) 

the entire compilation line is this:
/home/dagg/workspace/buildroots/buildroot-master4/output/host/usr/bin/aarch64-linux-gcc -Wp,-MD,/home/dagg/workspace/buildroots/meson_gx_mali_450-0d146fd1fa6b162ff2a2ed2dd17d291622aeec70/driver/src/devicedrv/mali/linux/.mali_osk_atomics.o.d -nostdinc -isystem /home/dagg/workspace/buildroots/buildroot-master4/output/host/usr/lib/gcc/aarch64-buildroot-linux-gnu/6.3.0/include -I./arch/arm/include -I./arch/arm/include/generated/uapi -I./arch/arm/include/generated -I./include -I./arch/arm/include/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-alpine/include -Iarch/arm/mach-berlin/include -Iarch/arm/mach-exynos/include -Iarch/arm/mach-hisi/include -Iarch/arm/mach-meson/include -Iarch/arm/mach-mvebu/include -Iarch/arm/mach-mediatek/include -Iarch/arm/mach-qcom/include -Iarch/arm/mach-rockchip/include -Iarch/arm/mach-shmobile/include -Iarch/arm/mach-sunxi/include -Iarch/arm/mach-tegra/include -Iarch/arm/mach-uniphier/include -Iarch/arm/mach-vexpress/include -Iarch/arm/mach-zx/include -Iarch/arm/plat-samsung/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=apcs-gnu -msoft-float -Uarm -O2 -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -I/home/dagg/workspace/buildroots/meson_gx_mali_450-0d146fd1fa6b162ff2a2ed2dd17d291622aeec70/driver/src/devicedrv/mali/linux/license/gpl -DCONFIG_MALI400=1 -DCONFIG_MALI450=1 -DCONFIG_MALI470=1 -DMALI_FAKE_PLATFORM_DEVICE=1 -DCONFIG_MALI_DMA_BUF_MAP_ON_ATTACH -DMALI_PP_SCHEDULER_FORCE_NO_JOB_OVERLAP=0 -DMALI_PP_SCHEDULER_KEEP_SUB_JOB_STARTS_ALIGNED=0 -DMALI_PP_SCHEDULER_FORCE_NO_JOB_OVERLAP_BETWEEN_APPS=0 -DMALI_STATE_TRACKING=1 -DMALI_OS_MEMORY_KERNEL_BUFFER_SIZE_IN_MB=16 -DUSING_GPU_UTILIZATION=0 -DMALI_ENABLE_CPU_CYCLES=0 -DMALI_UPPER_HALF_SCHEDULING -DDEBUG -I/home/dagg/workspace/buildroots/meson_gx_mali_450-0d146fd1fa6b162ff2a2ed2dd17d291622aeec70/driver/src/devicedrv/mali -I/home/dagg/workspace/buildroots/meson_gx_mali_450-0d146fd1fa6b162ff2a2ed2dd17d291622aeec70/driver/src/devicedrv/mali/include -I/home/dagg/workspace/buildroots/meson_gx_mali_450-0d146fd1fa6b162ff2a2ed2dd17d291622aeec70/driver/src/devicedrv/mali/common -I/home/dagg/workspace/buildroots/meson_gx_mali_450-0d146fd1fa6b162ff2a2ed2dd17d291622aeec70/driver/src/devicedrv/mali/linux -I/home/dagg/workspace/buildroots/meson_gx_mali_450-0d146fd1fa6b162ff2a2ed2dd17d291622aeec70/driver/src/devicedrv/mali/platform -Wno-date-time '-DSVN_REV_STRING="r6p1-01rel0"' -DMODULE '-DKBUILD_BASENAME="mali_osk_atomics"' '-DKBUILD_MODNAME="mali"' -c -o /home/dagg/workspace/buildroots/meson_gx_mali_450-0d146fd1fa6b162ff2a2ed2dd17d291622aeec70/driver/src/devicedrv/mali/linux/mali_osk_atomics.o /home/dagg/workspace/buildroots/meson_gx_mali_450-0d146fd1fa6b162ff2a2ed2dd17d291622aeec70/driver/src/devicedrv/mali/linux/mali_osk_atomics.c

any ideas what can be the issue?

Thanks,

Dagg.
