From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 27 May 2020 08:51:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: remove hardcoded
 interface from config to args
In-Reply-To: <244d4bb9817b608fa5f994a05c8c70c5@walle.cc>
References: <20200520051647.18530-1-heiko.thiery@gmail.com>
 <20200521153619.5466d4e6@windsurf.home>
 <244d4bb9817b608fa5f994a05c8c70c5@walle.cc>
Message-ID: <CAEyMn7bo79XgZ9UkM8_BKMqDovs=eiDUa8c+A4StYnt2+zq92w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,


Am Do., 21. Mai 2020 um 23:22 Uhr schrieb Michael Walle <michael@walle.cc>:
>
> Hi all,
>
> Am 2020-05-21 15:36, schrieb Thomas Petazzoni:
> > Hello Heiko,
> >
> > On Wed, 20 May 2020 07:16:48 +0200
> > Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> >> Interface configuration is hard coded in the config file. This will
> >> throw an error when this interace (eth0) is not present.
> >>
> >> This patch removes the interface to be used from the config and
> >> appends it
> >> to the PTP4L_ARGS. With this the custom arguments can be set via
> >> /etc/defaults/ptp4l.
> >
> > Well, you can also just as well provide your custom linuxptp.cfg in a
> > rootfs overlay, no?
>
> You can, but then you'd have to copy the configuration on each and every
> board which has another interface name than "eth0". That being said, I'd
> also prefer it to have the normal default config, shipped with linuxptp.
> Like at least debian does too.

What do you think? Can we change the default configuration to the one
coming from the package? As Michael mentioned this is also the case
e.g. for debian.

-- 
Heiko
