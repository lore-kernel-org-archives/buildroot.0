From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 5 Feb 2020 17:07:19 +0100
Subject: [Buildroot] [PATCH v15 0/5] package/gobject-introspection: new
 package
In-Reply-To: <20200204213956.2124306-1-aduskett@gmail.com>
References: <20200204213956.2124306-1-aduskett@gmail.com>
Message-ID: <80581602-4f4a-faa1-de3a-c9377be09dfa@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

unfortunately trying to issue a ./utils/test-pkg -p 
gobject-introspection -d ../test-gio -a results in SKIPPED for every arch.

Can you give a try and tell me if it is the same for you?

Thanks

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 2/4/20 10:39 PM, Adam Duskett wrote:
> It's baaaaaaaaack.
> 
> Changes:
>   - Impliment Arnouts suggestions.
>   - Blacklist x86 steam roller and core-avx, they cause segfualts with qemu.
>   - Pray a bit more.
>   - Drink a LOT more.
> 
> This depends on Arnouts patch series:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=156716
> https://patchwork.ozlabs.org/project/buildroot/list/?series=156749
> 
> Adam Duskett (5):
>    package/libiberty: new package
>    package/qemu: do not support x86_steamroller or x86_core_avx2
>    package/prelink-cross: new package
>    package/gdb: depend on libiberty
>    package/gobject-introspection: new package
> 
>   DEVELOPERS                                    |   2 +
>   package/gdb/gdb.mk                            |   4 +-
>   ...lete-upstream-attempt-at-cross-compi.patch |  33 ++++
>   ...d-cross-compilation-support-to-meson.patch | 163 ++++++++++++++++++
>   .../0003-disable-tests.patch                  |  29 ++++
>   ...canner-add-use-binary-wrapper-option.patch |  52 ++++++
>   ...scanner-add-a-use-ldd-wrapper-option.patch |  48 ++++++
>   ...scanner-add-a-lib-dirs-envvar-option.patch |  73 ++++++++
>   .../0007-Add-rpath-links-to-ccompiler.patch   |  29 ++++
>   ...-error-return-codes-from-ldd-wrapper.patch |  28 +++
>   package/gobject-introspection/Config.in       |  33 ++++
>   .../gobject-introspection/g-ir-compiler.in    |   2 +
>   .../g-ir-scanner-lddwrapper.in                |   2 +
>   .../g-ir-scanner-qemuwrapper.in               |  18 ++
>   package/gobject-introspection/g-ir-scanner.in |   8 +
>   .../gobject-introspection.hash                |   4 +
>   .../gobject-introspection.mk                  | 122 +++++++++++++
>   package/libiberty/libiberty.hash              |   2 +
>   package/libiberty/libiberty.mk                |  27 +++
>   package/prelink-cross/prelink-cross.hash      |   3 +
>   package/prelink-cross/prelink-cross.mk        |  16 ++
>   package/qemu/Config.in.host                   |   1 +
>   22 files changed, 698 insertions(+), 1 deletion(-)
>   create mode 100644 package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
>   create mode 100644 package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch
>   create mode 100644 package/gobject-introspection/0003-disable-tests.patch
>   create mode 100644 package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch
>   create mode 100644 package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch
>   create mode 100644 package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
>   create mode 100644 package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
>   create mode 100644 package/gobject-introspection/0008-ignore-error-return-codes-from-ldd-wrapper.patch
>   create mode 100644 package/gobject-introspection/Config.in
>   create mode 100644 package/gobject-introspection/g-ir-compiler.in
>   create mode 100644 package/gobject-introspection/g-ir-scanner-lddwrapper.in
>   create mode 100644 package/gobject-introspection/g-ir-scanner-qemuwrapper.in
>   create mode 100644 package/gobject-introspection/g-ir-scanner.in
>   create mode 100644 package/gobject-introspection/gobject-introspection.hash
>   create mode 100644 package/gobject-introspection/gobject-introspection.mk
>   create mode 100644 package/libiberty/libiberty.hash
>   create mode 100644 package/libiberty/libiberty.mk
>   create mode 100644 package/prelink-cross/prelink-cross.hash
>   create mode 100644 package/prelink-cross/prelink-cross.mk
> 
