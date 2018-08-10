From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Aug 2018 18:33:31 -0500
Subject: [Buildroot] [PATCH v1 1/1] tini: new package
In-Reply-To: <20180811001720.6f407992@windsurf>
References: <20180810184255.17612-1-christian@paral.in>
 <20180810215502.1647fe01@windsurf>
 <CA+h8R2pEc4A-=jch5c1A8SchJv6K+LZrrHSy+EcSbp=Tnw6Xvg@mail.gmail.com>
 <20180811001720.6f407992@windsurf>
Message-ID: <CANQCQpZuPG658Kz+675RGSbNdFrH4kEd=Cm-FTnYM1Wze2qM9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
On Fri, Aug 10, 2018 at 5:17 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri, 10 Aug 2018 15:11:11 -0700, Christian Stewart wrote:
>
> > On Fri, Aug 10, 2018 at 12:55 PM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > >
> > > What does "Docker now statically links to Tiny internally" mean ?
> >
> > I suppose the commit note is not clear. I am basically saying that we
> > do not need to statically link Tini, unlike previous revisions of this
> > commit. The intent of this package is no longer to satisfy the
> > docker-init requirement, but instead to just provide the "tini" binary
> > in the target environment, dynamically linked or otherwise.
>
> Why did the requirement change ?

Tini can be used for cases where you do a basic container and the
filesystem isn't isolated from the host.  Thus no need for static
building of the init process.

>
> > According to https://github.com/krallin/tini - NOTE: If you are using
> > Docker 1.13 or greater, Tini is included in Docker itself. This
> > includes all versions of Docker CE. To enable Tini, just pass the
> > --init flag to docker run.
>
> If Tini is included in Docker itself, why do we need a package for it ?

Basic LXC based containers can use it when are doing an abbreviated
init sequence for a container start.

Matt
