From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 3 Apr 2020 00:04:57 -0700
Subject: [Buildroot] [PATCH v7 3/4] package/python-pybind11: new host
 package
In-Reply-To: <CAMty3ZBFR+3bvhgLdL6tfELbu4e4S7zqniaS=yKeuNccOQOUkg@mail.gmail.com>
References: <20200321190241.3590-1-jagan@amarulasolutions.com>
 <20200321190241.3590-4-jagan@amarulasolutions.com>
 <CALFsTFWUZaVntJKKxfBNOVgihs8eLmTU-YPZbdYswLZKuhhaYA@mail.gmail.com>
 <CAMty3ZBFR+3bvhgLdL6tfELbu4e4S7zqniaS=yKeuNccOQOUkg@mail.gmail.com>
Message-ID: <CAFSsvmrE6Gc52iMC5=-QFJFtofqy_uu2mLezxBG=+zDbtRHgow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

Feel free to also add my patch which tests pybind11 into your series:
https://patchwork.ozlabs.org/patch/1202658/

On Wed, Apr 1, 2020 at 8:22 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Asaf,
>
> On Wed, Mar 25, 2020 at 12:50 PM Asaf Kahlon <asafka7@gmail.com> wrote:
> >
> > Hello,
> >
> > On Sat, Mar 21, 2020 at 9:03 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Add python-pybind11 package with 2.4.3 release version.
> > >
> > > Cc: Esben Haabendal <esben@geanix.com>
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > > Changes for v7:
> > > - update the commit message
> > > - fix sha256 value of pybind11 LICENCE
> > >
> > >  DEVELOPERS                                   |  1 +
> > >  package/Config.in.host                       |  1 +
> > >  package/python-pybind11/Config.in.host       |  7 +++++++
> > >  package/python-pybind11/python-pybind11.hash |  5 +++++
> > >  package/python-pybind11/python-pybind11.mk   | 14 ++++++++++++++
> > >  5 files changed, 28 insertions(+)
> > >  create mode 100644 package/python-pybind11/Config.in.host
> > >  create mode 100644 package/python-pybind11/python-pybind11.hash
> > >  create mode 100644 package/python-pybind11/python-pybind11.mk
> >
> > I don't think pybind11 should be a host package. It's a header-only library
> > and the headers are used to compile target sources (in your case - scipy).
> > The headers should be only installed to the staging dir (like spdlog,
> > for example).
> > You can take a look here as a reference:
> > https://patchwork.ozlabs.org/patch/1202657/
>
> Thanks for commenting on this.
>
> Please check this build log[1], it look phbind11 host package required
> to build scipy. Let me know if I miss anything?
>
> [1] https://gist.github.com/openedev/19eb3dcf1e56bd267a72b30417d1b3b4
>
> Jagan.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
