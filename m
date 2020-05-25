From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 25 May 2020 11:06:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: remove hardcoded
 interface from config to args
In-Reply-To: <244d4bb9817b608fa5f994a05c8c70c5@walle.cc>
References: <20200520051647.18530-1-heiko.thiery@gmail.com>
 <20200521153619.5466d4e6@windsurf.home>
 <244d4bb9817b608fa5f994a05c8c70c5@walle.cc>
Message-ID: <CAEyMn7YJt7EL5djsAuYX1biXQk=tYAjJL9eGQ4AgwDuoV6EMkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael, Hi Petr,

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

A replacement of the currently used configuration could be a break in
backward compatibility? But as you said using the default linuxptp
configuraiton sounds to be a better solution. Since the currently used
config seems a use case from the initial committer (Petr Kulhavy).

-- 
Heiko
