From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 14 Jul 2021 09:41:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libteam: new package
In-Reply-To: <878s29wf27.fsf@gmail.com>
References: <20210710114153.369531-1-troglobit@gmail.com>
 <20210710114153.369531-2-troglobit@gmail.com>
 <CAGm1_ksZH1EFy=kzgy2pMtCfec-6dwuOZnkVtbwb5bJxzkCOVA@mail.gmail.com>
 <878s29wf27.fsf@gmail.com>
Message-ID: <CAGm1_kveuvxiUu5uBibE9Y+Xv9KWMD5uYZxaNCRSw+G=vHaR4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joachim,

On Wed, Jul 14, 2021 at 9:05 AM Joachim Wiberg <troglobit@gmail.com> wrote:
>
>
> Hi Yegor!
>
> On Tue, Jul 13, 2021 at 06:43, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > On Sat, Jul 10, 2021 at 1:42 PM Joachim Wiberg <troglobit@gmail.com> wrote:
> >> [snip]
> >> +++ b/package/libteam/Config.in
> >> @@ -0,0 +1,20 @@
> >> +config BR2_PACKAGE_LIBTEAM
> >> +       bool "libteam"
> >> +       depends on BR2_USE_MMU # fork()
> >> +       select BR2_PACKAGE_JANSSON
> >> +       select BR2_PACKAGE_LIBDAEMON
> >> +       select BR2_PACKAGE_LIBNL
> >> +       select BR2_PACKAGE_LIBNL_TOOLS
> >> +       help
> >> [snip]
> >
> > The dependencies for libnl and tools are missing:
> >
> > comment "libnl tools needs a toolchain w/ dynamic library"
> >         depends on BR2_STATIC_LIBS
> >
> > comment "libnl needs a toolchain w/ threads"
> >         depends on !BR2_TOOLCHAIN_HAS_THREADS
> >
>
> Aha, I didn't realize I needed to unwind and list all the deps from my
> package's dependencies as well.  But only in the Config.in, right?

Yes, you have to do this only in Config.in.

Best regards,
Yegor

> I'll post a v2 later this week.
>
> Thanks
>  /Joachim
