From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 22 Feb 2019 20:07:37 +0200
Subject: [Buildroot] [PATCH v7 0/8] Top-level parallel build support
In-Reply-To: <1e8db4c8-8bd4-d47a-ae39-a2d461a49672@andin.de>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228182159.02a8a6c4@windsurf>
 <1e8db4c8-8bd4-d47a-ae39-a2d461a49672@andin.de>
Message-ID: <CAMw6YJL9ciuU=tScsbV3rqH1KFd+OaPn6jN+DrUDqTdLizqQCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Fri, Feb 22, 2019 at 6:19 PM Andreas Naumann <dev@andin.de> wrote:
>
> Hi Thomas,
>
> finally I found some time to try this v7 on top of 2019.02-rc1.
>
> Am 28.12.18 um 18:21 schrieb Thomas Petazzoni:
> > Hello,
> >
> > On Fri, 28 Dec 2018 11:43:27 +0100, Thomas Petazzoni wrote:
> >
> >> Here is a seventh iteration of the per-package SDK and target
> >> directory implementation, offering top-level parallel build
> >> capability.
> >
> > Regarding top-level parallel build, I prepared this Wiki page that
> > documents the progress of the effort:
> >
> >    https://elinux.org/Buildroot:Top_Level_Parallel_Build
> >
>
> My update to the known remaining issues is:
> 1. I no longer see the ccache problem for the kconfig packages
> (uboot+linux)
>
> 2. the package-file-list problem has become a blocker since commit
> 3c8f0d9 core/pkg-infra: restore completeness of packages files lists
> with failures like
>
> comm: /home/jenkins/.../build/.files-list-staging.new: No such file or
> directory
>
> Would it be an idea to write the statistics per package :-) inside the
> package build folder and assemble them into one file only once all
> packages are built?
>
> best regards,
> Andreas
>
>
>
>
> PS. Actually I just tried flock, which looks promising. If it works I'll
> send a patch next week.
>

I 'd try it too, but the provided URL does not work :-(

Regards,
Vadim Kochan
