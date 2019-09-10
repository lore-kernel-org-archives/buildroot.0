From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 10 Sep 2019 16:49:43 +0300
Subject: [Buildroot] Guidance creating first package (WAMR)
In-Reply-To: <CANcmUPG0bVuBf-V3VO=RnFKSsdKPqtc1gsa_3zDM1dVm2n0FLg@mail.gmail.com>
References: <CANcmUPG0bVuBf-V3VO=RnFKSsdKPqtc1gsa_3zDM1dVm2n0FLg@mail.gmail.com>
Message-ID: <CAMw6YJLjAfe=TK63QFYMMWboTPiFfWOK1kqKMqp-XW7--zSbNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Jonathan,

On Tue, Sep 10, 2019 at 3:36 PM Jonathan Beri <jmberi@gmail.com> wrote:
>
> Hello! I'm new to buildroot and so far have found the project to be very mature. My goal is to create an environment for WebAssembly Micro Runtime (WAMR,) a standalone WebAssembly (Wasm) runtime on SBCs like the Raspberry Pi. See https://github.com/intel/wasm-micro-runtime.
>
> I started by using a docker container to build an image using the Raspberry Pi defconfig. I got it working in an afternoon. Next I created a `wamr` folder in `packages`, added a `Config.in` and started to work on a `wamr.mk`.
>
> And here's where I need help. The build process for WAMR Core is fairly straightforward - see https://github.com/intel/wasm-micro-runtime/blob/master/doc/building.md#build-wamr-core. I contributed the Dockerfile, which took a few hours to write. I'm comfortable on linux but far from an expert. However, I'm little more than a novice when it comes kconfig, make and the like.
>
> I tried following the CMake docs to build a package: https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages. Here's an example of what I tried:
>
> ```
> ################################################################################
> #
> # wamr
> #
> ################################################################################
>
> WAMR_VERSION = a522e985f30c12c9c66eda6ff3ab41f493b31b2c
> WAMR_SOURCE = wasm-micro-runtime-master.tar.gz
> WAMR_SITE = $(call github,intel,wasm-micro-runtime,$(WAMR_VERSION))
>
> $(eval $(cmake-package))
> ```
>
> From here I didn't know how to test even that this syntax is correct. I've tried `./utils/test-pkg`, `make wamr-source` & `make wamr-build` but the outputs haven't been helpful.
>
> I've tried looking for additional tutorials on the web (Bootlin has some lovely detailed ones) but so far none that have helped me wrap my head around the packaging system.
>
> Anyone have suggestions or pointers?
>

So may be try to check:

1) if you included your Config.in in the package/Config.in like the
rest of packages

2) if you enabled config for your package in menuconfig/defconfig, you
can check it in
(probably) output/.config if the BR2_PACKAGE_WAMR (or how you named
your package in your Config.in) is set to 'y':
    BR2_PACKAGE_WAMR=y

Regards,
Vadim Kochan
