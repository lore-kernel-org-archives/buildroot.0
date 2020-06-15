From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 15 Jun 2020 13:35:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: remove hardcoded
 interface from config to args
In-Reply-To: <CAEyMn7bo79XgZ9UkM8_BKMqDovs=eiDUa8c+A4StYnt2+zq92w@mail.gmail.com>
References: <20200520051647.18530-1-heiko.thiery@gmail.com>
 <20200521153619.5466d4e6@windsurf.home>
 <244d4bb9817b608fa5f994a05c8c70c5@walle.cc>
 <CAEyMn7bo79XgZ9UkM8_BKMqDovs=eiDUa8c+A4StYnt2+zq92w@mail.gmail.com>
Message-ID: <CAEyMn7b+6qyGd9xtJz3qp8HKB0Pv_83R9GQzCyg4g8kRv2gcKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Hi Michael,

Am Mi., 27. Mai 2020 um 08:51 Uhr schrieb Heiko Thiery <heiko.thiery@gmail.com>:
>
> Hi Petr,
>
>
> Am Do., 21. Mai 2020 um 23:22 Uhr schrieb Michael Walle <michael@walle.cc>:
> >
> > Hi all,
> >
> > Am 2020-05-21 15:36, schrieb Thomas Petazzoni:
> > > Hello Heiko,
> > >
> > > On Wed, 20 May 2020 07:16:48 +0200
> > > Heiko Thiery <heiko.thiery@gmail.com> wrote:
> > >
> > >> Interface configuration is hard coded in the config file. This will
> > >> throw an error when this interace (eth0) is not present.
> > >>
> > >> This patch removes the interface to be used from the config and
> > >> appends it
> > >> to the PTP4L_ARGS. With this the custom arguments can be set via
> > >> /etc/defaults/ptp4l.
> > >
> > > Well, you can also just as well provide your custom linuxptp.cfg in a
> > > rootfs overlay, no?
> >
> > You can, but then you'd have to copy the configuration on each and every
> > board which has another interface name than "eth0". That being said, I'd
> > also prefer it to have the normal default config, shipped with linuxptp.
> > Like at least debian does too.
>
> What do you think? Can we change the default configuration to the one
> coming from the package? As Michael mentioned this is also the case
> e.g. for debian.

Since no reply from the package maintainer about changing the default
configuration what do you think? Should we change the used config to
the one provided by the upstream linuxptp?

-- 
Heiko
