From: William Welch <bvwelch@gmail.com>
Date: Sat, 31 May 2014 15:56:01 -0500
Subject: [Buildroot] [PATCH] reenable microblaze little endian for
 internal musl toolchain
In-Reply-To: <20140531084556.GA17277@waldemar-brodkorb.de>
References: <20140531084556.GA17277@waldemar-brodkorb.de>
Message-ID: <CAPALihPyH5erdhQOsTiQ7E2_La9AuTi_7ED5tUqpfph713sjWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

What I know is, that the resulting images built by musl toolchain did not
work, and readelf says the images are big-endian.

I selected microblaze little endian target and then chose 3 different
toolchains and made 3 separate builds.  -- musl, buildroot internal, and
the old Xilinx. Musl was the only one that did not run.

Note that buildroot did not build the musl toolchain from source, but
rather downloaded it from somewhere...

QEMU is nice but does not necessarily prove that a toolchain will work on
my spartan6 microblazeel design, which I have been using with builroot,
successfully, for some time now.

thank you,

William




On Sat, May 31, 2014 at 3:45 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:

> The assumption musl libc does not support microblaze little endian
> mode is wrong.
> See http://git.musl-libc.org/cgit/musl/tree/configure
> line number 447-448.
>
> Tested with qemu.
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  toolchain/toolchain-buildroot/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/toolchain/toolchain-buildroot/Config.in
> b/toolchain/toolchain-buildroot/Config.in
> index 840668c..7623790 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -81,7 +81,7 @@ comment "(e)glibc only available with shared lib support"
>  config BR2_TOOLCHAIN_BUILDROOT_MUSL
>         bool "musl (experimental)"
>         depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazebe ||
> \
> -               BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
> +               BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc ||
> BR2_x86_64
>         select BR2_TOOLCHAIN_USES_MUSL
>         help
>           This option selects musl as the C library for the
> --
> 1.7.10.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140531/aea563cd/attachment.html>
