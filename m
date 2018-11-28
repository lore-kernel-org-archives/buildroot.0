From: Matthew Weber <Matthew.Weber@collins.com>
Date: Wed, 28 Nov 2018 16:35:04 -0600
Subject: [Buildroot] [External] Re: [PATCH v8 1/1] docker-engine: split
 docker-{cli, engine}, bump to v18.06.1-ce
In-Reply-To: <87ftvnyz7c.fsf@paral.in>
References: <20181108032458.1028-1-christian@paral.in>
 <CANQCQpa0SGdEHVFxn_wmKnktat18iAJ2YLXYQd+4Uqzq5GzG4A@mail.gmail.com>
 <874lcki4rw.fsf@paral.in>
 <CANQCQpaK4m3iqadyDAzuypV2Ze3LdhedHhn50AxF41buOMrTDQ@mail.gmail.com>
 <871s7liu5e.fsf@paral.in>
 <CANQCQpYM2E_+rMfDQ7svB05V4TfJKpgHCOpoPN49uLLqRZ30Hw@mail.gmail.com>
 <87ftvnyz7c.fsf@paral.in>
Message-ID: <CANQCQpaF3LGyTkGZ29JhbgXgQzcd5UMCTkSo_mKmcav-iW0Hag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,


On Mon, Nov 26, 2018 at 9:30 PM Christian Stewart <christian@paral.in> wrote:
>
> Hi Matthew,
>
> Matthew Weber <Matthew.Weber@collins.com> writes:
> > I haven't got back to doing more evaluation of docker, but when I
> > stopped working on things, I was able to narrow the hang down to be
> > related to the initialization of random.
>
> I have found the same. My laptop boot up would be blocked for minutes,
> and it was quite annoying / concerning, but I found that when I pressed
> some keys / moved the mouse the hang would go away. That would match
> with a starvation of entropy in the kernel.
>
> > The one use case I have been thinking about for new projects is
> > building the most basic possible hosting environment to manage the
> > security footprint.  Maybe a LXC system container hosting environment
> > or a non-systemd dockerd.  Then inside of that run a systemd based
> > docker deployment which would be easier to swap out and do a true
> > shared filesystem approach vs a system container......
>
> I think the most minimum environment would be base Buildroot with either
> the docker-containerd / runc stack, or something like cri-o (a
> Kubernetes minimal container runtime I am examining for use with
> Buildroot). One thing to consider is that the Go dependencies could be
> compiled together into a single binary, which would reduce binary
> footprint quite a bit I think. Much of Docker / dockerd features are
> unnecessary and can be removed as well / mapped to Buildroot options.
>

I noticed that flatpak now has OCI format support.  That could be an
interesting way to go light weight without a GO dependency.....

Matt
