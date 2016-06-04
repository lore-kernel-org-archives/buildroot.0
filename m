From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 04 Jun 2016 18:41:49 +0200
Subject: [Buildroot] [PATCH 1/1]
	package/x11r7/xdriver_xf86-video-fbturbo: needs dri2 for libump
References: <1464455839-473-1-git-send-email-bernd.kuhls@t-online.de>
 <87y46quffx.fsf@dell.be.48ers.dk>
Message-ID: <XnsA61DBE325C7EEID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi Peter,

Peter Korsgaard <peter@korsgaard.com> wrote in
news:87y46quffx.fsf at dell.be.48ers.dk: 

> > +ifeq ($(BR2_PACKAGE_LIBUMP),y)
> > +XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES += libump
> > +endif
> 
> We should also ensure dri2proto gets built before fbturbo, so I've added
> it to _DEPENDENCIES as well and committed, thanks.

imho this was not necessary, xdriver_xf86-video-fbturbo depends on the
modular xserver_xorg-server 

https://git.busybox.net/buildroot/tree/package/x11r7/Config.in#n147
https://git.busybox.net/buildroot/tree/package/x11r7/Config.in#n164

which already takes care of dri2proto:

https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/xs
erver_xorg-server.mk#n207 

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri2

Regards, Bernd
