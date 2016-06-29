From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2016 12:04:22 +0200
Subject: [Buildroot] [PATCH] Reiserfsprogs
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6EE831CFF@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6EE83116F@ex-mb1.corp.adtran.com>
 <20160628181846.25cc7912@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C6EE831CFF@ex-mb1.corp.adtran.com>
Message-ID: <20160629120422.5d17355b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Jun 2016 19:49:22 +0000, ANDY KENNEDY wrote:

> What was the formatting problem?  I'm not using git to do the formatting,
> but a side-by-side diff of the directories.  Also, doesn't git send-email
> require direct access to SMTP from the workstation?  I don't have that.
> 
> And, if you want the absolute truth of the matter, I'm not a git user
> and struggle with using it (so, pointers for the "right way" would
> not be taken as patronizing -- I'm okay with spoon feeding).

It just didn't appear as a Git formatted patch. You should really spend
a little bit of time learning git format-patch / send-email, you'll
save a lot of time down the road if you use the proper workflow.

Yes, "git send-email" requires a SMTP server, but if you have a GMail
account, then you have a SMTP server available.

> > > +REISERFSPROGS_LICENSE_FILES = COPYING README
> > > +REISERFSPROGS_CONF_ENV = LIBS='-lcom_err -luuid -lpthread -lrt'  
> > 
> > This line is not needed.  
> 
> What is the preferred way to make those LDFLAGS go through?
> I have tried it multiple ways and could only make it work
> using the LIBS=... for the configure env.  Without this
> line, reiserfsprogs doesn't build.

It build fine for me without it, as far as I remember.

If it really doesn't build, then we would ideally prefer a patch (which
gets submitted upstream).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
