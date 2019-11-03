From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 3 Nov 2019 06:51:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix service
 installation
In-Reply-To: <20191102222736.1179b419@windsurf.home>
References: <20191102151726.7341-1-petr.vorel@gmail.com>
 <20191102222736.1179b419@windsurf.home>
Message-ID: <20191103055136.GA1241@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> >  define IPUTILS_INSTALL_SERVICE_NINFOD
> > +	$(INSTALL) -D -m 0644 $(@D)/systemd/ninfod.service.in \
> > +		$(TARGET_DIR)/usr/lib/systemd/system/ninfod.service

> This cannot be right: ninfod.service.in contains @sbindir@ that needs
> to be replaced before being installed.
I'm sorry to overlook that. If it's ok to be replaced by sed/awk
I'll send a new patch.
Or we can wait for a proper fix in upstream.

Kind regards,
Petr
