From: Matthew Weber <matthew.weber@collins.com>
Date: Thu, 17 Jan 2019 09:11:07 -0600
Subject: [Buildroot] [PATCH v6 1/7] package/compiler-rt: new package
In-Reply-To: <4069fbca-d6c0-77a8-db66-75626ed81450@smile.fr>
References: <1546552368-50707-1-git-send-email-matthew.weber@rockwellcollins.com>
 <987334a5-7b11-8f24-daf9-4c77dc7466b4@smile.fr>
 <CANQCQpYJ6SDxfnskWhAv2nt9JP8rJO2iyDHOtuK8Fqe_yactGQ@mail.gmail.com>
 <4069fbca-d6c0-77a8-db66-75626ed81450@smile.fr>
Message-ID: <CANQCQpanRoV0yYauHQjqTPW+dOJLWT-A3fCJjeCu5HeBhpY3Zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Thu, Jan 17, 2019 at 8:08 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> Hi Matt,
>
> Le 17/01/2019 ? 00:36, Matthew Weber a ?crit :
> > Romain,
> >
> >
> > On Wed, Jan 16, 2019 at 3:59 PM Romain Naour <romain.naour@smile.fr> wrote:
> >>
> >> Hi Matt,
> >>
> >> Le 03/01/2019 ? 22:52, Matt Weber a ?crit :
>
> [...]
>
> >>> +
> >>> +COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_INCLUDE_TESTS=ON \
> >>
> >> Why building the testsuite and tests ?
> >
> > It has been awhile and I don't remember the specific reason.  After
> > glancing at the cmake files, I believe I was using the test builds as
> > a way to verify the libraries could be linked against.  I'll start a
> > test build with that option removed and see if the runtime test has
> > any issues.  I would keep the tests enabled though as it allows the
> > user to see if their llvm setup works for fuzzing without having to
> > debug a custom application too. (Maybe that should be a comment above
> > the conf opts :-)
> >
>
> By default, Buildroot packages should disable tests and testsuite when possible
> in order to keep rootfs small as possible.

I've verified we can disable them without impact.  If I respin another
revision I can set that option to OFF.

>
> That is why several options are set in the package infra (see pkg-cmake.mk):
>    -DBUILD_EXAMPLE=OFF
>    -DBUILD_EXAMPLES=OFF
>    -DBUILD_TEST=OFF
>    -DBUILD_TESTS=OFF
>    -DBUILD_TESTING=OFF
>
> But the question is, do we need a global option to enable building packages
> tests and testsuite?
>
> Otherwise, I'm fine to keep this option enabled if this is useful.

My preference is that we leave them enabled as then the run-time test
would catch additional corner cases as versions are bumped.  :-)

Matt
