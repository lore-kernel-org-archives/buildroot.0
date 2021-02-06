From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 6 Feb 2021 10:36:33 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-02-04
In-Reply-To: <87zh0i5h0j.fsf@dell.be.48ers.dk>
References: <601cff45.1c69fb81.945af.db28SMTPIN_ADDED_MISSING@mx.google.com>
 <CAEyMn7YCuUkYKdd-6gaH85NQcSpg5EMWJKstGtFZTmu65kDbUQ@mail.gmail.com>
 <87lfc27474.fsf@dell.be.48ers.dk> <20210205213453.GZ2384@scaer>
 <87zh0i5h0j.fsf@dell.be.48ers.dk>
Message-ID: <CAEyMn7agaFGqF85LGHz5AFDwYap88Okj7+dQv-3_KJr8MQ+LJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am Fr., 5. Feb. 2021 um 22:41 Uhr schrieb Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
> Hi,
>
>  >> Ideally the package should be fixed to create those files in
>  >> $DESTDIR/dev/shm rather than mess around with the host /dev/shm.
>  >>
>  >> But as /dev/shm is not persistent, how does this work at runtime? What
>  >> do those files do exactly?
>
>  > They are shared memory.
>
>  > From shm_overview(7):
>
>  >     On Linux, shared memory objects are created in a (tmpfs(5)) virtual
>  >     filesystem, normally mounted under /dev/shm. [...]
>
> That I get.
>
>  > There is in fact nothing wrong in creating such shm objects during the
>  > build.
>
> From the logs it looks like they are created during the installation,
> rather than during the build.
>
>  > What is wrong, is leaving them lingering about...
>
> Indeed. I don't particular understand why the installation step needs to
> fiddle with shared memory objects in the first place, but Ok.

The reason is that sysrepo and sysrepoctl create these files for
handling the modules. Indeed it is not 100% clear to me if these files
are really needed when installing the modules. But I think this by
design of syrepo.

> So these objects are only needed temporarily during installation and not
> later at runtime?

In this case these files are only temporarily needed during the
installation. Later on the target these files are also created for
runtime.

-- 
Heiko
