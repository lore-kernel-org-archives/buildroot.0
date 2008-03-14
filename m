From: John Voltz <john.voltz@gmail.com>
Date: Fri, 14 Mar 2008 13:12:15 -0400
Subject: [Buildroot] Problem patching linux
In-Reply-To: <47DA75B2.50004@carallon.com>
References: <47DA75B2.50004@carallon.com>
Message-ID: <46a136670803141012i332205bfp456ddc5879418902@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

name it linux-2.6.22.19-012-some_patch

the patch kernel reads the files in the same order as the ls command would
print them, so if you have linux-2.6.22.19-012-some_patch and
linux-2.6.22.19-013-another_patch it will order them like you want.

John

On Fri, Mar 14, 2008 at 8:55 AM, Will Wagner <will_wagner@carallon.com>
wrote:

> Hi All,
>
> I have a custom board in target/device/my_board. Inside that folder I
> have a kernel_patches folder and I have changed the config so that it
> should apply my patches.
>
> It all works when applying the patches for the kernel headers, but it
> fails to patch the actual kernel. This is because of the different ways
> the patch-kernel.sh script is called.
>
> In kernel-headers-new.makefile it is:
>        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
> $(KERNEL_HEADERS_PATCH_DIR) \
>                \*.patch{,.gz,.bz2}
>
> But in the linux Makefile.in it is:
>        toolchain/patch-kernel.sh $(LINUX26_DIR)
> $(KERNEL_HEADERS_PATCH_DIR) \
>                linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
>
> The regex is much tougher when actually patching the kernel. The problem
> I have it that my patch files are all in this format:
>
> 012-linux-2.6.22.19-some_patch
>
> I need the numbers at the beginning to ensure they get patched in the
> right order.
>
> How should I fix this? How should my patch files be named? Is this just
> a bug in the patching of the kernel?
>
> Thanks,
>
> Will.
> --
> ------------------------------------------------------------------------
> Will Wagner                                     will_wagner at carallon.com
> Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
> Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
> ------------------------------------------------------------------------
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080314/bcadefaf/attachment.htm 
