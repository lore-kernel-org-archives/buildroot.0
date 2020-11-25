From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 25 Nov 2020 15:49:57 -0600
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <CA+h8R2riT4aCEGKBC=Y9i1v80ieTj9YkTCv=Ay+-njLfipiRfQ@mail.gmail.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
 <CALq67GBxOe=U_25AKWG9EB8bNeUveE-SX5tNyd9BG=0gqe9uEw@mail.gmail.com>
 <CA+h8R2rmbBY5MjBTgFitdHcDMbmyMh-w+Uvs0rVz6xOrqF-h6A@mail.gmail.com>
 <CA+h8R2riT4aCEGKBC=Y9i1v80ieTj9YkTCv=Ay+-njLfipiRfQ@mail.gmail.com>
Message-ID: <CALq67GBso+b2pN-55-67eU_nvOt5QKtBCxAD6EkW5P0F-5odoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, Thomas,

On Wed, Nov 25, 2020 at 3:21 PM Christian Stewart <christian@paral.in> wrote:
>
> Hi Ryan, Thomas, all,
>
> I have a modified version of the go-post-process patch with fixes here:
>
> https://github.com/skiffos/buildroot/commit/5f31774f54402f07c1d83aa407430db5152e6de3
>
> On Wed, Nov 25, 2020 at 1:12 PM Christian Stewart <christian@paral.in> wrote:
> > On Wed, Nov 25, 2020 at 1:07 PM Ryan Barnett <ryanbarnett3@gmail.com> wrote:
> > > I've tried out the new go vendoring support and I am running into an
> > > issue with cleaning the build directory when using this series. I've
> > > added a new package on your pkg-mgr branch called maddy with the
> > > following at package/maddy/maddy.mk:
> >
> > > make maddy
> > > make clean
> >
> > > The error I get is as follows:
> > >
> > > rm -rf /home/ryan/projects/br/br-pkg-mgr/output/target
> > > /home/ryan/projects/br/br-pkg-mgr/output/images
> > > /home/ryan/projects/br/br-pkg-mgr/output/host  \
> > >         /home/ryan/projects/br/br-pkg-mgr/output/build
> > > /home/ryan/projects/br/br-pkg-mgr/output/staging \
> > >         /home/ryan/projects/br/br-pkg-mgr/output/legal-info
> > > /home/ryan/projects/br/br-pkg-mgr/output/graphs
> > > /home/ryan/projects/br/br-pkg-mgr/output/per-package
> > > rm: cannot remove
> > > '/home/ryan/projects/br/br-pkg-mgr/output/host/share/go-path/pkg/mod/github.com/cespare/xxhash/v2 at v2.1.1/README.md':
> > > Permission denied
>
> Here is the fix for this issue specifically (using the modcacherw flag):

[...]

I manually added the '-modcacherw' flag to the pkg-golang.mk and
go-post-process files and I was able to now successfully run 'make
clean'

Thanks for the quick response and the fix.

-Ryan
