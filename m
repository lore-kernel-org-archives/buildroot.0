From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Wed, 12 Sep 2018 12:04:45 +0100
Subject: [Buildroot] Scripting modifications to .config for toolchain
 requiring minimal kernel version
Message-ID: <87o9d3asdu.fsf@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

We've been looking to use buildroot to build toolchains for some of
QEMU's more esoteric architectures, for example:

  https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg01237.html

Currently the docker image builds with a:

  make qemu_nios2_10m50_defconfig
  make toolchain

but the defconfig quite rightly ensures the libc is built with a minimum
kernel version that matches the kernel buildroot would build under the
config. However for QEMU's purposes we'd prefer a more flexible glibc
that honours the minimum kernel version. Does buildroot already have a
mechanism for tweaking the config from the command line for making these
sort of changes or is it just a case of breaking out sed on the .config?

If I'm going to hack it by sed which fields should I look at tweaking.
There don't seem to be any relevant LIBC config files but quite a lot of
kernel ones:

  BR2_PACKAGE_LINUX_HEADERS=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16=y
  BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.16"

If I want glibc to use it's own built in headers is it enough to squash
these config options?

--
Alex Benn?e
