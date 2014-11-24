From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 21:42:21 +0100
Subject: [Buildroot] [PATCH 46/51] live555: add error handling to for
 loop
In-Reply-To: <20141124052536.GC2241@tarshish>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1416775163-20215-47-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141124052536.GC2241@tarshish>
Message-ID: <20141124214221.32ca4520@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 24 Nov 2014 07:25:36 +0200, Baruch Siach wrote:

> >  define LIVE555_INSTALL_STAGING_CMDS
> >  	for i in $(LIVE555_HEADERS_TO_INSTALL); do \
> > -		mkdir -p $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
> > -		cp -a $(@D)/$$i/* $(STAGING_DIR)/usr/include/live/`dirname $$i`; \
> > +		mkdir -p $(STAGING_DIR)/usr/include/live/`dirname $$i` && \
> > +		cp -a $(@D)/$$i/* $(STAGING_DIR)/usr/include/live/`dirname $$i` || exit 1 \
> >  	done; \
> >  	for i in $(LIVE555_LIBS_TO_INSTALL); do \
> > -		$(INSTALL) -D -m 0755 $(@D)/$$i $(STAGING_DIR)/usr/lib/`basename $$i`; \
> > +		$(INSTALL) -D -m 0755 $(@D)/$$i $(STAGING_DIR)/usr/lib/`basename $$i` || exit 1 \
> >  	done
> >  endef
> 
> Both 'for' loop in LIVE555_INSTALL_STAGING_CMDS were removed in next.

Ah right, for this patch I'll have to rebase on next. Thanks for
noticing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
