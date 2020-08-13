From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 14:41:04 -0700
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump version
 to 3.4.0
In-Reply-To: <CAFSsvmrrpXkZNcmwy5ukrX4k2XqPGp-kQpNxqq=PN+mG+ir0Tw@mail.gmail.com>
References: <20200715173707.584226-1-aduskett@gmail.com>
 <20200811235833.03115c8b@windsurf.home>
 <CA+h8R2qLY-5FbL_HTjwTH_i=w3ky_=C=17n48_=18-E=9mUYVg@mail.gmail.com>
 <20200812102236.631c057f@windsurf.home>
 <CAFSsvmqzkM2N2syEMc1AZeeRdvQ-HRtkK4zFSOp3q-qumYmCKQ@mail.gmail.com>
 <CA+h8R2oxbeA9Fcfs-aEjpWb_4QC7WbijYW5hm84GAvC3iWP00w@mail.gmail.com>
 <CAFSsvmrrpXkZNcmwy5ukrX4k2XqPGp-kQpNxqq=PN+mG+ir0Tw@mail.gmail.com>
Message-ID: <CA+h8R2p+WPoPxaWv34y_KZJOavF8fbEmGr4urmTH2or6qb-3AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Adam,

On Thu, Aug 13, 2020 at 1:04 PM Adam Duskett <aduskett@gmail.com> wrote:
> Just as a note, the go-modules series breaks mender-artifact, and the
> .mk file needs to be modified

> > On Thu, Aug 13, 2020 at 11:52 AM Adam Duskett <aduskett@gmail.com> wrote:
> > > I submitted a patch based on Mirza's suggestion above which works as expected:
> > > https://patchwork.ozlabs.org/project/buildroot/patch/20200813184947.4042927-1-aduskett at gmail.com/
> >
> > > > Do we have an intermediate solution for 2020.08 ? Would reverting the
> > > > mender-artifact bump resolve the issue ?

I have submitted a v4 of the "GO111MODULE" patch series which fixes this issue.

While looking at this and testing - this is the first host-go package
I've tested in mainline - I discovered that a number of the Go build
variables for host packages are not set correctly.

The v4 of the series correctly builds all the HOST and TARGET packages
in the mainline tree that we have today.

The series is not as massive of a change as it may seem. It's actually
just a simplification, rather than symlinking a fake GOPATH we instead
just allow the Go compiler to pick up the root import path from the
go.mod file. As I've pointed out in the past, the Go developers have
requested everyone switch to the new GO111MODULE system instead of
GOPATH.

FWIW I've been using this + testing it constantly for the last months.

Best regards,
Christian Stewart
