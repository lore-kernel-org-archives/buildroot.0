From: Matthew Weber <matthew.weber@collins.com>
Date: Wed, 30 Jan 2019 08:20:04 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-01-29
In-Reply-To: <20190130151741.4d029f0b@windsurf>
References: <20190130070033.5B474209F9@mail.bootlin.com>
 <CANQCQpaAX1mdL8e=V2uNsamy4vLNpR7AhH0H1U0k8AG+U6bMAw@mail.gmail.com>
 <20190130151741.4d029f0b@windsurf>
Message-ID: <CANQCQpZgOum6Ck3Ty3qUAk9Pt7fNq8yCDUoJQ9NpVGA2dtK7+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Jan 30, 2019 at 8:17 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 30 Jan 2019 08:01:32 -0600
> Matthew Weber <matthew.weber@collins.com> wrote:
>
> > >      sparc64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/10fd13cef3389b0c88f85572911a01279407516e |
> > >          arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/7ec686d7b73886f01fba6a8ad690e6149113aeb7 |
> > >     mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a61dd5e2eda71065d2a892843d4f2ea900a6688c |
> > >       mipsel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/52911efd3380bfa5e20c2e37dedb5ecbf472dde3 |
> >
> > The bug that's causing this failure is an artifact of the old GCC
> > configuration I'm building with.  I've attempted to update GCC but
> > this hasn't seemed to resolve the issue like it should.  Rather then
> > creating a even more non-standard distro configuration, (just for this
> > machine)I've added a filter in autobuild-run to drop GRPC when it gets
> > selected to build.
> >
> > I plan to re-install soon as EOL is coming up in a couple months.
>
> Which host gcc version are you using ? We try to support old systems,
> so perhaps instead of ignoring the problem we really need to fix it
> and/or work around it.

No doubt, agree.  GCC 4.9.4-2ubuntu1~14.04.1 at this time.
Originally was 4.8.4 before updating.  I'll kick off a build with one
of the failures about and share more details.
