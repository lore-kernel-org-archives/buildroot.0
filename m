From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 29 Jun 2016 18:20:08 +0000
Subject: [Buildroot] [PATCH] Reiserfsprogs
In-Reply-To: <20160629120422.5d17355b@free-electrons.com>
References: <F9C551623D2CBB4C9488801D14F864C6EE83116F@ex-mb1.corp.adtran.com>
 <20160628181846.25cc7912@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C6EE831CFF@ex-mb1.corp.adtran.com>
 <20160629120422.5d17355b@free-electrons.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C6EE83277A@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Wednesday, June 29, 2016 5:04 AM
> To: ANDY KENNEDY
> Cc: 'buildroot at busybox.net'
> Subject: Re: [Buildroot] [PATCH] Reiserfsprogs
> 
> Hello,
> 
> On Tue, 28 Jun 2016 19:49:22 +0000, ANDY KENNEDY wrote:
> 
> > What was the formatting problem?  I'm not using git to do the formatting,
> > but a side-by-side diff of the directories.  Also, doesn't git send-email
> > require direct access to SMTP from the workstation?  I don't have that.
> >
> > And, if you want the absolute truth of the matter, I'm not a git user
> > and struggle with using it (so, pointers for the "right way" would
> > not be taken as patronizing -- I'm okay with spoon feeding).
> 
> It just didn't appear as a Git formatted patch. You should really spend
> a little bit of time learning git format-patch / send-email, you'll
> save a lot of time down the road if you use the proper workflow.
> 
> Yes, "git send-email" requires a SMTP server, but if you have a GMail
> account, then you have a SMTP server available.

Yup, I should. However, with four kids, TKD, Cub Scouts, Boy Scouts,
Girl Scouts, etc, I cannot find the time for _anything_ (though, this
is not a complaint, just a reason).

My company blocks SMTP north-bound traffic.  And, as you know,
LookOut! is HORRIBLE for plain text e-mails.  I just wanted to 
make sure that it wasn't missing tabs (as I manually have to put
those into the patch when I paste it into my e-mail since the
M$ clipboard "helps me" by replacing those EVIL tabs with more
friendly spaces).

> 
> > > > +REISERFSPROGS_LICENSE_FILES = COPYING README
> > > > +REISERFSPROGS_CONF_ENV = LIBS='-lcom_err -luuid -lpthread -lrt'
> > >
> > > This line is not needed.
> >
> > What is the preferred way to make those LDFLAGS go through?
> > I have tried it multiple ways and could only make it work
> > using the LIBS=... for the configure env.  Without this
> > line, reiserfsprogs doesn't build.
> 
> It build fine for me without it, as far as I remember.
> 
> If it really doesn't build, then we would ideally prefer a patch (which
> gets submitted upstream).

::heavy sigh::

Okay, I'll figure out how to construct that so that on -static
builds, it does the "right thing" and attempt to push it back
to Jeff.  I was hoping to side step that issue since the
LIBS=... didn't really hurt anything for dynamic builds as the
dynamic linker ignores most of those anyway.


Another question:  Having been dinged in the past for
resubmission errors, is the current proper way to construct
the resubmit:

------------------------------------------------------------
Subject:  [PATCH V2] Reiserfsprogs

reiserfsprogs: new package

Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
---
<patch contents>
------------------------------------------------------------

and should this be a reply to the original thread or
a new thread?

Thanks,
Andy


> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
