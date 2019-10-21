From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 21 Oct 2019 12:00:49 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-reentry: add host variant
In-Reply-To: <20191021100502.1fb37965@windsurf.home>
References: <20191020190142.18672-1-asafka7@gmail.com>
 <20191020190142.18672-2-asafka7@gmail.com>
 <20191021100502.1fb37965@windsurf.home>
Message-ID: <CALFsTFXTicPF07+mTzSsM4apHCM_jEis66TEFV2ASoSo5+gk2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 21, 2019 at 11:05 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 20 Oct 2019 22:01:42 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > Add needed host variants to relevant dependencies.
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>
> Why do we need a host variant for python-reentry ?

That's because packages which use reentry will probably have
setup_requires=['reentry'] and reentry_register=True in their
setup.py.
On installation, reentry creates a file with the registered
entrypoints that you can read on the target when you need to load
them.
Maybe I should send a v2 and explain that in the commit?

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Asaf.
