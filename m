From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 16:00:49 +0200
Subject: [Buildroot] [PATCH 1/1] allow xserver without the systemd login
	daemon.
References: <1427548538-7789-1-git-send-email-sagaert.johan@proximus.be>
 <20150329150827.4491e5d4@free-electrons.com>
Message-ID: <XnsA46CA2E642553berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150329150827.4491e5d4 at free-electrons.com:

> You should pass both the enabling and disabling options, and use
> BR2_PACKAGE_SYSTEMD for the condition.
> 
> I believe something like:
> 
> ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> XSERVER_XORG_CONF_OPTS += \
>      --with-systemd-daemon \
>      --enable-systemd-logind
> else
> XSERVER_XORG_CONF_OPTS += \
>      --without-systemd-daemon \
>      --disable-systemd-logind
> endif
> 
> would be more appropriate, but I'd like to have some feedback from a
> X.org person. Bernd, can you comment on this?

Hi,

unfortunately I have no experience in this matter, because I am not using 
systemd in my buildroot environment. But your proposal looks sane.

Regards, Bernd
