From: manu f <e.fiancette@gmail.com>
Date: Thu, 17 Dec 2020 13:32:17 +0100
Subject: [Buildroot] Fwd: Less Restrictive attribute error on init_module
 and cleanup_module
In-Reply-To: <CAGshWo14F9x8-OzHXCpep7roX49G9AesBUyC3ppzSTUwAvzmHw@mail.gmail.com>
References: <CAGshWo14F9x8-OzHXCpep7roX49G9AesBUyC3ppzSTUwAvzmHw@mail.gmail.com>
Message-ID: <CAGshWo20BfGQMhgwQs9L9qFdtDSbHFGi=N33bSC586x1+OJmNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all, I am Manu from France.

Actually I try to compile buidroot 2020.8 on ubuntu 20.04LTS for imx6
target with internal toolchain arm 2019.12

I got these errrors:

error: 'init_module' specifies less restrictive attribute than its target
'gpu_init': 'cold' [-Werror=missing-attributes]

I googled and found this problem come from new gcc get new warning but
warning are treat as error cause -Werror flag on buildroot make files.

some answer told to force CONFIG_PPC_DISABLE_WERROR in kconfig option

I am sorry I an newby on linux compile and I don"t know how to do that.

Could somebody could help me on this problem ?

Regards.

Manu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201217/a94ca60c/attachment.html>
-------------- next part --------------
In file included from /home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:61,
                 from /home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_driver.c:61:
./include/linux/module.h:132:6: error: 'init_module' specifies less restrictive attribute than its target 'gpu_init': 'cold' [-Werror=missing-attributes]
  132 |  int init_module(void) __attribute__((alias(#initfn)));
      |      ^~~~~~~~~~~
/home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_driver.c:1265:1: note: in expansion of macro 'module_init'
 1265 | module_init(gpu_init);
      | ^~~~~~~~~~~
/home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_driver.c:1222:19: note: 'init_module' target declared here
 1222 | static int __init gpu_init(void)
      |                   ^~~~~~~~
In file included from /home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:61,
                 from /home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_driver.c:61:
./include/linux/module.h:138:7: error: 'cleanup_module' specifies less restrictive attribute than its target 'gpu_exit': 'cold' [-Werror=missing-attributes]
  138 |  void cleanup_module(void) __attribute__((alias(#exitfn)));
      |       ^~~~~~~~~~~~~~
/home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_driver.c:1266:1: note: in expansion of macro 'module_exit'
 1266 | module_exit(gpu_exit);
      | ^~~~~~~~~~~
/home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_driver.c:1253:20: note: 'cleanup_module' target declared here
 1253 | static void __exit gpu_exit(void)
      |                    ^~~~~~~~
  CC [M]  /home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/kernel/gc_hal_kernel_command.o
  CC [M]  /home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/kernel/gc_hal_kernel_async_command.o
cc1: all warnings being treated as errors
make[3]: *** [scripts/Makefile.build:293: /home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_driver.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [Makefile:1499: _module_/home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/kernel-module-imx-gpu-viv-src] Error 2
make[1]: *** [package/pkg-generic.mk:270: /home/user/cleta_buildroot/output/build/kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2
make: Leaving directory '/home/user/cleta_buildroot/buildroot'
user at LinuxDev:~/cleta_buildroot$ ^C
user at LinuxDev:~/cleta_buildroot$ 
