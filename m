From: Tomasz Gorochowik <tomasz.gorochowik@gmail.com>
Date: Sun, 7 Jun 2015 15:13:31 +0200
Subject: [Buildroot] [PATCH 1/1] eudev: add cxx dependency
In-Reply-To: <XnsA4B2872B0D9DEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1433616116-30527-1-git-send-email-tomasz.gorochowik@gmail.com>
 <20150606210404.GH3581@free.fr>
 <CAJ4oOgypx858taa1cef4uivge-jyS07WZ=5R2=g-w_MaVWjxMQ@mail.gmail.com>
 <XnsA4B2872B0D9DEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <CAJ4oOgzDeYod0HsYKL8hVbVUKd8G2v5zKparT0jaFE7pJBib9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

thanks for your time.

I did a build on a different machine, with a different OS and it
indeed did work.

It turns out, that the eudev configure script was trying to execute
the /lib/cpp binary, which was not present in my system (Arch). For
some reason I thought it only executes the downloaded binaries while
builduing all of the packages.

Making a symlink to that path fixed the issue, so the patch I
submitted should clearly be ignored, as it is more of a uedev issue
than buildroot (for executing cpp with full path instead of looking
for it in the $PATH).

Once again - thanks for your time, and sorry for introducing the confusion.

Best regards,
Tom

2015-06-07 13:17 GMT+02:00 Bernd Kuhls <bernd.kuhls@t-online.de>:
> Tomasz Gorochowik <tomasz.gorochowik@gmail.com>
> wrote in news:CAJ4oOgypx858taa1cef4uivge-jyS07WZ=5R2=g-
> w_MaVWjxMQ at mail.gmail.com:
>
>> Mininal config changes I make to reproduce the error:
>>
>> Target architecture: ARM (little endian)
>> Architecture variant: cortex-A9
>> Toolchain -> Enable WCHAR support
>> Target -> /dev management: eudev
>
> Hi,
>
> building eudev with this defconfig, without c++, works:
>
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>
> Please post the content of your defconfig file:
>
> make savedefconfig DEFCONFIG=some_defconfig
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
