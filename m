From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 21 May 2020 22:52:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: remove hardcoded
 interface from config to args
In-Reply-To: <20200521153619.5466d4e6@windsurf.home>
References: <20200520051647.18530-1-heiko.thiery@gmail.com>
 <20200521153619.5466d4e6@windsurf.home>
Message-ID: <CAEyMn7ZfS7oj9iWXngWnYK6iCbj0dEgNys+tw-ZohxKQjiWH=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


> > Interface configuration is hard coded in the config file. This will
> > throw an error when this interace (eth0) is not present.
> >
> > This patch removes the interface to be used from the config and appends it
> > to the PTP4L_ARGS. With this the custom arguments can be set via
> > /etc/defaults/ptp4l.
>
> Well, you can also just as well provide your custom linuxptp.cfg in a
> rootfs overlay, no?
>

Yes this is for sure a valid solution. You mean it doesn't matter
adding a custom linuxptp.cfg or a /etc/defaults/ptp4l to change the
interface to be used because both ways need to add a file to the
rootfs overlay?

> Also, your change to linuxptp.cfg kind of breaks what is explained in
> linuxptp.cfg:
>

I think it does not break the functionality. The patch only changes
the location of the interface to be used. ptp4l can set the interface
either in the config or in the arguments.


> # By default synchronize time in slave-only mode using UDP and hardware time
> # stamps on eth0. If the difference to master is >1.0 second correct by
> # stepping the clock instead of adjusting the frequency.

I read over the mention of the interface name eth0 in the comment.


-- 
Heiko
