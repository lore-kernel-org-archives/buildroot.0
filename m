From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 5 Feb 2021 23:43:04 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-02-04
In-Reply-To: <20210205213453.GZ2384@scaer>
References: <601cff45.1c69fb81.945af.db28SMTPIN_ADDED_MISSING@mx.google.com>
 <CAEyMn7YCuUkYKdd-6gaH85NQcSpg5EMWJKstGtFZTmu65kDbUQ@mail.gmail.com>
 <87lfc27474.fsf@dell.be.48ers.dk> <20210205213453.GZ2384@scaer>
Message-ID: <20210205234304.768f8a73@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 5 Feb 2021 22:34:53 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2021-02-05 19:35 +0100, Peter Korsgaard spake thusly:
> > >>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:
> >  >> mipsel    |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/da0e36543cf68e4e9bbe819945a884193f33819a
> [--SNIP--]
> >  > So I see here 3 possible solutions:
> >  > 1. do the PRE_INSTALL_HOOK to remove the files every time (disclaimed by Yann).
> >  > 2. remove this files by hand (no long term solution).
> >  > 3. disable the installation of the yang modules .. but then we have a
> >  > non functional installation available and we leave the installation of
> >  > the yang modules to the user.
> >
> > Ideally the package should be fixed to create those files in
> > $DESTDIR/dev/shm rather than mess around with the host /dev/shm.
> >
> > But as /dev/shm is not persistent, how does this work at runtime? What
> > do those files do exactly?
>
> They are shared memory.
>
> From shm_overview(7):
>
>     On Linux, shared memory objects are created in a (tmpfs(5)) virtual
>     filesystem, normally mounted under /dev/shm. [...]
>
> There is in fact nothing wrong in creating such shm objects during the
> build.
>
> What is wrong, is leaving them lingering about...

What happens with two independent buildroot builds both doing netopeer2 install
at the same time? Compete/interfere on the same files in /dev/shm/sh_*? Think
the only proper solution is to avoid the shm files or create them inside the
buildroot working directory (and cleanup afterwards)...

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>
