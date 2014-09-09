From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 9 Sep 2014 19:17:37 +0000
Subject: [Buildroot] [PATCH] openssh: fix static linking
In-Reply-To: <20140909183735.GY2522@tarshish>
References: <F9C551623D2CBB4C9488801D14F864C68C8AE2F4@ex-mb3.corp.adtran.com>
 <20140909183735.GY2522@tarshish>
Message-ID: <F9C551623D2CBB4C9488801D14F864C68C8AE33F@ex-mb3.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > -OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
> > +OPENSSH_CONF_ENV = LD="$(TARGET_CC)"
> >  OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \

> > +OPENSSH_CONFIGURE_ENV += LDFLAGS="$(OPENSSH_LDFLAGS_FOR_CONF)"
> 
> Shouldn't this be OPENSSH_CONF_ENV? Have you tested this?
> 
> baruch

Yes, and yes.  Hmmm, that's strange.  Kinda makes me wonder why
that worked at all.  Made that modification and retesting.

Like I said in the other thread, this works about once out of
three times anyway.  So, maybe I didn't do what I thought I did.

I assume that the LDFLAGS=$(TARGET_CFLAGS) are needed, and that
it _could_ break the build on other platforms.  I don't understand
why that would have worked for this particular platform I'm on.

I'll resubmit when I verify the fix.

Andy
