From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 7 Apr 2019 12:13:42 +0300
Subject: [Buildroot] [PATCH] Revert "package/gettext-tiny: bump version
 to add --template option"
In-Reply-To: <20190407084926.GJ2659@scaer>
References: <20190407073708.11205-1-yann.morin.1998@free.fr>
 <CADvTj4ofweg9YnvMz6bzd_QMsgOVv14EKL1ARCP6LKPCYdVXDA@mail.gmail.com>
 <20190407083026.GI2659@scaer>
 <CADvTj4pD-CgazLkKT_jdzRcKEoBCoMru6drevdi5JZ-qwchLdQ@mail.gmail.com>
 <20190407084926.GJ2659@scaer>
Message-ID: <20190407091342.urpr5hri5rqly5xn@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, James, All

On Sun, Apr 07, 2019 at 10:49:26AM +0200, Yann E. MORIN wrote:
> James, All,
> 
> On 2019-04-07 10:45 +0200, James Hilliard spake thusly:
> > On Sun, Apr 7, 2019 at 10:30 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2019-04-07 10:23 +0200, James Hilliard spake thusly:
> > > > On Sun, Apr 7, 2019 at 9:37 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > >
> > > > > This reverts commit 758ea0e518492c703482a323653c3d20520b599b.
> > > > >
> > > > > 758ea0e bumped gettext-tiny to the latest (at the time) head of the
> > > > > upstream git tree. In so doing, it included an upstream change of
> > > > > behaviour that eventually broke the build of packages that use
> > > > > -Werror=format-string.
> > > > I'm assuming the glib2 build error was caused by this change.
> > >
> > > Yes, see the build failure I pointed to below...
> > Ah, I was a little confused exactly how -Werror=format-nonliteral was related to
> > -Werror=format-string.
> 
> That's me again confused with the other patch from Vadim that was
> applied to gettext-tiny...
> 
> > > > I have a potential fix for that here:
> > > > https://gitlab.gnome.org/GNOME/glib/merge_requests/770/diffs
> > >
> > > I've ahd a quick look, but since I don;t know the glib2 code, I have no
> > > idea if that is the correct solution.
> > >
> > > However, you're probably going to have to provide more explanations
> > > about your change to upstream, because libglib2 does build with the
> > > non-tiny  implementations (either from glibc or from GNU gettext).
> > Oh, I wasn't aware this was limited to a specific getttext implementation.
> > I'll mention that in the pull request.
> 
> Be sure to check and test locally before hand! ;-)
> 

I sent yet-another-patch in:

	https://patchwork.ozlabs.org/patch/1079937/

but do you think it is better to fix issue per-package ?

Regards,
Vadim Kochan
