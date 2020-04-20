From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 20 Apr 2020 17:56:40 -0500
Subject: [Buildroot] [PATCH 8/8] package/mongodb: bump to version 4.2.4
In-Reply-To: <20200323104909.16765-8-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-8-yegorslists@googlemail.com>
Message-ID: <CAMQcK5L+D_aONSbczyJOtU0TOmUeOMNM-4Raq+Oqgg6_9h3PDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor/All,

On Mon, Mar 23, 2020 at 5:54 AM <yegorslists@googlemail.com> wrote:
>
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> - Drop !BR2_PACKAGE_PYTHON3 dependency as SConstruct requires
>   host-python3 since version 4.1.10 and:
>   https://github.com/mongodb/mongo/commit/8dd6d4755734ed37c1b98dfdefce3ca6bc65f1f6
> - host-python-psutil is needed since 4.1.8 and
>   https://github.com/mongodb/mongo/commit/ff03811e31851984617d73739de8acc7640b19a2
> - Drop unneeded host-python-typing dependency
> - C++17 and so gcc 7 is required since 4.1.8 and
>   https://github.com/mongodb/mongo/commit/01d84b2565fc9ea9626a55dcf1f3f817968088f2
> - Set --disable-minimum-compiler-version-enforcement as mongodb enforces
>   gcc >= 8.2 since verson 4.1.8 and
>   https://github.com/mongodb/mongo/commit/9ac90b128ebeb1bb431ebe3fe9176cb6142818cb
> - Explictly disable ssl if needed as ssl is enabled by default
> - Add host-python-cheetah dependency if needed
> - Manage new http-client option added in version 4.1.2 and
>   https://github.com/mongodb/mongo/commit/4d7dcca91bc2bbde65843fe88c41fa040e0d1877
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> [Titouan: Fix patch conflicts with master]
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/mongodb/Config.in    |  8 +++-----
>  package/mongodb/mongodb.hash |  2 +-
>  package/mongodb/mongodb.mk   | 27 ++++++++++++++++++---------
>  3 files changed, 22 insertions(+), 15 deletions(-)

I've run into an error when compiling for an x86-64 bit platform for
the core-i5 architecture:

/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(node_data.cpp.o):
relocation R_X86_64_32 against `.bss' can not be used when making a
PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(null.cpp.o):
relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
making a PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(ostream_wrapper.cpp.o):
relocation R_X86_64_32 against `.bss' can not be used when making a
PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(parse.cpp.o):
relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
making a PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(parser.cpp.o):
relocation R_X86_64_32 against `.bss' can not be used when making a
PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(regex_yaml.cpp.o):
relocation R_X86_64_32 against `.bss' can not be used when making a
PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(scanner.cpp.o):
relocation R_X86_64_32 against `.bss' can not be used when making a
PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(scantoken.cpp.o):
relocation R_X86_64_32 against `.bss' can not be used when making a
PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(simplekey.cpp.o):
relocation R_X86_64_32 against `.bss' can not be used when making a
PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(singledocparser.cpp.o):
relocation R_X86_64_32 against `.bss' can not be used when making a
PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(stream.cpp.o):
relocation R_X86_64_32 against `.data' can not be used when making a
PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(tag.cpp.o):
relocation R_X86_64_32 against `.bss' can not be used when making a
PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(binary.cpp.o):
relocation R_X86_64_32S against `.rodata' can not be used when making
a PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(directives.cpp.o):
relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
making a PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(nodebuilder.cpp.o):
relocation R_X86_64_32S against symbol `_ZTVN4YAML11NodeBuilderE' can
not be used when making a PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(scanscalar.cpp.o):
relocation R_X86_64_32 against symbol `_ZGVZN4YAML3Exp5EmptyEvE1e' can
not be used when making a PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(scantag.cpp.o):
relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
making a PIE object; recompile with -fPIC
/tmp/mongodb-buildhost/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
/tmp/mongodb-buildhost/x86_64-buildroot-linux-gnu/sysroot/lib/../lib64/libyaml-cpp.a(exp.cpp.o):
relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
making a PIE object; recompile with -fPIC
/accts

Do you have any ideas of what the issue is?

I have BR2_SHARED_LIBS set along with using the latest stable bootlin
toolchain for x86-64-core-i7 toolchain:

https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2020.02-2.tar.bz2

Please let me know if you need any more information in order to
recreate the problem.

[...]

Thanks,
-Ryan
