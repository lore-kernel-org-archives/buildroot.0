From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Wed, 18 Mar 2015 13:29:41 +0100
Subject: [Buildroot] [PATCH 2/3] ljlinenoise: refactor with
	BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
In-Reply-To: <20150317213250.6ed620c9@free-electrons.com>
References: <1426622689-31844-1-git-send-email-francois.perrad@gadz.org>
 <1426622689-31844-2-git-send-email-francois.perrad@gadz.org>
 <20150317213250.6ed620c9@free-electrons.com>
Message-ID: <CAGhdn55VhHAamXavOjK3m2UMg8+JaHLbprsrePZ_cn+AhA-LEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-03-17 21:32 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Francois Perrad,
>
> On Tue, 17 Mar 2015 21:04:48 +0100, Francois Perrad wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/ljlinenoise/Config.in | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/ljlinenoise/Config.in
> b/package/ljlinenoise/Config.in
> > index 17be1be..ce1a156 100644
> > --- a/package/ljlinenoise/Config.in
> > +++ b/package/ljlinenoise/Config.in
> > @@ -5,7 +5,7 @@ config BR2_PACKAGE_LJLINENOISE
> >       # ljsyscall is specifically for LuaJIT, not Lua.
> >       depends on BR2_PACKAGE_LUAJIT
> >       # ljsyscall is only available for some target architectures
> > -     depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm ||
> BR2_armeb
> > +     depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>
> Are you sure?
>
> BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS is clearly not the same as "BR2_i386
> || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb". For example,
> mips/mipsel are supported in LuaJIT, but not in the current condition
> of ljlinenoise.
>
>
This package is based on ljsyscall, so see the discussion in [patch 3/3]
ljsyscall

Fran?ois



> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150318/1bd185ba/attachment.html>
