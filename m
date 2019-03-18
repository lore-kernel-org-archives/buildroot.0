From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 18 Mar 2019 22:28:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/binutils: upstream fixes for
 2.31.1
In-Reply-To: <20190318220522.5b18fff5@windsurf>
References: <20190317211848.3721-1-nolange79@gmail.com>
 <20190318220522.5b18fff5@windsurf>
Message-ID: <CADYdroNo+Um5YMrrndErZJX5ox0903zkeajOsrgmAtH7TKe0PA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 18. M?rz 2019 um 22:05 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Norbert,
>
> On Sun, 17 Mar 2019 22:18:48 +0100
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > combining musl and binutils 2.31.1 will
> > produce static applications that crash
> > immediately.
> > Picked 3 upstream commits to remedy this.
> >
> > see https://sourceware.org/bugzilla/show_bug.cgi?id=23428
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  ...OPERTY_X86_ISA_1_USED-note-if-needed.patch | 568 +++++++++++++++++
> >  ...ly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch | 588 ++++++++++++++++++
> >  ...operly-add-X86_ISA_1_NEEDED-property.patch | 140 +++++
> >  3 files changed, 1296 insertions(+)
> >  create mode 100644 package/binutils/2.31.1/0012-x86-Add-a-GNU_PROPERTY_X86_ISA_1_USED-note-if-needed.patch
> >  create mode 100644 package/binutils/2.31.1/0013-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch
> >  create mode 100644 package/binutils/2.31.1/0014-x86-Properly-add-X86_ISA_1_NEEDED-property.patch
>
> Applied to master, thanks. So those commits are all in binutils 2.32,
> so we're good there. What about binutils 2.30 ? Are they affected as
> well, or not affected because the issue is a regression introduced
> between binutils 2.30 and 2.31 ?

To my best knowledge  the bug was introduced in 2.31, as change to
that version caused the programs to crash.
The bug-report states the same. I cant point to a commit/feature that
caused the issue.

Regards, Norbert
