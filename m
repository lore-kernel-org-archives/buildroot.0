From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 10 Sep 2018 13:46:07 +0200
Subject: [Buildroot] [PATCH] parted: fix minor()/major() build failure
 due to glibc 2.28
In-Reply-To: <13c74cee-bfbb-15af-9b9a-cd7864a5026b@micronovasrl.com>
References: <20180909172917.55169-1-giulio.benetti@micronovasrl.com>
 <20180910092510.66b51de5@windsurf.home>
 <13c74cee-bfbb-15af-9b9a-cd7864a5026b@micronovasrl.com>
Message-ID: <CAGm1_ktVLoCsxUou+ax6qEc0y8mbOj7FBhid4_vjz9AtHaueqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
On Mon, Sep 10, 2018 at 12:49 PM Giulio Benetti
<giulio.benetti@micronovasrl.com> wrote:
>
> Hello,
>
> Il 10/09/2018 09:25, Thomas Petazzoni ha scritto:
> > Hello,
> >
> > On Sun,  9 Sep 2018 19:29:17 +0200, Giulio Benetti wrote:
> >
> >> diff --git a/package/parted/0005-libparted-include-sys-sysmacros.h-to-compile-with-gl.patch b/package/parted/0005-libparted-include-sys-sysmacros.h-to-compile-with-gl.patch
> >> new file mode 100644
> >> index 0000000000..63dda4c4ff
> >> --- /dev/null
> >> +++ b/package/parted/0005-libparted-include-sys-sysmacros.h-to-compile-with-gl.patch
> >> @@ -0,0 +1,33 @@
> >> +From 715e3e937536326af272c45a86cc3765f00297f7 Mon Sep 17 00:00:00 2001
> >> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> >> +Date: Sun, 9 Sep 2018 19:19:19 +0200
> >> +Subject: [PATCH] libparted: include <sys/sysmacros.h> to compile with
> >> + glibc-2.28
> >> +
> >> +glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
> >> +and therefore <sys/sysmacros.h> must be included explicitly when
> >> +major()/minor() are used.
> >> +
> >> +Include <sys/sysmacros.h> into libparted/arch/linux.c where minor() and
> >> +major() macros are used.
> >> +
> >> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> >
> > Please backport upstream commit
> > ba5e0451b51c983e40afd123b6e0d3eddb55e610 instead of coming up with your
> > one fix. Thanks!
>
> I still can't find upstream commits in general, I think I don't know
> enough some tool you use or I don't know the best way to find them.
> Can you point me some hint for this?
> Maybe using git in certain way, or checking open PR on various git in a
> certain way in repositories etc.

Install "tig" and invoke:

tig blame libparted/arch/linux.c

scroll to the line with: #include <sys/sysmacros.h> and you get your
commit ba5e0451b51c983e40afd123b6e0d3eddb55e610

Yegor
