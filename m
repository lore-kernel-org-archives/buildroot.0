From: Matthew Weber <matthew.weber@collins.com>
Date: Wed, 5 Feb 2020 16:28:27 -0600
Subject: [Buildroot] [PATCH 1/2] package/localedef: bump to version 2.30
In-Reply-To: <20200205232202.6ad30ff3@gmx.net>
References: <20200125234918.24829-1-romain.naour@gmail.com>
 <CANQCQpZhQPvjr27oZwBeyPOnQDjtti-1XUp+_xQHCJesYBmMiw@mail.gmail.com>
 <CANQCQpZ8g-L_Y5V3Xp5x99QaWotqQSPn5snV75e3w08TUG8zrA@mail.gmail.com>
 <20200131222420.3d92ff13@gmx.net>
 <CANQCQpbE5nexg6HAt6Lhb9RTopYhmvjj32xnQ8fWTbS3CXe9EA@mail.gmail.com>
 <20200205232202.6ad30ff3@gmx.net>
Message-ID: <CANQCQpYk=3kZXm7LeHyKhxKQ0a3ocUozD+yhmEsiLw+Q5jtoDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter S,

On Wed, Feb 5, 2020 at 4:22 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello Matt,
>
> On Wed, 5 Feb 2020 09:15:18 -0600, Matthew Weber <matthew.weber@collins.com> wrote:
>
> > Peter,
> >
> > On Fri, Jan 31, 2020 at 3:25 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > >
> > > Hello *,
> > >
> > > On Fri, 31 Jan 2020 14:32:39 -0600, Matthew Weber <matthew.weber@rockwellcollins.com> wrote:
> > >
> > > > Romain,
> > > >
> > > > On Fri, Jan 31, 2020 at 1:47 PM Matthew Weber
> > > > <matthew.weber@rockwellcollins.com> wrote:
> > > > >
> > > > > Romain,
> > > > >
> > > > > On Sat, Jan 25, 2020 at 5:50 PM Romain Naour <romain.naour@gmail.com> wrote:
> > > > > >
> > > > > > Use the same version as for glibc package.
> > > > >
> > > > > Seems this bump requires a newer host compiler.  I found this on
> > > > > Ubuntu 16.04.2  with gcc (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0
> > > > > 20160609
> > > > >
> > > > > BR2_aarch64=y
> > > > > BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> > > > > BR2_KERNEL_HEADERS_4_14=y
> > > > > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > > > > BR2_LINUX_KERNEL=y
> > > > > BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > > > > BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> > > > > BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > > > > BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> > > > > BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> > > > >
> > > > > make host-localedef
> > > > >
> > > > > configure: error:
> > > > > *** These critical programs are missing or too old: compiler
> > > > > *** Check the INSTALL file for required versions.
> > > > >
> > > > > per the INSTALL file, GCC 6.2 or higher is required
> > > >
> > > > I did a build test reverting the 6.2 check (left it checking for 5)
> > > > and it built OK.  I'd suggest adding a patch to revert
> > > > https://sourceware.org/git/?p=glibc.git;a=commit;h=4dcbbc3b28aaeafe23e1a30db84055aa6f6fa987
> > > > .
> > > >
> > > > In addition, I agree a host toolchain dependency needs to be added for
> > > > 5 (unless we also revert
> > > > https://sourceware.org/git/?p=glibc.git;a=commit;h=192963be49678b48f60218f1f794991cdd9fe472
> > > >  to get back to 4.x which doesn't seem like it would work out).
> > > >
> > >
> > > Suggested RFC patch (way back from December 2018) contained already an
> > > '0002-HACK-accept-old-toolchains.patch' to fix configure/compile for
> > > old host toolchains (see [1])..., maybe time to resurrect (and rebase)
> > > this one?
> >
> > Agree, plus your 0001 for the linker seems to be required as well in
> > the case I see with using 2019.11.1 on Ubuntu 16.04.
>
> I can provide a buildroot package/localdef patch the next days (but no chance to
> test myself as I have no access to an legacy linux system at the moment), or
> do you want to take over?

I'm more than happy to create the patches/test or test ones you
submit.  I'll jump on IRC and see if I can clarify the preferred
workaround/fix.

Matt
