From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 07 Aug 2016 17:34:56 +0200
Subject: [Buildroot] [PATCH 1/1]
 package/x11r7/xserver_xorg-server:	needs dri/dri2/dri3 for libdrm support
References: <1469968714-27285-1-git-send-email-bernd.kuhls@t-online.de>
 <87a8gxqzbs.fsf@dell.be.48ers.dk>
Message-ID: <021k7dx4qi.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am Sun, 31 Jul 2016 23:20:39 +0200 schrieb Peter Korsgaard:

>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

>  > +config BR2_PACKAGE_XSERVER_XORG_SERVER_NEEDS_LIBDRM
>  > +	bool
>  > +	select BR2_PACKAGE_LIBDRM
> 
> Why the extra redirection with this symbol instead of just directly
> using LIBDRM?

because libdrm can be enabled without one of the driproto packages
being enabled at the same time, X.org xserver needs both to provide
dri support.

Regards, Bernd
