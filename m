From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 23 Apr 2008 11:59:23 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <20080423145238.B61043C759@busybox.net>
References: <20080423145238.B61043C759@busybox.net>
Message-ID: <d6cda7730804230759w3814c841iba5a7255ddf6a734@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hmmm I have never seen patch.$ARCH in buildroot.

It's usually -$ARCH.patch like toolchain/kernel-headers
package/qtopia4 and others.

On Wed, Apr 23, 2008 at 11:52 AM,  <jacmet@uclibc.org> wrote:
> Author: jacmet
>  Date: 2008-04-23 07:52:38 -0700 (Wed, 23 Apr 2008)
>  New Revision: 21811
>
>  Log:
>  u-boot: support platform-independent patches
>
>  Support platform independent patches (.patch) and use .patch.$ARCH for
>  platform dependent ones like elsewhere.
>
>
>
>  Modified:
>    trunk/buildroot/target/u-boot/Makefile.in
>
>
>  Changeset:
>  Modified: trunk/buildroot/target/u-boot/Makefile.in
>  ===================================================================
>  --- trunk/buildroot/target/u-boot/Makefile.in   2008-04-23 14:52:35 UTC (rev 21810)
>  +++ trunk/buildroot/target/u-boot/Makefile.in   2008-04-23 14:52:38 UTC (rev 21811)
>  @@ -47,7 +47,8 @@
>
>   $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
>         toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot/ \
>  -               u-boot-$(U_BOOT_VERSION)-$(BR2_ARCH)-\*.patch\*
>  +               u-boot-$(U_BOOT_VERSION)-\*.patch \
>  +               u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
>   ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
>         @mkdir -p $(U_BOOT_PATCH_DIR)
>         cp -dpr $(BR2_TARGET_UBOOT_CUSTOM_PATCH) $(U_BOOT_PATCH_DIR)
>
>
>
>  _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>
