From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Jan 2017 15:37:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/fbterm: Fix building against
	libiconv
References: <20170128174916.11214-1-bernd.kuhls@t-online.de>
 <20170129142633.4ba3c0b4@free-electrons.com>
Message-ID: <dab1mdxd4l.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 29 Jan 2017 14:26:33 +0100 schrieb Thomas Petazzoni:

> Applied to master, thanks. However, this means that fbterm links against
> libiconv when available, no? So perhaps we should have:
> 
> ifeq ($(BR2_PACKAGE_LIBICONV),y)
> FBTERM_DEPENDENCIES += libiconv endif
> 
> in fbterm.mk ?

Hi,

I think this is not needed, because fbterm depends on BR2_ENABLE_LOCALE, 
while libiconv depends on !BR2_ENABLE_LOCALE. The build error occured 
while including iconv.h from uClibc.

Regards, Bernd
