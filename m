From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Apr 2021 16:36:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: enable qcom-soc
 if libqrtr-glib enabled
In-Reply-To: <YGsULQK650v0NBsV@pevik>
References: <20210404184126.974098-1-petr.vorel@gmail.com>
 <20210405110250.1e48e10f@windsurf.home> <YGsULQK650v0NBsV@pevik>
Message-ID: <20210405163630.577ec83a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 5 Apr 2021 15:44:13 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> > > +ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
> > > +MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc  
> 
> > Isn't that missing a MODEM_MANAGER_DEPENDENCIES += libqrtr-glib line ?
> > Or is it really a runtime dependency ?  
> Actually verified locally on buildroot, it works as is.
> (no need for MODEM_MANAGER_DEPENDENCIES += libqrtr-glib).
> 
> Thus I've updated patchwork status to NEW.

How can this work? Does it dlopen() the libqrtr-glib library at
runtime? This deserves some explanation as we would normally imagine
that to be a build-time dependency.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
