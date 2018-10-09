From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 9 Oct 2018 18:32:56 +0530
Subject: [Buildroot] Qt5 build issues with glibc arm64 buildroot compiler
In-Reply-To: <e62aebb9-3850-4251-1094-f3e79f68ff26@mind.be>
References: <CAMty3ZCAaycY2gazxhYwi1DU_E9tyYP71_ewzstFoba02wTqcw@mail.gmail.com>
 <20181008090308.3c5daa83@windsurf>
 <CAMty3ZDdKsxbRFaPo3JSTH_81O4MvDO5cki6PciN0FGgq+zT4Q@mail.gmail.com>
 <20181008210426.320c927d@gmx.net>
 <e62aebb9-3850-4251-1094-f3e79f68ff26@mind.be>
Message-ID: <CAMty3ZBPzoPpHjuLOBW_U8=2BX46a0rarWA2F+Pez9UftiLtiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 9, 2018 at 12:57 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 8/10/18 21:04, Peter Seiderer wrote:
> > Hello Jagan,
> >
> > On Mon, 8 Oct 2018 13:03:05 +0530, Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> >> On Mon, Oct 8, 2018 at 12:33 PM Thomas Petazzoni
> >> <thomas.petazzoni@bootlin.com> wrote:
> >>>
> >>> Hello Jagan,
> >>>
> >>> On Mon, 8 Oct 2018 11:51:35 +0530, Jagan Teki wrote:
> >>>> Hello,
> >>>>
> >>>> Any one tried of building Qt5 on arm64 with glibc buildroot native
> >>>> compiler. I'm observing build issues as below, let me know If I missed
> >>>> something?
> >>>>
> >>>> BR2_TOOLCHAIN_BUILDROOT_GLIBC
> >>>> BR2_TOOLCHAIN_BUILDROOT_CXX
> >>>> BR2_PACKAGE_QT5
> >>>> BR2_PACKAGE_QT5BASE_EXAMPLES
> >>>> BR2_PACKAGE_QT5BASE_GUI
> >>>> BR2_PACKAGE_QT5BASE_EGLFS
> >>>
> >>> Could you provide an actual Buildroot .config file ? Indeed the above
> >>> config snippet is impossible: BR2_PACKAGE_QT5BASE_EGLFS requires an
> >>> OpenGL implementation, and your list of config options has none
> >>> selected.
> >>
> >> Yes, OpenGL is selected. please see below .config
> >
> > Your given defconfig compiles qt5base without problems here (using
> > buildroot git master)...
>
>  Same here. Looks like a changed config without make clean.

rebase to master build work for me, sorry for missing that. thanks for
all who participate this thread.
