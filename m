From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 28 May 2019 15:50:18 -0400
Subject: [Buildroot] [PATCH v6 0/1] package/libglib2: bump to version
 2.60.3
In-Reply-To: <20190528194042.119121-1-aduskett@gmail.com>
References: <20190528194042.119121-1-aduskett@gmail.com>
Message-ID: <CAFSsvmoyaLb6e0DO+5J=c6-RLAuXsYig+weOb=xUNkQWnxGdLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ugh, please use V7, I missed a few small lines in Config.in that I had
put there for debugging.

https://patchwork.ozlabs.org/patch/1106520/

On Tue, May 28, 2019 at 3:40 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> I tested this patch with test-pkg -a to make sure that every single supported
> architecture is supported. The nds32 failure is because libffi does not
> support nds32, which libglib2 selects.
>
> ./utils/test-pkg -a -c ./defconfig -p libglib2
>                  andes-nds32 [ 1/44]: FAILED
>                  arm-aarch64 [ 2/44]: OK
>             br-aarch64-glibc [ 3/44]: OK
>                br-arcle-hs38 [ 4/44]: OK
>                 br-arm-basic [ 5/44]: SKIPPED
>       br-arm-cortex-a9-glibc [ 6/44]: OK
>        br-arm-cortex-a9-musl [ 7/44]: OK
>        br-arm-cortex-m4-full [ 8/44]: SKIPPED
>                  br-arm-full [ 9/44]: OK
>         br-arm-full-nothread [10/44]: SKIPPED
>           br-arm-full-static [11/44]: OK
>        br-i386-pentium4-full [12/44]: OK
>     br-i386-pentium-mmx-musl [13/44]: OK
>            br-m68k-5208-full [14/44]: SKIPPED
>           br-m68k-68040-full [15/44]: OK
>         br-microblazeel-full [16/44]: OK
>      br-mips32r6-el-hf-glibc [17/44]: OK
>           br-mips64-n64-full [18/44]: OK
>      br-mips64r6-el-hf-glibc [19/44]: OK
>           br-mipsel-o32-full [20/44]: OK
>               br-nios2-glibc [21/44]: OK
>           br-openrisc-uclibc [22/44]: OK
>    br-powerpc-603e-basic-cpp [23/44]: SKIPPED
>  br-powerpc64le-power8-glibc [24/44]: OK
>    br-powerpc64-power7-glibc [25/44]: OK
>       br-powerpc-e500mc-full [26/44]: OK
>                   br-riscv32 [27/44]: OK
>                   br-riscv64 [28/44]: OK
>                  br-sh4-full [29/44]: OK
>             br-sparc64-glibc [30/44]: OK
>              br-sparc-uclibc [31/44]: OK
>         br-x86-64-core2-full [32/44]: OK
>               br-x86-64-musl [33/44]: OK
>               br-xtensa-full [34/44]: OK
>            linaro-aarch64-be [35/44]: OK
>               linaro-aarch64 [36/44]: OK
>                   linaro-arm [37/44]: OK
>          sourcery-arm-armv4t [38/44]: OK
>                 sourcery-arm [39/44]: OK
>          sourcery-arm-thumb2 [40/44]: OK
>              sourcery-mips64 [41/44]: OK
>                sourcery-mips [42/44]: OK
>               sourcery-nios2 [43/44]: OK
>              sourcery-x86-64 [44/44]: OK
>
> I ran the above on the following distributions:
>   - centos 6 (docker)
>   - centos 7 (docker)
>   - debian 8 (docker)
>   - ubuntu 14.04 (docker)
>   - Fedora 30 (Host machine)
>
> I have also tested this with several packages that use libglib2, such as:
> - gstreamer1
> - wireshark
> - gnupg
> - docker
> - dbus-glib
> - network-manager
> - refpolicy
> - pcre2
> - udisks
> - gnupg
> - gpsd
>
> Any feedback would be appreciated!
>
> Adam.
>
> Adam Duskett (1):
>   package/libglib2: bump to version 2.60.3
>
>  ...01-fix-compile-time-atomic-detection.patch |   4 +-
>  .../0002-add-option-to-build-tests.patch      | 103 +++++++++++++++
>  package/libglib2/0002-disable-tests.patch     |  60 ---------
>  ...03-gdbus-Avoid-printing-null-strings.patch |  73 -----------
>  .../0003-remove-cpp-requirement.patch         |  96 ++++++++++++++
>  ...mat-nonliteral-to-compiler-arguments.patch |  28 ++++
>  ...dcode-python-path-into-various-tools.patch |  48 -------
>  package/libglib2/Config.in                    |   2 +
>  package/libglib2/libglib2.hash                |   4 +-
>  package/libglib2/libglib2.mk                  | 122 ++++--------------
>  10 files changed, 261 insertions(+), 279 deletions(-)
>  create mode 100644 package/libglib2/0002-add-option-to-build-tests.patch
>  delete mode 100644 package/libglib2/0002-disable-tests.patch
>  delete mode 100644 package/libglib2/0003-gdbus-Avoid-printing-null-strings.patch
>  create mode 100644 package/libglib2/0003-remove-cpp-requirement.patch
>  create mode 100644 package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
>  delete mode 100644 package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch
>
> --
> 2.21.0
>
