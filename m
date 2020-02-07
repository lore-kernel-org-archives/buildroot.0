From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 7 Feb 2020 22:34:02 +0100
Subject: [Buildroot] [PATCH v16 0/4] package/gobject-introspection: new
 package
In-Reply-To: <20200207023834.877032-1-aduskett@gmail.com>
References: <20200207023834.877032-1-aduskett@gmail.com>
Message-ID: <636b2b73-3bf2-481b-886a-354ad4613311@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam, All,

I've built succesfully gobject-introspection with test-pkg -a, so I'm 
going to send Tested-by: for every patch.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 2/7/20 3:38 AM, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> This time, with 100% more working.
> 
> My brain didn't work so well at Devdays apparently:
> 
> Changes:
>    - Add gobject-introspection back into Config.in. I'm bad and somehow missed
>      this in v15.
>    
>    - Remove GOBJECT_INTROSPECTION_PC_FILE_FIXUP in goi.mk, as the sed wasn't
>      doing anything.
>    
>    - Paths in g-ir-compiler.in weren't 100% correct due to moving g-ir-compiler
>      to the host directory, so qemu was trying to load the host compiler and not
>      the staging compiler, which would cause qemu to puke.
> 
>    - I removed a -x in g-ir-scanner-wrapper because I am blind.
>    
> I tested this patch series with gstreamer1, and it works! You, too, can now
> have high-functioning projects use glib based c libraries! Hooray!
> 
> Thanks, everybody!
> 
> Adam
> Adam
> 
> Adam Duskett (4):
>    package/libiberty: new package
>    package/prelink-cross: new package
>    package/gdb: depend on libiberty
>    package/gobject-introspection: new package
> 
>   DEVELOPERS                                    |   3 +
>   package/Config.in                             |   1 +
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
>   .../gobject-introspection/g-ir-compiler.in    |   3 +
>   .../g-ir-scanner-lddwrapper.in                |   2 +
>   .../g-ir-scanner-qemuwrapper.in               |  17 ++
>   package/gobject-introspection/g-ir-scanner.in |   8 +
>   .../gobject-introspection.hash                |   4 +
>   .../gobject-introspection.mk                  | 116 +++++++++++++
>   package/libiberty/libiberty.hash              |   2 +
>   package/libiberty/libiberty.mk                |  27 +++
>   package/prelink-cross/prelink-cross.hash      |   3 +
>   package/prelink-cross/prelink-cross.mk        |  16 ++
>   22 files changed, 693 insertions(+), 1 deletion(-)
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
