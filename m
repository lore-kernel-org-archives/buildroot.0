From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Wed, 2 Dec 2015 07:00:24 -0600
Subject: [Buildroot] [PATCH v6] package/unscd: new package
In-Reply-To: <20151201224506.6555d6b5@free-electrons.com>
References: <1448982954-5055-1-git-send-email-rdkehn@yahoo.com>
 <565E130B.7090201@mind.be>
 <20151201224506.6555d6b5@free-electrons.com>
Message-ID: <20151202130024.GA547@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and Arnout,

On Tue, Dec 01, 2015 at 10:45:06PM +0100, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Tue, 1 Dec 2015 22:37:15 +0100, Arnout Vandecappelle wrote:
> 
> > > +define UNSCD_EXTRACT_CMDS
> > > +	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/nscd.c
> > > +endef
> > > +
> > > +define UNSCD_BUILD_CMDS
> > > +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) nscd
> > 
> >  Although it works because of the default rules, it looks very strange to me to
> > call make when there is no Makefile. I would instead call the compiler directly:
> > 
> > 	cd $(@D); \
> > 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o nscd nscd.c
> > 
> >  What do the others think?
> 
> Fully agree with you.

I will change as suggested. For what it's worth, I was following the
whetstone recipe (which is also a single source file).

Regards,
...doug
