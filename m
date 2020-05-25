From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 May 2020 09:40:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: remove hardcoded
 interface from config to args
In-Reply-To: <CAEyMn7ZfS7oj9iWXngWnYK6iCbj0dEgNys+tw-ZohxKQjiWH=A@mail.gmail.com>
References: <20200520051647.18530-1-heiko.thiery@gmail.com>
 <20200521153619.5466d4e6@windsurf.home>
 <CAEyMn7ZfS7oj9iWXngWnYK6iCbj0dEgNys+tw-ZohxKQjiWH=A@mail.gmail.com>
Message-ID: <20200525094005.750c46e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 May 2020 22:52:07 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > Well, you can also just as well provide your custom linuxptp.cfg in a
> > rootfs overlay, no?
> 
> Yes this is for sure a valid solution. You mean it doesn't matter
> adding a custom linuxptp.cfg or a /etc/defaults/ptp4l to change the
> interface to be used because both ways need to add a file to the
> rootfs overlay?

Exactly what I meant indeed.

> > Also, your change to linuxptp.cfg kind of breaks what is explained in
> > linuxptp.cfg:
> 
> I think it does not break the functionality. The patch only changes
> the location of the interface to be used. ptp4l can set the interface
> either in the config or in the arguments.

No, it does not break the functionality, but the explanation in the
comment becomes a bit weird, as the fact that eth0 is used is no longer
configured through that config file.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
