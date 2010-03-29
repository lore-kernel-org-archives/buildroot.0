From: Souvik Ghosh <mailtosouvik@gmail.com>
Date: Mon, 29 Mar 2010 22:50:42 +0530
Subject: [Buildroot] Buildroot with uClibc 0.9.29
In-Reply-To: <6fff79821003290958r5f66ddc1hd35a193848c61b74@mail.gmail.com>
References: <6fff79820910130628peb87f9bo9c41414b461c0d@mail.gmail.com>
	<6fff79821003290958r5f66ddc1hd35a193848c61b74@mail.gmail.com>
Message-ID: <6fff79821003291020h7e96dc68ufa227f5df3a96cb0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried with gcc 4.3.2 and uclibc 0.9.30 as well. But same result has been
produces. Can anybody please help me out.

On Mon, Mar 29, 2010 at 10:28 PM, Souvik Ghosh <mailtosouvik@gmail.com>wrote:

> Hello,
>
> I was trying to build buildroot with large file system support. But if I
> select "Enable Large file (file > 2 GB) support" I get the following error
> while compiling,
>
> In file included from
> /home/souvik/test/buildroot-2009.02/build_arm/staging_dir/usr/include/assert.h:32,
>                  from applets/applets.c:10:
> /home/souvik/test/buildroot-2009.02/build_arm/staging_dir/usr/include/features.h:383:4:
> error: #error It appears you have defined _FILE_OFFSET_BITS=64.
> Unfortunately, uClibc was built without large file support enabled.
> In file included from
> /home/souvik/test/buildroot-2009.02/build_arm/staging_dir/usr/include/stdio.h:72,
>                  from include/libbb.h:23,
>                  from include/busybox.h:10,
>                  from applets/applets.c:11:
> /home/souvik/test/buildroot-2009.02/build_arm/staging_dir/usr/include/bits/uClibc_stdio.h:72:2:
> error: #error Sorry... uClibc was built without large file support!
> In file included from include/libbb.h:23,
>                  from include/busybox.h:10,
>                  from applets/applets.c:11:
> /home/souvik/test/buildroot-2009.02/build_arm/staging_dir/usr/include/stdio.h:83:
> error: expected '=', ',', ';', 'asm' or '__attribute__' before 'fpos_t'
> In file included from include/libbb.h:23,
>                  from include/busybox.h:10,
>                  from applets/applets.c:11:
> /home/souvik/test/buildroot-2009.02/build_arm/staging_dir/usr/include/stdio.h:709:
> error: expected declaration specifiers or '...' before 'fpos_t'
> /home/souvik/test/buildroot-2009.02/build_arm/staging_dir/usr/include/stdio.h:711:
> error: expected ';', ',' or ')' before '*' token
> make[2]: *** [applets/applets.o] Error 1
> make[1]: *** [applets] Error 2
> make[1]: Leaving directory
> `/home/souvik/test/buildroot-2009.02/project_build_arm/uclibc/busybox-1.13.2'
> make: ***
> [/home/souvik/test/buildroot-2009.02/project_build_arm/uclibc/busybox-1.13.2/busybox]
> Error 2
>
>
> Can anybody please help me out. Do I need to enable any other option. BTW,
> I am building buildroot for generic arm.
> Thanks in advance,
> Souvik
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100329/6a459223/attachment-0001.htm>
