From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 6 Sep 2011 20:40:21 +0000
Subject: [Buildroot] package/Makefile.in STRIP in target config options.
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C605660F@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C605660F@ex-mb1.corp.adtran.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C605C25F@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump.

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of ANDY KENNEDY
> Sent: Friday, August 26, 2011 1:05 AM
> To: buildroot at busybox.net
> Subject: [Buildroot] package/Makefile.in STRIP in target config
> options.
> 
> Below is a snippet from Makefile.in in the package dir.  While
> looking
> through the file to determine how best to write a configure script
> that
> would work well with BuildRoot, I came across this strangeness.  If
> this is by design, I would wonder why we take the time to make the
> variable STRIPCMD.  Note that in the TARGET_CONFIGURE_OPTS we set
> STRIP
> to only $(TARGET_STRIP).
> 
> I'm thinking this is an oops in the assignment of
> STRIP=$(TARGET_STRIP) or perhaps there was an intent to reassign
> TARGET_STRIP after the STRIPCMD was created.
> 
> Please advise.
> 
> Andy
> 
> 
> ifeq ($(BR2_STRIP_strip),y)
> STRIP_DISCARD_ALL:=--discard-all
> STRIP_STRIP_UNNEEDED:=--strip-unneeded
> STRIP_STRIP_ALL:=--strip-all
> TARGET_STRIP=$(TARGET_CROSS)strip
> STRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-
> section=.note
> KSTRIPCMD=$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
> endif
> ifeq ($(BR2_STRIP_sstrip),y)
> STRIP_DISCARD_ALL:=
> STRIP_STRIP_UNNEEDED:=
> STRIP_STRIP_ALL:=
> TARGET_STRIP=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
> STRIPCMD=$(TARGET_STRIP)
> KSTRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-
> section=.note --strip-unneeded
> endif
> ifeq ($(BR2_STRIP_none),y)
> TARGET_STRIP=true
> STRIPCMD=$(TARGET_STRIP)
> KSTRIPCMD=$(TARGET_STRIP)
> endif
> <snip>
> TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
> <snip>
>                 STRIP="$(TARGET_STRIP)" \
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
