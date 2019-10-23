From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 23 Oct 2019 22:27:36 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-reentry: add host variant
In-Reply-To: <20191022222707.21f2d917@windsurf>
References: <20191020190142.18672-1-asafka7@gmail.com>
 <20191020190142.18672-2-asafka7@gmail.com>
 <20191021100502.1fb37965@windsurf.home>
 <CALFsTFXTicPF07+mTzSsM4apHCM_jEis66TEFV2ASoSo5+gk2g@mail.gmail.com>
 <20191022222707.21f2d917@windsurf>
Message-ID: <CALFsTFVjaBwoCnHoi2Kv_prV99pX5J7ft2iJQ8tBqnscvyuWMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Oct 22, 2019 at 11:27 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 21 Oct 2019 12:00:49 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > > Why do we need a host variant for python-reentry ?
> >
> > That's because packages which use reentry will probably have
>
> "probably" ?
Well, if you want to use reentry it's more than just "probably" =]
>
> > setup_requires=['reentry'] and reentry_register=True in their
> > setup.py.
> > On installation, reentry creates a file with the registered
> > entrypoints that you can read on the target when you need to load
> > them.
> > Maybe I should send a v2 and explain that in the commit?
>
> Yes, we will need a better commit log, but more importantly, do we have
> any package in Buildroot that needs this ? Or is it custom/private
> packages that you have ?

I don't see any Buildroot package which uses reentry...
To be honest, I don't know the project in depth and I don't know who
maintains it.
I found it when I looked for an efficient entrypoint mechanism after I
noticed that
making "import pkg_resources" on my board took very long time, and I
thought it would
be nice to share this package with the Buildroot community in order to
let other people
benefit from it.
In my private Python packages I use reentry as a replacement for
pkg_resources and
I got much improved performance.

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Asaf.
