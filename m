From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 18:23:22 +0300
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <20130520165204.0269d05a@skate>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
 <20130520165204.0269d05a@skate>
Message-ID: <CADwac6CnLFHP5=yDsnF5xfB4GOMSQsCi3=J2QVPukdy=kTS+QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

Thank you for the comments.
Using TARGET_CONFIGURE_OPTS wont save much since I still need to override
CFLAGS and add -fPIC (as is done in other Lua packages).

Also, regarding the static library, the output of the package is always a
shared object since it needs to be loaded dynamically by Lua scripts. The
default target of the package is a test so I need to specifically specify
the target.

Lastly, I updated the patch for the install command.

Good day,
Assaf


On Mon, May 20, 2013 at 5:52 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Assaf Inbal,
>
> On Mon, 20 May 2013 15:56:36 +0300, Assaf Inbal wrote:
>
> > +define LBASE64_BUILD_CMDS
> > +     $(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC"
> so
> > +endef
>
> Using $(TARGET_CONFIGURE_OPTS) here would be better if possible.
>
> Also, we're normally supposed to handle both the shared library and
> static library build. Ideally, when BR2_PREFER_STATIC_LIB is disabled,
> build both the shared and the static library, and when
> BR2_PREFER_STATIC_LIB is enabled, build only the static library.
>
> > +
> > +define LBASE64_INSTALL_TARGET_CMDS
> > +     $(INSTALL) "$(@D)/base64.so" "$(TARGET_DIR)/usr/lib/lua"
> > +endef
>
> We normally don't quote file paths, and we use the following syntax:
>
>         $(INSTALL) -D $(@D)/base64.so $(TARGET_DIR)/usr/lib/lua/base64.so
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130520/0b508bd9/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0004-lbase64-New-package.patch
Type: application/octet-stream
Size: 2249 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130520/0b508bd9/attachment.obj>
