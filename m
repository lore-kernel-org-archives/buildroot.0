From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 30 Oct 2018 23:34:45 +0100
Subject: [Buildroot] alsa-utils: alsactl services are not installed
In-Reply-To: <CANTMe2VT27m=f=D=u_fD6mTYoWw7QQUcc-bFbhir0QrPV=MMtw@mail.gmail.com>
References: <CANTMe2UJhVMgxj+mSX+XiNkv=Qzb6H3rQhDOphpV7=7xVB-HYw@mail.gmail.com>
 <20181028120200.77b9aab2@gmx.net>
 <CANTMe2XmyFiQiXErMRLM2BOqQdW3iGBUqfeHtxu1Jv87vokVTA@mail.gmail.com>
 <CANTMe2VT27m=f=D=u_fD6mTYoWw7QQUcc-bFbhir0QrPV=MMtw@mail.gmail.com>
Message-ID: <20181030233445.4c44adee@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello ?????,

On Tue, 30 Oct 2018 16:10:59 +0300, ????? ?????????? <prok.tim26@gmail.com> wrote:

> Hello, Peter.
> 
> Thanks for your patch. What I did was similar but I installed the
> alsa-restore udev rules as well.
> Also, the symlinks seem to be created incorrectly:
> 
> +ln -sf ../../../../lib/systemd/alsa-restore.service \
> +
>  $(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-restore.service
> +ln -sf ../../../../lib/systemd/alsa-state.service \
> +
>  $(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-state.service
> 
> rather than
> 
> +ln -sf ../../../../lib/systemd/system/alsa-restore.service \
> +
> 
>  $(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-restore.service
> +ln -sf ../../../../lib/systemd/system/alsa-state.service \
> +
> 
>  $(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-state.service

Many thanks for testing and feedback, will fix it on next patch iteration...

> 
> Is it possible to comment on Patchwork and how can I send a patch to be
> reviewed there?

Patchwork is only collecting from the buildroot mailing list, reply to
a patch and keeping buildroot at busybox.net in CC will show up as
comment in Patchwork...

Regards,
Peter

> 
> 
> 
> On Sun, Oct 28, 2018 at 3:38 PM ????? ?????????? <prok.tim26@gmail.com>
> wrote:
> 
> > Hello, Peter.
> >
> > Thanks for your reply, I actually already did exactly that but was
> > wondering if that was really necessary or if I was missing something.
> >
> > Best regards,
> > Timur
> >
> > On Sun, Oct 28, 2018 at 2:02 PM Peter Seiderer <ps.report@gmx.net> wrote:
> >  
> >> Hello ?????,
> >>
> >> On Thu, 25 Oct 2018 11:16:35 +0300, ????? ?????????? <  
> >> prok.tim26 at gmail.com> wrote:  
> >>  
> >> > Hello,
> >> >
> >> > I'm trying to build Buildroot with systemd. alsa-utils seem to install
> >> > correctly but the alsa-restore and alsa-state services aren't installed  
> >> to  
> >> > the target directory but to the host directory only.
> >> >
> >> > It's very weird since simply copying the service files to the target
> >> > directory and installing the resulting image works properly. Is there  
> >> any  
> >> > problem with the Makefile? Using systemd v239 with alsa-utils v1.1.5  
> >>
> >> Seems no one missed the files until now ;-), try suggested patch
> >> '[PATCH v1] alsa-utils: install systemd sevice files' (see [1])...
> >>
> >> Regards,
> >> Peter
> >>
> >> [1] https://patchwork.ozlabs.org/patch/989965
> >>  
> >> >
> >> > Thank you in advance.  
> >>
> >>  
> >  
> 
