From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 3 Mar 2016 08:58:01 -0800
Subject: [Buildroot] GSOC idea
In-Reply-To: <87d1rdjpfn.fsf@dell.be.48ers.dk>
References: <CAJJ6jxuwU=A6ph4MCnz_hF4kODpf5yFsTeZwzTEgWz06wMjZjQ@mail.gmail.com>
 <87d1rdjpfn.fsf@dell.be.48ers.dk>
Message-ID: <CAJJ6jxvHKwtXx9YdMw3Txc7vQeX9VEk4dp5Om5ZvJmQVjBAf2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 1, 2016 at 11:42 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:
>
> Hi,
>
>  > Locale stuff has been on the mailing list a couple of times.
>
>  > Like http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/133685
>
>  > It seems infrastructure to install locale and utf8 stuff is missing. I
>  > did enable it in busybox, but the locale files were not copied into
>  > /usr/.... Or I just could not figure out how to do it.
>
> I find it quite confusing that you mention busybox here and in the
> linked discussion. Presumably you are talking about the locale support
> of uclibc-ng here?
>
> --
> Venlig hilsen,
> Peter Korsgaard

Hi, thanks for trying to help. I mentioned busybox because it has a
bunch of locale options (which were set when I was trying to get it to
work).

# CONFIG_INSTALL_NO_USR is not set
# CONFIG_LOCALE_SUPPORT is not set
# CONFIG_UNICODE_SUPPORT is not set
# CONFIG_UNICODE_USING_LOCALE is not set
# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
CONFIG_SUBST_WCHAR=0
CONFIG_LAST_SUPPORTED_WCHAR=0
# CONFIG_UNICODE_COMBINING_WCHARS is not set
# CONFIG_UNICODE_WIDE_WCHARS is not set
# CONFIG_UNICODE_BIDI_SUPPORT is not set
# CONFIG_UNICODE_NEUTRAL_TABLE is not set
# CONFIG_UNICODE_PRESERVE_BROKEN is not set

I am using glibc - here is my config:
BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_GCC_VERSION_4_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
BR2_PACKAGE_LIBPTHREAD_STUBS=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_SHEEVAPLUG=y

So when I did have locale enabled in busybox before, after the build,
the locale data files were installed but some had odd directory names,
containing maybe html, if I remember right they contained "en#quot" or
something. I don't have that computer here right now.

And my buildroot .config contains:
BR2_GENERATE_LOCALE="en_US"

My goal was simply to be able to access usb flash drives written by
another Linux system (Ubuntu) that did support utf-8 characters. Linux
does not care much about names, with a couple exceptions they are just
bytes ( r"\/\0\n" are problematic in names).

If someone can tell me how I can just cat a file with a utf8 widechar
in busybox, I think I can continue from there.

Thanks, Steve
