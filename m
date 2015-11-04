From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 4 Nov 2015 12:31:55 +0100
Subject: [Buildroot] [PATCH v3 11/13] package/dhcp: systemd: support
	IPv6 lease file
In-Reply-To: <5639E8D9.7060109@wsystem.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-11-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivxGsOm8DRoBsqDAMHx3dkC381C5TvXq_peYiKd1yizyvg@mail.gmail.com>
 <5639DF94.4000505@wsystem.com>
 <CAGduivyAygSdLT1pmrOCD7mHO8xC2UvHOP2rAk2MnChhPMHmiw@mail.gmail.com>
 <5639E8D9.7060109@wsystem.com>
Message-ID: <CAGduivz2ChrAgNgxM-a33JN_Eh7aFsfSKpq_vT0hRd7sNTt_zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[-SNIP-]

>
> >     A single instance of dhcpd cannot be run with
> >     both '-4' and '-6'. I don't know if it's possible (or desirable) to
> safely run
> >     simultaneously two instances of dhcpd, one with '-4' and the other
> one with
> >     '-6'.
> >
> > Well it could be useful if you are trying to build a network appliance
> and you want to support both stack. So you would want to start two
> processes with different options. Maybe that's something that should be
> left to the users to figure out.
>
> Yes, but should everything be duplicated in Buildroot just for this
> purpose? For
> SysV, it's easy not to duplicate things, but how would you do that with
> systemd?
> How do distributions handle this?
>
I only looked at Arch Linux, they duplicate the service file. It's also
possible to use the template mechanisms in systemd, to have something like
dhcpd at .service and when you enable it, you create a symlink called
dhcpd at 4.service, and the '4' is passed as argument to the template and you
can use it however you want it to.

>
> >     "$OPTIONS" is designed exactly for such things. Users should read
> the man page
> >     of dhcpd to know what may fit in there.
> >
> > I understood what was "$OPTIONS" about, I just worry that it's a bit
> "hidden" for the users, but maybe they should know what they are doing.
>
> It's not possible to document everything, but there are comments about the
> meaning of these variables in the SysV init scripts, so I can add such
> comments
> to the .service files too.
>
Maybe that would be a good thing, I don't have a clear opinion on this, do
other want to weigh in ?

>
> Best regards,
> Beno?t
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/d07e34d5/attachment.html>
