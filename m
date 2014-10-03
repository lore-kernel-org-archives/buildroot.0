From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 03 Oct 2014 16:14:04 +0200
Subject: [Buildroot] [PATCH 01/11] mesa3d: Fix package requirements
In-Reply-To: <XnsA3BB97440D8C9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
 <1412340212-3089-2-git-send-email-jezz@sysmic.org>
 <XnsA3BB97440D8C9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <3045501.26YYGqRTnd@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 03 October 2014 14:52:12 Bernd Kuhls wrote:
> =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz-
> kPcTzGkeZgAdnm+yROfE0A at public.gmane.org> wrote in
> news:1412340212-3089-2-git-
> send-email-jezz at sysmic.org:
> > +     select BR2_PACKAGE_XPROTO_DRI3PROTO if BR2_PACKAGE_XORG7
> 
> Hi,
> 
> nack, dri3 is an optional dependency.
> 
> Also having dri3 support in mesa3d breaks xbmc on intel systems:
> https://github.com/OpenELEC/OpenELEC.tv/commit/b574ad91fe9c7b9fcf627df0d5e3c
> 7 7e262a1f85
I encountered problems with dri3 dependencies during my tests. By checking 
code more closely, my problems happens only if no DRI was selected. I will fix 
that.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
