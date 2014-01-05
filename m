From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Jan 2014 21:54:55 +0100
Subject: [Buildroot] [PATCH 03/36] xorg: xapp_xdpyinfo also depends on
	xlib_libXinerama & xlib_libXcomposite
In-Reply-To: <BLU0-SMTP384462B279D0C0F5F6433E9D9B50@phx.gbl> (Bernd Kuhls's
 message of "Sat, 4 Jan 2014 14:38:32 +0100")
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP384462B279D0C0F5F6433E9D9B50@phx.gbl>
Message-ID: <87eh4m5eu8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > snippet from configure:
 > checking for DPY_XCOMPOSITE... yes
 > checking for X11/extensions/Xcomposite.h... yes
 > checking for DPY_XINERAMA... yes
 > checking for X11/extensions/Xinerama.h... yes

Yes, but they are optional so we shouldn't force them (and if they were
required, there should be matching 'select' lines in Config.in).

I've committed a patch to clean up the list of dependencies and add
optional support for xcomposite / xinerama.

-- 
Bye, Peter Korsgaard
