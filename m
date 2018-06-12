From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 12 Jun 2018 10:07:29 -0700
Subject: [Buildroot] [RFC PATCH 6/8] llvm: bump to version 6.0.0
In-Reply-To: <af197ae1-bcbc-0bd7-20ca-03b7e5b6b2a9@smile.fr>
References: <20180608225932.13127-1-joseph.kogut@gmail.com>
 <20180608225932.13127-7-joseph.kogut@gmail.com>
 <af197ae1-bcbc-0bd7-20ca-03b7e5b6b2a9@smile.fr>
Message-ID: <CAMWSM7jYhVD_MAK=2Z6OXCQTacA9Y+Gt1MQYLooABszGi6MVvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Valentin,

On Tue, Jun 12, 2018 at 7:34 AM Valentin Korenblit
<valentin.korenblit@smile.fr> wrote:
>
> Joseph, all,
>
> On 09/06/2018 00:59, Joseph Kogut wrote:
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > ---
> >   ...type-in-ORC-readMem-client-interface.patch | 37 -------------------
> >   package/llvm/llvm.hash                        |  2 +-
> >   package/llvm/llvm.mk                          |  2 +-
> >   3 files changed, 2 insertions(+), 39 deletions(-)
> >   delete mode 100644 package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch
> >
> > -LLVM_VERSION = 5.0.2
> > +LLVM_VERSION = 6.0.0
> >   LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
> >   LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
> >   LLVM_LICENSE = NCSA
>
> Tested-by: Valentin Korenblit <valentin.korenblit@smile.fr>
>
> I've applied the patch and tested llvmpipe on ARM and x86. My only
> doubt is whether we should also keep llvm 5 (no longer mantained).
> Apparently there haven't been changes in the API, most changes are
> related to backends: https://releases.llvm.org/6.0.0/docs/ReleaseNotes.html.
>
> I ask this question because this topic was discussed during the meeting:
> https://elinux.org/Buildroot:DeveloperDaysFOSDEM2018#LLVM.2FClang
>

I was curious about that as well, as I read the notes about the meeting.

If LLVM 5.0 is no longer maintained, I don't see any reason to
continue supporting it, especially if the API hasn't broken.

> I believe we could just bump to 6.0.0 as currently there is only Mesa
> using this package.
>

On the other hand, there's no way for us to know if someone is using
LLVM in their own application that would break by upgrading. I think
the answer to that problem is that they should stay on a Buildroot
release branch that packages the version they need, or they should
submit patches to allow the older version to be selected.

With 6.0.0 being the current stable release, I do think it makes sense
for us to bump it.

Best,
Joseph
