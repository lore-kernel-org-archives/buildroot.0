From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 5 Apr 2021 16:45:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: enable qcom-soc
 if libqrtr-glib enabled
In-Reply-To: <20210405163630.577ec83a@windsurf.home>
References: <20210404184126.974098-1-petr.vorel@gmail.com>
 <20210405110250.1e48e10f@windsurf.home>
 <YGsULQK650v0NBsV@pevik> <20210405163630.577ec83a@windsurf.home>
Message-ID: <CAAP7ucJuh-y80YWqDyvCv+uDekc2+mg-KZ+-2QT=p7x-2z+jSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 5 Apr 2021, 16:36 Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

> On Mon, 5 Apr 2021 15:44:13 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:
>
> > > > +ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
> > > > +MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc
> >
> > > Isn't that missing a MODEM_MANAGER_DEPENDENCIES += libqrtr-glib line ?
> > > Or is it really a runtime dependency ?
> > Actually verified locally on buildroot, it works as is.
> > (no need for MODEM_MANAGER_DEPENDENCIES += libqrtr-glib).
> >
> > Thus I've updated patchwork status to NEW.
>
> How can this work? Does it dlopen() the libqrtr-glib library at
> runtime? This deserves some explanation as we would normally imagine
> that to be a build-time dependency.
>


It's probably too soon to add libqrtr-glib as a dependency of MM, the QRTR
support is not even in MM git master yet (likely this week).

libqrtr-glib is right now only a dependency of libqmi, I think we should
focus on that. Let's add the MM build-time dependency once there is a MM
release with QRTR support.

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210405/9651a2ae/attachment.html>
