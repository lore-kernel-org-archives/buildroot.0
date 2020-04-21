From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 21 Apr 2020 11:05:30 -0500
Subject: [Buildroot] [PATCH 8/8] package/mongodb: bump to version 4.2.4
In-Reply-To: <CAMQcK5L+D_aONSbczyJOtU0TOmUeOMNM-4Raq+Oqgg6_9h3PDQ@mail.gmail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-8-yegorslists@googlemail.com>
 <CAMQcK5L+D_aONSbczyJOtU0TOmUeOMNM-4Raq+Oqgg6_9h3PDQ@mail.gmail.com>
Message-ID: <CAMQcK5Jeg4iHakW=b1kd_m6A8PAJvke_1P_e3Kr5B8sU25tROw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor/All,

On Mon, Apr 20, 2020 at 5:56 PM Ryan Barnett
<ryan.barnett@rockwellcollins.com> wrote:
>
> I've run into an error when compiling for an x86-64 bit platform for
> the core-i5 architecture:
>
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(node_data.cpp.o):
> relocation R_X86_64_32 against `.bss' can not be used when making a
> PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(null.cpp.o):
> relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
> making a PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(ostream_wrapper.cpp.o):
> relocation R_X86_64_32 against `.bss' can not be used when making a
> PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(parse.cpp.o):
> relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
> making a PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(parser.cpp.o):
> relocation R_X86_64_32 against `.bss' can not be used when making a
> PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(regex_yaml.cpp.o):
> relocation R_X86_64_32 against `.bss' can not be used when making a
> PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(scanner.cpp.o):
> relocation R_X86_64_32 against `.bss' can not be used when making a
> PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(scantoken.cpp.o):
> relocation R_X86_64_32 against `.bss' can not be used when making a
> PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(simplekey.cpp.o):
> relocation R_X86_64_32 against `.bss' can not be used when making a
> PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(singledocparser.cpp.o):
> relocation R_X86_64_32 against `.bss' can not be used when making a
> PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(stream.cpp.o):
> relocation R_X86_64_32 against `.data' can not be used when making a
> PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(tag.cpp.o):
> relocation R_X86_64_32 against `.bss' can not be used when making a
> PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(binary.cpp.o):
> relocation R_X86_64_32S against `.rodata' can not be used when making
> a PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(directives.cpp.o):
> relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
> making a PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(nodebuilder.cpp.o):
> relocation R_X86_64_32S against symbol `_ZTVN4YAML11NodeBuilderE' can
> not be used when making a PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(scanscalar.cpp.o):
> relocation R_X86_64_32 against symbol `_ZGVZN4YAML3Exp5EmptyEvE1e' can
> not be used when making a PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(scantag.cpp.o):
> relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
> making a PIE object; recompile with -fPIC
> /tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> /tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(exp.cpp.o):
> relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
> making a PIE object; recompile with -fPIC
> /accts
>
> Do you have any ideas of what the issue is?
>
> I have BR2_SHARED_LIBS set along with using the latest stable bootlin
> toolchain for x86-64-core-i7 toolchain:
>
> https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2020.02-2.tar.bz2
>
> Please let me know if you need any more information in order to
> recreate the problem.

Here is the defconfig based on qemu_x86_64_defconfig which will
reproduce the issue:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2020.02-2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-build.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.91"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
BR2_PACKAGE_MONGODB=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_QEMU=y
BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

Thanks,
-Ryan

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
