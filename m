From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 7 Jun 2020 22:57:58 +0200
Subject: [Buildroot] [PATCH 2/2] package/dbus: remove /usr/lib/dbus-1.0
 if empty
In-Reply-To: <20200607104549.420b50ff@windsurf>
References: <20200605225247.13350-1-nolange79@gmail.com>
 <20200605225247.13350-2-nolange79@gmail.com>
 <20200606223808.5797eb98@windsurf>
 <CADYdroNQNLa3a2TkgJoPJgj460+XD7rRcwWYKaa_2bV9sqejGQ@mail.gmail.com>
 <20200607104549.420b50ff@windsurf>
Message-ID: <CADYdroPdfDQn=9o0=D7GUqW1VuTbQ_ahdrhP0VSr-Q4F0-yAHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 7. Juni 2020 um 10:45 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Norbert,
>
> On Sun, 7 Jun 2020 00:36:47 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > > Your Signed-off-by is missing, and there is no commit log. We clearly
> > > need a better explanation. And your commit title is wrong: you're not
> > > just removing /usr/lib/dbus-1.0 is empty: you're changing from removing
> > > it unconditionally to removing just /usr/lib/dbus-1.0/include and then
> > > removing /usr/lib/dbus-1.0 if it's empty.
> >
> > Ok, gonna improve that in a v2 if you find no other objections
>
> My main objection is that we need a better commit log.
>
> > > So it means that you have installed *something* in /usr/lib/dbus-1.0
> > > that you want Buildroot to keep on the target. But what? This is not
> > > explained in your commit log.
> >
> > I wrote this commit some months ago, would have to outright lie, but I
> > think it was dbusbroker (patch on the ML).
> > The basic gist is, that /usr/lib/dbus-1.0 is some sort of libexec dir
> > (on Debian and Fedora AFAIK), and I believe dbusbroker installs it
> > stuff there.
> >
> > What we really want is to remove the unneeded files (the includes),
> > and the parent directory it is empty.
>
> Could you verify what dbusbroker installs in this directory, explain
> why it is relevant, and use that as a justification in the commit log ?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Well,

turns out I was playing with libexec configuration, and dbus then
places its helpers in /usr/lib/dbus-1.0.
So, it's actually useless for the upstream buildroot (as you wont
allow for libexec config), but it actually wont hurt either.
Amended patch is following.
