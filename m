From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Apr 2014 09:44:00 +0200
Subject: [Buildroot] adding DCMTK libraries to buildroot
In-Reply-To: <2656055.10Mv5CXMOB@linux-qsenn>
References: <2656055.10Mv5CXMOB@linux-qsenn>
Message-ID: <CAAXf6LXWAV0_n=kMtuk_JRZ0N2PW_3L7+rAqR7dfQQO8i4kj6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi William,

On Thu, Apr 24, 2014 at 3:38 AM, William Frost <tsmrnd0@gmail.com> wrote:
> This patch is far from being perfect but at list it is a start point to
> something better.
> Known problems:
>  - Building dynamic libraries is not optional. I prefer static linking for
> this library but it will be nice to leave this option to the users.
>  - Every time I try to build buildroot DCMTK gets configured again, I
>  must be doing something wrong. But it compiles just fine and install the
>  libraries on staging/usr/lib.
> This is is first time contributing so if I'm doing something wrong please let
> me know the right way to do it.

Please have a look at the contribution section in the manual on how to
send patches. Patches should be sent inline and not as attachment.
This makes review of the patch much easier.

The first line of the commit message should be a summary, followed by
an empty line. The manual contains an example.

The Config.in and .mk files should be line-wrapped to 80 characters.

The symbol BR2_DCMTK_VERSION should be called BR2_PACKAGE_DCMTK_VERSION.

The #### in the .mk file should be 80 characters wide.

If you set DCMTK_VERSION = $(call qstrip,$(BR2_PACKAGE_DCMTK_VERSION)
then you can remove the DCMTK_SOURCE line because the default is
<pkg>-<version>.tar.gz.

These are just some initial comments.

When you send a new patch, please mark it as 'v2' and describe the
changes you made (see the manual)

Thanks for contributing,

Thomas



> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
