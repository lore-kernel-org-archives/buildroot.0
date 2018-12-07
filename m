From: Christian Stewart <christian@paral.in>
Date: Fri, 7 Dec 2018 14:06:05 -0800
Subject: [Buildroot] [External] Re: [PATCH v8 1/1] docker-engine: split
 docker-{cli, engine}, bump to v18.06.1-ce
In-Reply-To: <CANQCQpaF3LGyTkGZ29JhbgXgQzcd5UMCTkSo_mKmcav-iW0Hag@mail.gmail.com>
References: <20181108032458.1028-1-christian@paral.in>
 <CANQCQpa0SGdEHVFxn_wmKnktat18iAJ2YLXYQd+4Uqzq5GzG4A@mail.gmail.com>
 <874lcki4rw.fsf@paral.in>
 <CANQCQpaK4m3iqadyDAzuypV2Ze3LdhedHhn50AxF41buOMrTDQ@mail.gmail.com>
 <871s7liu5e.fsf@paral.in>
 <CANQCQpYM2E_+rMfDQ7svB05V4TfJKpgHCOpoPN49uLLqRZ30Hw@mail.gmail.com>
 <87ftvnyz7c.fsf@paral.in>
 <CANQCQpaF3LGyTkGZ29JhbgXgQzcd5UMCTkSo_mKmcav-iW0Hag@mail.gmail.com>
Message-ID: <CA+h8R2r_AAdmFXU0e4sA_=hdJ2g9n86F7UKJH6xDRf8AkKXxhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Wed, Nov 28, 2018 at 2:35 PM Matthew Weber <Matthew.Weber@collins.com> wrote:
> > > The one use case I have been thinking about for new projects is
> > > building the most basic possible hosting environment to manage the
> > > security footprint.  Maybe a LXC system container hosting environment
> > > or a non-systemd dockerd.  Then inside of that run a systemd based
> > > docker deployment which would be easier to swap out and do a true
> > > shared filesystem approach vs a system container......
> >
> > I think the most minimum environment would be base Buildroot with either
> > the docker-containerd / runc stack, or something like cri-o (a
> > Kubernetes minimal container runtime I am examining for use with
> > Buildroot). One thing to consider is that the Go dependencies could be
> > compiled together into a single binary, which would reduce binary
> > footprint quite a bit I think. Much of Docker / dockerd features are
> > unnecessary and can be removed as well / mapped to Buildroot options.
> >
>
> I noticed that flatpak now has OCI format support.  That could be an
> interesting way to go light weight without a GO dependency.....

I still think either the cri-o (your aversion to Go is noted) or
Flatpak is the right approach.

To that end I've implemented Flatpak and related dependencies in
Buildroot and have a working patchset here:

https://github.com/paralin/buildroot/commits/add-flatpak

Will begin testing over the next week.

Best regards,
Christian
